
#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    ViewController *controlador = [[ViewController alloc] init];
    UINavigationController *navegacion =
        [[UINavigationController alloc] initWithRootViewController:controlador];

    self.window.rootViewController = navegacion;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
