

#import "DetailViewController.h"
#import "Book.h"
#import "EditingViewController.h"


@interface DetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@property (nonatomic, weak) IBOutlet UILabel *copyrightLabel;

@end


#pragma mark -

@implementation DetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if ([self class] == [DetailViewController class]) {
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }
    
    self.tableView.allowsSelectionDuringEditing = YES;
    
    // if the local changes behind our back, we need to be notified so we can update the date
    // format in the table view cells
    //
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(localeChanged:)
                                                 name:NSCurrentLocaleDidChangeNotification
                                               object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:NSCurrentLocaleDidChangeNotification
                                                  object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    // Redisplay the data.    
    [self updateInterface];    
    [self updateRightBarButtonItemState];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    [super setEditing:editing animated:animated];
    
    // Hide the back button when editing starts, and show it again when editing finishes.
    [self.navigationItem setHidesBackButton:editing animated:animated];
    
    /*
     When editing starts, create and set an undo manager to track edits. Then register as an observer of undo manager change notifications, so that if an undo or redo operation is performed, the table view can be reloaded.
     When editing ends, de-register from the notification center and remove the undo manager, and save the changes.
     */
    if (editing) {
        [self setUpUndoManager];
    }
    else {
        [self cleanUpUndoManager];
        // Save the changes.
        NSError *error;
        if (![self.book.managedObjectContext save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (void)updateInterface {
    
    self.authorLabel.text = self.book.author;
    self.titleLabel.text = self.book.title;
    self.copyrightLabel.text = [self.dateFormatter stringFromDate:self.book.copyright];
}

- (void)updateRightBarButtonItemState {
    
    // Conditionally enable the right bar button item -- it should only be enabled if the book is in a valid state for saving.
    self.navigationItem.rightBarButtonItem.enabled = [self.book validateForUpdate:NULL];
}    


#pragma mark - UITableViewDelegate

- (NSIndexPath *)tableView:(UITableView *)tv willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Only allow selection if editing.
    if (self.editing) {
        return indexPath;
    }
    return nil;
}

/*
 Manage row selection: If a row is selected, create a new editing view controller to edit the property associated with the selected row.
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.editing) {
        [self performSegueWithIdentifier:@"EditSelectedItem" sender:self];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return NO;
}


#pragma mark - Undo support

- (void)setUpUndoManager {
    
    /*
     If the book's managed object context doesn't already have an undo manager, then create one and set it for the context and self.
     The view controller needs to keep a reference to the undo manager it creates so that it can determine whether to remove the undo manager when editing finishes.
     */
    if (self.book.managedObjectContext.undoManager == nil) {
        
        NSUndoManager *anUndoManager = [[NSUndoManager alloc] init];
        [anUndoManager setLevelsOfUndo:3];
        self.book.managedObjectContext.undoManager = anUndoManager;
    }
    
    // Register as an observer of the book's context's undo manager.
    NSUndoManager *bookUndoManager = self.book.managedObjectContext.undoManager;
    
    NSNotificationCenter *dnc = [NSNotificationCenter defaultCenter];
    [dnc addObserver:self selector:@selector(undoManagerDidUndo:) name:NSUndoManagerDidUndoChangeNotification object:bookUndoManager];
    [dnc addObserver:self selector:@selector(undoManagerDidRedo:) name:NSUndoManagerDidRedoChangeNotification object:bookUndoManager];
}

- (void)cleanUpUndoManager {
    
    // Remove self as an observer.
    NSUndoManager *bookUndoManager = self.book.managedObjectContext.undoManager;

    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSUndoManagerDidUndoChangeNotification object:bookUndoManager];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSUndoManagerDidRedoChangeNotification object:bookUndoManager];

    self.book.managedObjectContext.undoManager = nil;
}

- (NSUndoManager *)undoManager {
    
    return self.book.managedObjectContext.undoManager;
}

- (void)undoManagerDidUndo:(NSNotification *)notification {

    // Redisplay the data.    
    [self updateInterface];
    [self updateRightBarButtonItemState];
}

- (void)undoManagerDidRedo:(NSNotification *)notification {

    // Redisplay the data.    
    [self updateInterface];
    [self updateRightBarButtonItemState];
}

/*
 The view controller must be first responder in order to be able to receive shake events for undo. It should resign first responder status when it disappears.
 */
- (BOOL)canBecomeFirstResponder {
    
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [self resignFirstResponder];
}


#pragma mark - Date Formatter

- (NSDateFormatter *)dateFormatter {
    
    static NSDateFormatter *dateFormatter = nil;
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    }
    return dateFormatter;
}


#pragma mark - Segue management

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"EditSelectedItem"]) {
        
        EditingViewController *controller = (EditingViewController *)[segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        controller.editedObject = self.book;
        switch (indexPath.row) {
            case 0: {
                controller.editedFieldKey = @"title";
                controller.editedFieldName = NSLocalizedString(@"title", @"display name for title");
            } break;
            case 1: {
                controller.editedFieldKey = @"author";
                controller.editedFieldName = NSLocalizedString(@"author", @"display name for author");
            } break;
            case 2: {
                controller.editedFieldKey = @"copyright";
                controller.editedFieldName = NSLocalizedString(@"copyright", @"display name for copyright");
            } break;
        }    
    }
}


#pragma mark - Locale changes

- (void)localeChanged:(NSNotification *)notif
{
    // the user changed the locale (region format) in Settings, so we are notified here to
    // update the date format in the table view cells
    //
    [self updateInterface];
}

@end

