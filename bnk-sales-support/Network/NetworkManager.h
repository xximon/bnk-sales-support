//
//  NetworkManager.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/02.
//

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+ (NetworkManager *_Nonnull)sharedInstance;

- (void)get:(NSString *_Nullable)url
 parameters:(nullable id)params
    headers:(nullable NSDictionary<NSString *,NSString *> *)headers
   complete:(void (^_Nullable)(id _Nullable responseObj))complete
       fail:(void (^_Nullable)(NSError * _Nullable error))fail;

- (void)downloadUrl:(NSString *_Nullable)url
               path:(NSString *_Nullable)path
           download:(void (^_Nullable)(CGFloat progress))download
           complete:(void (^_Nullable)(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath))complete
               fail:(void (^_Nullable)(NSError * _Nullable error))fail;

- (void)post:(NSString *_Nullable)url
  parameters:(NSDictionary *_Nullable)parameters
     headers:(nullable NSDictionary<NSString *,NSString *> *)headers
    complete:(void (^_Nullable)(id _Nullable responseObj, NSURLResponse * _Nonnull response))complete
        fail:(void (^_Nullable)(NSError * _Nullable error))fail;

- (void)post:(NSString *)url
  parameters:(NSDictionary *)parameters
      upload:(void (^)(CGFloat progress))upload
    complete:(void (^)(id responseObj, NSURLResponse * _Nonnull response))complete
        fail:(void (^)(NSError *error))fail;

- (void)post:(NSString *)url
  parameters:(NSDictionary *)parameters
    download:(void (^)(CGFloat progress))download
    complete:(void (^)(id responseObj, NSURLResponse * _Nonnull response))complete
        fail:(void (^)(NSError *error))fail;

//cookie 저장
- (void)storeCookies;
//cookie 불러오기
- (void)restoreCookies;
//cookie 삭제
- (void)clearCookies;
//session cookie clear
- (void)sessionClearCookies;

@end

NS_ASSUME_NONNULL_END
