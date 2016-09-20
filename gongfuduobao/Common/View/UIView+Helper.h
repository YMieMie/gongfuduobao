//
//  UIView+Helper.h
//  CardToon
//
//  Created by Austin on 7/18/13.
//  Copyright (c) 2013 com.coortouch.ender. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Helper)

typedef NS_ENUM(NSUInteger, UIViewAlignment)
{
    UIViewAlignmentLeft = 1 << 0,
    UIViewAlignmentRight = 1 << 1,
    UIViewAlignmentTop = 1 << 2,
    UIViewAlignmentBottom = 1 << 3,
    
    UIViewAlignmentLeftEdge = 1 << 5,
    UIViewAlignmentRightEdge = 1 << 6,
    UIViewAlignmentTopEdge = 1 << 7,
    UIViewAlignmentBottomEdge = 1 << 8,
    
    UIViewAlignmentHorizontalCenter = 1 << 9,
    UIViewAlignmentVerticalCenter = 1 << 10,
};

-(void)addTapAction:(SEL)action forTarget:(id) aTarget;

// Init
- (id)initWithSize:(CGSize)size;

//Resizing
- (void)setFrameSizeToImageSize;

// subviews
+ (UIView *)firstResponder;
- (UIView *)firstResponderInSubviews;
- (NSArray *)subviewsOfClass:(Class)aClass recursive:(BOOL)recursive;



@end
