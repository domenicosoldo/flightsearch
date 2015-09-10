//
//  Categories.h
//  Flight Search
//
//  Created by Domenico Soldo on 5/08/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Constants.h"

@interface UIColor (FlightsColors)
+ (UIColor *)FlightsLightBluColor;
+ (UIColor *)FlightsDarkBlueColor;
@end

@interface UIButton (FlightsButtons)
+ (UIBarButtonItem *)buttonForNavbar:(NSString *)imageName target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)backButtonForController:(UIViewController *)controller;
@end

@interface UIViewController (FlightsViewController)
- (void)onBack:(UIButton *)sender;
@end