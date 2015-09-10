//
//  DataManager.m
//  Flight Search
//
//  Created by Domenico Soldo on 4/06/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import "DataManager.h"

static DataManager* instance;

@implementation DataManager
+ (DataManager *)instance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [DataManager new];
    });
    return instance;
}

- (id)init {
    return self;
}


@end
