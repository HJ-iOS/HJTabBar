

#import <UIKit/UIKit.h>
@class HJTabBar;
@protocol HJTabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickedPlusButton:(HJTabBar *)tabbar;
@end

@interface HJTabBar : UITabBar
@property (nonatomic , weak) id <HJTabBarDelegate> delegate;
@end
