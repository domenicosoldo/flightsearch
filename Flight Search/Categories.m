//
//  Categories.m
//  Flight Search
//
//  Created by Domenico Soldo on 5/08/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import "Categories.h"

@implementation UIColor (FlightsColors)

+ (UIColor *)FlightsLightBluColor
{ return [UIColor colorWithRed:0.343 green:0.558 blue:0.722 alpha:1.0]; }

+ (UIColor *)FlightsDarkBlueColor
{ return [UIColor colorWithRed:0.113 green:0.281 blue:0.461 alpha:1.0]; }

@end

@implementation UIButton (FlightsButtons)

+ (UIBarButtonItem *)buttonForNavbar:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIImage* buttonImage = [UIImage imageNamed:imageName];
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)backButtonForController:(UIViewController *)controller {
    return [UIButton buttonForNavbar:@"button_back" target:controller action:@selector(onBack:)];
}
@end

@implementation UIViewController (FlightsViewController)
- (void)onBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
