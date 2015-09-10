//
//  ResearchFlightsTests.m
//  Flight Search
//
//  Created by Domenico Soldo on 5/06/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NetworkUtils.h"
#import "FlightServices.h"

@interface ResearchFlightsTests : XCTestCase
@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) NSError *error;
@end

@implementation ResearchFlightsTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSearchFlightsService {
    NSString *departureAirport = @"MEI";
    NSString *arrivalAirport = @"LHR";
    NSDate *departureDate = [NSDate date];
    NSDate *returnDate = [NSDate date];
    
    //Expectation
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing Async Method Works Correctly!"];
    
    [FlightServices postSearchFlightRequest:departureAirport arrivalAirport:arrivalAirport departureDate:departureDate returnDate:returnDate completion:^(NSArray* data, NSError* error) {
        if(error) {
            NSLog(@"error is: %@", error);
        } else {
            self.data = data;
            self.error = error;
            [expectation fulfill];
        }
    }];
    
  
    
    //Wait 1 second for fulfill method called, otherwise fail:
    [self waitForExpectationsWithTimeout:100 handler:^(NSError *error) {
        if(error) {
            XCTFail(@"Expectation Failed with error: %@", error);
        } else {
            XCTAssertNil(self.error, @"There was a problem searching flights. Check your Internet connection and try again.");
            XCTAssertTrue(self.data.count > 0, @"The service return no data");
        }
        
    }];
}

@end
