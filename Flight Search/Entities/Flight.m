//
//  Flight.m
//  Flight Search
//
//  Created by Domenico Soldo on 3/06/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import "Flight.h"

@implementation Flight

- (instancetype)initWithJSON:(NSDictionary*)json
{
    self = [super init];
    self.airlineLogoAddress = json[@"AirlineLogoAddress"];
    self.airlineName = json[@"AirlineName"];
    self.inboundFlightsDuration = json[@"InboundFlightsDuration"];
    self.outboundFlightDuration = json[@"OutboundFlightsDuration"];
    self.itineraryId = json[@"ItineraryId"];
    self.stops = [json[@"Stops"] integerValue];
    self.totalAmount = [json[@"TotalAmount"] doubleValue];
    return self;
}

@end
