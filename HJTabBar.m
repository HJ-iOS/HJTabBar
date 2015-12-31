

#import "HJTabBar.h"


@interface HJTabBar()
@property (nonatomic, weak) UIButton *button;
@end

@implementation HJTabBar
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatButton];
    }
    return self;
}
- (void)creatButton{
    UIButton *button = [[UIButton alloc]init];
    
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    
    [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    self.button = button;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    int index = 0;
    CGFloat buttonW = self.frame.size.width / (self.items.count + 1);
    CGFloat buttonH = self.frame.size.height;
    
    for ( UIView *tabbar in self.subviews) {
        //如果 不是UITabBatButton 直接跳过
        if (![tabbar isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        //根据索引调整位置
        
        CGRect temp = tabbar.frame;
        temp.size.width = buttonW;
        temp.size.height = buttonH;
        if (index >=2 ) {
            temp.origin.x = tabbar.frame.size.width * (index + 1);
        }else{
            temp.origin.x = tabbar.frame.size.width * index;
        }
        temp.origin.y = 0;
        index ++;
    }
    
//设置按钮
    CGRect buttonSize = _button.frame;
    buttonSize.size = self.button.currentBackgroundImage.size;
    _button.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    
    
}
- (void)buttonClick{
    //如果代理有这个方法
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickedPlusButton:)]) {
        [self.delegate tabBarDidClickedPlusButton:self];
    }
    
    
}
@end
