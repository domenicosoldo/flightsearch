//
//  Flight.h
//  Flight Search
//
//  Created by Domenico Soldo on 3/06/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flight : NSObject

@property (strong, nonatomic) NSString* airlineLogoAddress;
@property (strong, nonatomic) NSString* airlineName;
@property (strong, nonatomic) NSString* inboundFlightsDuration;
@property (strong, nonatomic) NSString* outboundFlightDuration;
@property (strong, nonatomic) NSString* itineraryId;
@property (assign, nonatomic) NSInteger stops;
@property (assign, nonatomic) NSInteger totalAmount;

- (instancetype)initWithJSON:(NSDictionary*)json;
@end
