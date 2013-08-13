//
//  AMBlurView.m
//  blur
//
//  Created by Cesar Pinto Castillo on 7/1/13.
//  Copyright (c) 2013 Arctic Minds Inc. All rights reserved.
//

#import "AMBlurView.h"
#import <QuartzCore/QuartzCore.h>

@interface AMBlurView ()

@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, strong) CALayer *blurLayer;

@end

@implementation AMBlurView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self setToolbar:[[UIToolbar alloc] initWithFrame:[self bounds]]];
    [self setBlurLayer:[[self toolbar] layer]];
    
    UIView *blurView = [UIView new];
    [blurView setUserInteractionEnabled:NO];
    [blurView.layer addSublayer:[self blurLayer]];
    [blurView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [blurView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self addSubview:blurView];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[blurView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(blurView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(-1)-[blurView]-(-1)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(blurView)]];
    
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)setBlurTintColor:(UIColor *)blurTintColor {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    [self.toolBar setBarTintColor:blurTintColor];
#endif
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self.blurLayer setFrame:[self bounds]];
}

@end
