//
//  DataManager.h
//  Flight Search
//
//  Created by Domenico Soldo on 4/06/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Flight.h"

@interface DataManager : NSObject
+ (DataManager*)instance;

@property(nonatomic, strong) NSArray *flights;

@end
