

@class Book;

@interface DetailViewController : UITableViewController

@property (nonatomic, strong) Book *book;

@end


// These methods are used by the AddViewController, so are declared here, but they are private to these classes.

@interface DetailViewController (Private)

- (void)setUpUndoManager;
- (void)cleanUpUndoManager;

@end