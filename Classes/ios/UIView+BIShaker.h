@interface UIView (BIShaker)

- (void)shake;

- (void)shakeTimes:(int)times;

- (void)shakeWithCompletion:(void (^)())completion;

- (void)shakeTimes:(int)times completion:(void (^)())completion;

@end