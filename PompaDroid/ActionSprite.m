//
//  ActionSprite.m
//  PompaDroid
//
//  Created by Edward on 13-6-1.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import "ActionSprite.h"


@implementation ActionSprite


- (void)idle {
    if (_actionState != kActionStateIdle) {
        [self stopAllActions];
        [self runAction:_idleAction];
        _actionState = kActionStateIdle;
        _velocity = CGPointZero;
    }
}

- (void)attack {
    if (_actionState == kActionStateIdle || _actionState == kActionStateAttack || _actionState == kActionStateWalk) {
        [self stopAllActions];
        [self runAction:_attackAction];
        _actionState = kActionStateAttack;
    }
}
@end
