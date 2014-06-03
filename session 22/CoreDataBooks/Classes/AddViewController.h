
#import "DetailViewController.h"


@protocol AddViewControllerDelegate;


@interface AddViewController : DetailViewController 

@property (nonatomic, weak) id <AddViewControllerDelegate> delegate;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end


@protocol AddViewControllerDelegate
- (void)addViewController:(AddViewController *)controller didFinishWithSave:(BOOL)save;
@end

