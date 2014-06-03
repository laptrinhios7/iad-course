

#import "AddViewController.h"

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate, AddViewControllerDelegate> 

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
