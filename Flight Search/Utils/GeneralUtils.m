//
//  GeneralUtils.m
//  Flight Search
//
//  Created by Domenico Soldo on 5/08/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import "GeneralUtils.h"

@implementation GeneralUtils

+ (NSString *)getDateFormatted:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    return [dateFormatter stringFromDate:date];
}

@end
