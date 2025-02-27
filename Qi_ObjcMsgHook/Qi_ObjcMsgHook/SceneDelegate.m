#import "SceneDelegate.h"
#import "QiRootViewController.h"
#import "QiCallTrace.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    if (@available(iOS 13.0, *)) {
        
        [QiCallTrace start];
        
        UIWindowScene *windowScene = (UIWindowScene *)scene;
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.window setWindowScene:windowScene];
        [self.window setBackgroundColor:UIColor.whiteColor];
        
        QiRootViewController *rootVC = [[QiRootViewController alloc] init];
        UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController: rootVC];
        self.window.rootViewController = homeNav;
        [self.window makeKeyAndVisible];
        [self log1to999999999add];
                
        [QiCallTrace stop];
        [QiCallTrace save];
    }
}

- (void)log1to999999999add {
    NSInteger res = 0;
    for (NSInteger i = 0; i < 999999999; i ++) {
        res += i;
    }
    NSLog(@"%ld", res);
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
