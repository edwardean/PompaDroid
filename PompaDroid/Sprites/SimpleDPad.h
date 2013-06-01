//
//  SimpleDPad.h
//  PompaDroid
//
//  Created by Edward on 13-6-2.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@class SimpleDPad;

@protocol SimpleDPadDelegate <NSObject>

- (void)simpleDPad:(SimpleDPad *)simpleDPad didChangeDirectionTo:(CGPoint)direction;
- (void)simpleDPad:(SimpleDPad *)simpleDPad isHoldingDirection:(CGPoint)direction;
- (void)simpleDPadTouchEnded:(SimpleDPad *)simpleDPad;

@end
@interface SimpleDPad : CCSprite <SimpleDPadDelegate> {
    
    float _radius;
    CGPoint _direction;
}

@property (nonatomic, weak) id <SimpleDPadDelegate> delegate;
@property (nonatomic, assign) BOOL isHeld;

+ (id)dPadWithFile:(NSString *)fileName radius:(float)radius;
- (id)initWithFile:(NSString *)fileName radius:(float)radius;
@end
