//
//  KlorkButton.h
//  draw2D
//
//  Created by Andy Stratton on 3/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KlorkButton : NSObject {
    int xPos;
    int yPos;
    float width;
    float height;
    
    CGLayerRef layer;
}

@property int xPos;
@property int yPos;


-(KlorkButton *) init:(CGContextRef) context atX:(int) x atY:(int) y withWidth:(float) wide andHeight:(float) high;

-(void) DrawLayer;
-(CGContextRef)GetLayerContext;
-(void)DrawToScreen:(CGContextRef)context;
@end
