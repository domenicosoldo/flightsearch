//
//  NetworkUtils.m
//  Flight Search
//
//  Created by Domenico Soldo on 4/06/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import "NetworkUtils.h"

static NSString* const ServerStaging    = @"";
static NSString* const ServerProduction = @"http://nmflightservice.cloudapp.net/api";

//Define server production or test
#define ServerDomain ServerProduction


@implementation NetworkUtils

+ (void)submitAction:(HTTPAction)action resource:(NSString*)resource params:(NSDictionary*)params success:(APISuccessBlock)success failure:(APIFailureBlock)failure
{
    NSString* actionString;
    NSString* apiString = [NSString stringWithFormat:@"%@/%@", ServerDomain, resource];
    
    // Set up the action string
    switch(action)
    {
        case HTTPActionGet:    actionString = @"GET";    break;
        case HTTPActionPost:   actionString = @"POST";   break;
        case HTTPActionPatch:  actionString = @"PATCH";  break;
        case HTTPActionPut:    actionString = @"PUT";    break;
        case HTTPActionDelete: actionString = @"DELETE"; break;
    }
    
    // Configure the URL parameters (should only be done on GET requests)
    if(action == HTTPActionGet)
    {
        BOOL firstParam = YES;
        for(NSString* key in params.allKeys)
        {
            NSString* value;
            if([params[key] isKindOfClass:[NSString class]])
            { value = params[key]; }
            else if([params[key] isKindOfClass:[NSNumber class]])
            { value = [((NSNumber*)params[key]) stringValue]; }
            else
            { @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Attempted to send up illegal object" userInfo:nil]; }
            apiString = [NSString stringWithFormat:@"%@%@%@=%@", apiString, firstParam ? @"?" : @"&", key, value];
            firstParam = NO;
        }
    }
    
    NSURL* apiUrl = [NSURL URLWithString:apiString];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:apiUrl];
    [request setHTTPMethod:actionString];
    
    // Configure the message body (should only be done on non-GET requests)
    if(action != HTTPActionGet)
    {
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:params options:0 error:nil]];
    }
    
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:success failure:failure];
    [operation start];
}


+ (NSError*) errorWithOperation:(AFHTTPRequestOperation*)operation code:(NSUInteger)errorCode defaultMessage:(NSString*)message error:(NSError*)error
{
    if(operation.responseString.length > 0)
    {
        NSDictionary* response = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableContainers error:nil];
        return [NSError errorWithDomain:ErrorDomainFlight code:errorCode userInfo:@{ NSLocalizedDescriptionKey:response[@"error"] != nil ? response[@"error"] : @"There was a problem", NSUnderlyingErrorKey:error, @"Operation":operation }];
    }
    else
    { return [NSError errorWithDomain:ErrorDomainFlight code:errorCode userInfo:@{ NSLocalizedDescriptionKey:message, @"Operation":operation }]; }
}

+ (BOOL)isTesting
{ return ![ServerDomain isEqualToString:ServerProduction]; }


@end
