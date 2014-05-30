#import "UIView+BIShaker.h"

@implementation UIView (BIShaker)

- (void)shake {
    [self shakeTimes:5 andDirection:1 andCompletion:nil];
}

- (void)shakeTimes:(int)times {
    [self shakeTimes:times andDirection:1 andCompletion:nil];
}

- (void)shakeWithCompletion:(void (^)())completion {
    [self shakeTimes:5 andDirection:1 andCompletion:completion];
}

- (void)shakeTimes:(int)times completion:(void (^)())completion{
    [self shakeTimes:times andDirection:1 andCompletion:completion];
}

- (void)shakeTimes:(int)times andDirection:(int)direction andCompletion:(void (^)())completion{
    __weak UIView *blockSelf = self;
    [UIView animateWithDuration:0.03 animations:^{
        UIView *strongSelf = blockSelf;
        strongSelf.transform = CGAffineTransformMakeTranslation(direction * 5, 0);
    }
                     completion:^(BOOL finished) {
        UIView *strongSelf = blockSelf;
        if (times == 0) {
            strongSelf.transform = CGAffineTransformIdentity;
            if (completion) {
                completion();
            }
            return;
        } else {
            [strongSelf shakeTimes:(times - 1) andDirection:(-direction) andCompletion:completion];
        }
    }];
}

@end