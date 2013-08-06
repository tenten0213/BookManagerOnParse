
#import "Parse/Parse.h"
#import "ParseStarterProjectAppDelegate.h"
#import "MyTableController.h"

@implementation ParseStarterProjectAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // ****************************************************************************
    // Uncomment and fill in with your Parse credentials:
    [Parse setApplicationId:@"lhz1ZJnmkKEpIcpPrTPnYD3OjdJtfGNY3LJyP60n" clientKey:@"1B2gxeE9V3NLnInfpFftyEe11JPg1er8PsrAmGNd"];

    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    // Override point for customization after application launch.

    /* コードで初期化していた処理を無効化
    MyTableController *controller = [[MyTableController alloc] init];
  
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
     */
    
    // Let's make an object each launch, so there's definitely something to display.
   /*
    PFObject *object = [PFObject objectWithClassName:@"Todo"];
    [object setObject:@"Sample Text" forKey:@"text"];
    [object setObject:@1 forKey:@"priority"];
    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        // Refresh the table when the object is done saving.
        // そもそもデータが無いので、コメントアウトしておく。
        UINavigationController *uinav = (UINavigationController *)self.window.rootViewController;
        MyTableController *myTable = (MyTableController *)[uinav topViewController];
        [myTable loadObjects];
    }];
    */
  
    return YES;
}

@end
