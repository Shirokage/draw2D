//
//  KlorkButton.m
//  draw2D
//
//  Created by Andy Stratton on 3/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KlorkButton.h"

@implementation KlorkButton
@synthesize xPos;
@synthesize yPos;

-(KlorkButton *) init:(CGContextRef) context atX:(int) x atY:(int) y withWidth:(float) wide andHeight:(float) high
{
    self = [super init];
    if (self != nil) {
        xPos = x;
        yPos = y;
        width = wide;
        height = high;
        
        layer = CGLayerCreateWithContext((CGContextRef) context, CGSizeMake(width, height), nil);
    }
    [self DrawLayer];
    
    return self;
    
}

-(void) DrawLayer
{

    CGContextRef context = CGLayerGetContext(layer);
    CGRect rectangle = CGContextGetClipBoundingBox(context);
    CGContextAddRect(context, rectangle);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillRect(context, rectangle);
}

-(CGContextRef)GetLayerContext
{
    return CGLayerGetContext(layer);
}

-(void)DrawToScreen:(CGContextRef)context
{
    
    
    UIImage *myImage = [UIImage imageNamed:@"me.jpg"];
    
    CGRect screenRect = CGContextGetClipBoundingBox(context);
    int x = (screenRect.size.width/2)-(254/2);
    CGRect imageRect = CGRectMake(x, 10, 254, 292);
    
    [myImage drawInRect:imageRect];
    
    NSLog(@"x:%i y:%i, w:%f, h:%f",xPos,yPos,width,height);
    CGRect myRect = CGRectMake(xPos, yPos, width, height);
    CGContextAddRect(context,myRect);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 3.0);
    CGContextStrokeRect(context, myRect);
    
    CGContextDrawLayerInRect(context, myRect, layer);
    //CGContextDrawLayerAtPoint(context, CGPointMake(xPos, yPos), layer);
    
    
}
@end
