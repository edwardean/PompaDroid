//
//  SimpleDPad.h
//  PompaDroid
//
//  Created by Edward on 13-6-2.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCTouchDelegateProtocol.h"
@class SimpleDPad;

@protocol SimpleDPadDelegate <NSObject>

- (void)simpleDPad:(SimpleDPad *)simpleDPad didChangeDirectionTo:(CGPoint)direction;
- (void)simpleDPad:(SimpleDPad *)simpleDPad isHoldingDirection:(CGPoint)direction;
- (void)simpleDPadTouchEnded:(SimpleDPad *)simpleDPad;

//What's Done of Delegate Above:
//  1.Calculate direction based on touch
//  2.Send direction to delegate
//  3.Delegate moves the character

@end
@interface SimpleDPad : CCSprite <CCTouchOneByOneDelegate/*,CCTargetedTouchDelegate*/> {
    
    float _radius;              //Simple the radius of the circle formed by the D-pad
    CGPoint _direction;         //The current direction being pressed. This is a vector with(-1.0,-1,0)being the        bottom left direction, and(1.0,1.0)being the top right direction.
}

@property (nonatomic, weak) id <SimpleDPadDelegate> delegate;   //The delegate of yhe D-pad,which is explained in detail below.
@property (nonatomic, assign) BOOL isHeld;       //A Boolean that returns YES as long as the player is touching the D-pad.

+ (id)dPadWithFile:(NSString *)fileName radius:(float)radius;
- (id)initWithFile:(NSString *)fileName radius:(float)radius;
@end
