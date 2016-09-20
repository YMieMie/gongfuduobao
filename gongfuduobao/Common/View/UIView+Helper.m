//
//  UIView+Helper.m
//  CardToon
//
//  Created by Austin on 7/18/13.
//  Copyright (c) 2013 com.coortouch.ender. All rights reserved.
//

#import "UIView+Helper.h"
#import <QuartzCore/QuartzCore.h>

#define nameOfVar(x) [NSString stringWithFormat:@"%s", #x]

@implementation UIView (Helper)

#pragma mark -
#pragma mark Init


-(void)addTapAction:(SEL)action forTarget:(id) aTarget
{
    self.userInteractionEnabled=YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:aTarget action:action];
    
    [self addGestureRecognizer:tap];
    
}

- (id)initWithSize:(CGSize)size
{
    self = [self init];
    if (self)
    {
        [self setFrameSize:size];
    }
    return self;
}

- (void)setFrameSize:(CGSize)size
{
    [self setFrame:CGRectMake(CGRectGetMinX([self frame]), CGRectGetMinY([self frame]), size.width, size.height)];
}

+ (UIView *)firstResponder
{
    UIView *view = [[UIApplication sharedApplication] keyWindow];
    return [view firstResponderInSubviews];
}

- (UIView *)firstResponderInSubviews
{
    UIView *responder;
    
    for (UIView *subview in [self subviews])
    {
        if ([subview isFirstResponder])
            responder = subview;
        else
            responder = [subview firstResponderInSubviews];
        
        if (responder)
            break;
    }
    
    return responder;
}

- (NSArray *)subviewsOfClass:(Class)aClass recursive:(BOOL)recursive
{
    NSMutableArray *subviews = [@[] mutableCopy];
    
    for (UIView *subview in [self subviews])
    {
        if ([subview isKindOfClass:aClass])
            [subviews addObject:subview];
        
        if (recursive)
            [subviews addObjectsFromArray:[subview subviewsOfClass:aClass recursive:YES]];
        
    }
    
    return subviews;
}

- (void)setFrameSizeToImageSize
{
    if ([self isKindOfClass:[UIButton class]])
    {
        UIImage *image = [(UIButton *)self imageForState:UIControlStateNormal];
        
        if (!image)
        {
            image = [(UIButton *)self backgroundImageForState:UIControlStateNormal];
        }
        
        if (image)
        {
            [self setFrame:CGRectMake(CGRectGetMinX([self frame]), CGRectGetMinY([self frame]), [image size].width, [image size].height)];
        }
    }
    else if ([self isKindOfClass:[UIImageView class]])
    {
        UIImage *image = [(UIImageView *)self image];
        if (image)
        {
            [self setFrame:CGRectMake(CGRectGetMinX([self frame]), CGRectGetMinY([self frame]), [image size].width, [image size].height)];
        }
    }
}

@end
