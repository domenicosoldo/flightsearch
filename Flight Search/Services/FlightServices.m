//
//  FlightServices.m
//  Flight Search
//
//  Created by Domenico Soldo on 4/06/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import "FlightServices.h"
#import "AFNetworking.h"
#import "NetworkUtils.h"



typedef void(^APISuccessBlock)(AFHTTPRequestOperation* operation, id responseObject);
typedef void(^APIFailureBlock)(AFHTTPRequestOperation* operation, NSError* error);

@implementation FlightServices


#pragma mark - API Calls

+ (void)postSearchFlightRequest:(NSString *)departureAirport arrivalAirport:(NSString *)arrivalAirport departureDate:(NSDate *)departureDate returnDate:(NSDate *)returnDate completion:(NetworkCompletionBlockWithList)completion
{
    NSDictionary *params = @{ @"DepartureAirportCode":departureAirport, @"ArrivalAirportCode":arrivalAirport, @"DepartureDate": [GeneralUtils getDateFormatted:departureDate], @"ReturnDate":[GeneralUtils getDateFormatted:returnDate] };
    [NetworkUtils submitAction:HTTPActionGet resource:@"Flight" params:[params mutableCopy] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completion(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, [NetworkUtils errorWithOperation:operation code:APIFlightsSearch defaultMessage:NSLocalizedString(@"There was a problem searching flights. Check your Internet connection and try again.", nil) error:error]);
    }];
}


@end
