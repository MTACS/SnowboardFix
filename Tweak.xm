#import <UIKit/UIKit.h>

@interface SBHLibraryViewController : UIViewController
@end

@interface SBFloatingDockController : NSObject
@end

@interface SBFloatingDockBehaviorAssertion : NSObject
@property (nonatomic, readonly) SBFloatingDockController *floatingDockController;
@end

@interface SBHomeScreenViewController : UIViewController
@property (nonatomic) SBFloatingDockBehaviorAssertion *homeScreenFloatingDockAssertion;
@end

@interface SBIconController: NSObject
@property (retain, nonatomic) SBHLibraryViewController *overlayLibraryViewController;
@property (nonatomic) SBHomeScreenViewController *parentViewController;
- (id)libraryViewController;
@end

%hook SBIconController
%new
- (SBHLibraryViewController *)libraryViewController {
    return self.overlayLibraryViewController;
}
%new
- (id)floatingDockController {
    return [[(SBHomeScreenViewController *)[self parentViewController] homeScreenFloatingDockAssertion] floatingDockController];
}
%end
