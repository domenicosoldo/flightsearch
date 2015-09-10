//
//  NetworkUtils.h
//  Flight Search
//
//  Created by Domenico Soldo on 4/06/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Constants.h"
#import "GeneralUtils.h"

typedef enum : NSUInteger {
    HTTPActionGet,
    HTTPActionPost,
    HTTPActionPatch,
    HTTPActionPut,
    HTTPActionDelete,
} HTTPAction;

typedef enum : NSUInteger {
    APIFlightsSearch,
} APIErrorCodes;

typedef void(^APISuccessBlock)(AFHTTPRequestOperation* operation, id responseObject);
typedef void(^APIFailureBlock)(AFHTTPRequestOperation* operation, NSError* error);


@interface NetworkUtils : NSObject

/*
 @param HTTPAction action, NSString resource, NSDictionary params
 Send a network request to the resourse with params
 */
+ (void)submitAction:(HTTPAction)action resource:(NSString*)resource params:(NSDictionary*)params success:(APISuccessBlock)success failure:(APIFailureBlock)failure;

+ (NSError*) errorWithOperation:(AFHTTPRequestOperation*)operation code:(NSUInteger)errorCode defaultMessage:(NSString*)message error:(NSError*)error;

//Return true if is the staging server
+ (BOOL)isTesting;

@end
