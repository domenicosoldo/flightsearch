//
//  FlightServices.h
//  Flight Search
//
//  Created by Domenico Soldo on 4/06/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetworkCompletionBlock)(BOOL successful, NSError* error);
typedef void(^NetworkCompletionBlockWithList)(NSArray* data, NSError* error);

@interface FlightServices : NSObject

/*
 @param departureAirport, arrivalAirport, departureDate, returnDate
 execute a POST request to the searchFlight service
 */
+ (void)postSearchFlightRequest:(NSString *)departureAirport arrivalAirport:(NSString *)arrivalAirport departureDate:(NSDate *)departureDate returnDate:(NSDate *)returnDate completion:(NetworkCompletionBlockWithList)completion;

@end
