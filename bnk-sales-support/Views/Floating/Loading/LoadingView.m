//
//  LoadingView.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/05.
//

#import "LoadingView.h"

@implementation LoadingView

- (void)drawRect:(CGRect)rect {
    if (!_laAnimation) {
        _laAnimation = [LOTAnimationView animationNamed:@"FullLoader"];
        _laAnimation.contentMode = UIViewContentModeScaleAspectFit;
        _laAnimation.loopAnimation = YES;
        _laAnimation.center = self.center;
        [self addSubview:_laAnimation];
        [self setNeedsLayout];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startWaiting) name:@"START_WAITING" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopWaiting) name:@"STOP_WAITING" object:nil];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"START_WAITING" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"STOP_WAITING" object:nil];
    
    if (loaderTimer) {
        if ([loaderTimer isValid]) {
            [loaderTimer invalidate];
        }
        loaderTimer = nil;
    }
}

- (void)startWaiting {
    if (self.isHidden) {
        NSLog(@"startWaiting");
        [self setHidden:NO];
        [_laAnimation stop];
        [_laAnimation play];
        
        if (loaderTimer) {
            if ([loaderTimer isValid]) {
                [loaderTimer invalidate];
            }
            loaderTimer = nil;
        }
        loaderTimer = [NSTimer scheduledTimerWithTimeInterval:20.0f target:self selector:@selector(stopLoaderTimer:) userInfo:nil repeats:NO];
    }
}

- (void)stopWaiting {
    if (!self.isHidden) {
        NSLog(@"stopWaiting");
        [self setHidden:YES];
        [_laAnimation stop];
        
        if ([loaderTimer isValid]) {
            [loaderTimer invalidate];
        }
        loaderTimer = nil;
    }
}

- (void)stopLoaderTimer:(NSTimer *)timer {
    NSLog(@"stopLoaderTimer");
    if ([loaderTimer isValid]) {
        [loaderTimer invalidate];
    }
    loaderTimer = nil;
    [self stopWaiting];
}

@end
