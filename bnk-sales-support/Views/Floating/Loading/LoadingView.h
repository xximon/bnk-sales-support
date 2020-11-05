//
//  LoadingView.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/05.
//

#import <UIKit/UIKit.h>
#import "Lottie.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoadingView : UIView {
    NSTimer *loaderTimer;
}

@property (nonatomic, strong) LOTAnimationView *laAnimation;

- (void)startWaiting;
- (void)stopWaiting;

@end

NS_ASSUME_NONNULL_END
