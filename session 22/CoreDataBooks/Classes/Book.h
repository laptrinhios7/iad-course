
#import <CoreData/CoreData.h>

@interface Book : NSManagedObject  

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSDate *copyright;

@end


