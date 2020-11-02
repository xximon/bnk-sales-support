//
//  NetworkManager.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/02.
//

#import "NetworkManager.h"

@implementation NetworkManager

+ (NetworkManager *)sharedInstance {
    static NetworkManager *networkManager = nil;
    static dispatch_once_t onceToken;

    if (networkManager == nil) {
        dispatch_once(&onceToken, ^{
            networkManager = [[NetworkManager alloc] init];
        });
    }
    return networkManager;
}

/**
 *  request GET
 *
 *  @param completionHandler
 *  @param failure
 */
#pragma mark - GET request
- (void)get:(NSString *)url
 parameters:(nullable id)params
    headers:(nullable NSDictionary<NSString *,NSString *> *)headers
   complete:(void (^)(id responseObj))complete
       fail:(void (^)(NSError *error))fail {
    
    if (url == nil || url.length < 1) {
        NSError *error = [self setError:@"URL is nil"];
        NSLog(@"=== Error: %@", error);
        fail(error);
        return;
    }
    
    NSLog(@"=== url: %@", url);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    [serializer setRemovesKeysWithNullValues:YES];
    [manager setResponseSerializer:serializer];
    
    [manager GET:url
      parameters:params
         headers:headers
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable obj) {
        
        NSMutableDictionary *responseObject = nil;
        if ([obj isKindOfClass:[NSDictionary class]]) {
            responseObject = [obj mutableCopy];
//            [responseObject setValue:[NSString stringWithFormat:@"%f", executionTime] forKey:@"executionTime"];
        }else {
            responseObject = obj;
        }
        
        complete(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"=== Error: %@", error);
        fail(error);
    }];
    
}


/**
 *  request POST
 *
 *  @param parameter
 *  @param completionHandler
 *  @param failure
 */
#pragma mark - POST request
- (void)post:(NSString *)url
  parameters:(NSDictionary *)parameters
    complete:(void (^)(id responseObj, NSURLResponse * _Nonnull response))complete
        fail:(void (^)(NSError *error))fail {
    
    
}



//에러 처리
- (NSError *)setError:(NSString *)description {
    
    NSMutableDictionary* details = [NSMutableDictionary dictionary];
    [details setValue:description forKey:NSLocalizedDescriptionKey];
    return [NSError errorWithDomain:@"BNKMobile" code:500 userInfo:details];
    
}



@end
