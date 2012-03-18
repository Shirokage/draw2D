//
//  draw2D.m
//  draw2D
//
//  Created by Andy Stratton on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "draw2D.h"

@implementation draw2D

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;	
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetShadow(context, CGSizeMake(13, 13), 4.0);
    
    // Set a Background Color
    CGFloat components[] = {0.3, 0.4, 1.0, 1.0};
    CGColorRef color = CGColorCreate(CGColorSpaceCreateDeviceRGB(), components);
    CGContextSetFillColorWithColor(context, color);
    CGContextFillRect(context, CGContextGetClipBoundingBox(context));
    
    // Drawing and image
        UIImage *myImage = [UIImage imageNamed:@"me.jpg"];
    
        CGRect screenRect = CGContextGetClipBoundingBox(context);
        int x = (screenRect.size.width/2)-(254/2);
        CGRect imageRect = CGRectMake(x, 10, 254, 292);
    
        [myImage drawInRect:imageRect];
        //[myImage release];
    
    CGContextSetShadow(context, CGSizeMake(0, 0), 0.0);
    // Create Path
        CGContextMoveToPoint(context, 0, screenRect.size.height);
        CGContextAddLineToPoint(context, 100, screenRect.size.height-100);
    
        // Stroke Path
        CGContextStrokePath(context);
    
    
    // BOX Outline and Fill
        CGContextSetLineWidth(context, 5.0);
        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
        //Create Rectangle and add as a path to context.
        CGRect rectangle = CGRectMake(150, 290, 100, 125);
        CGContextAddRect(context, rectangle);
    
    
        CGContextStrokePath(context); //Stroke un-stroked paths.
    
        //Set Fill Color and fill Rect.
        CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
        CGContextFillRect(context, rectangle);
    
}


@end
