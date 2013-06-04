//
//  ActionSprite.m
//  PompaDroid
//
//  Created by Edward on 13-6-1.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import "ActionSprite.h"
#import "SimpleAudioEngine.h"

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


- (void)hurtWithDamage:(float)damage {
    if (_actionState != kActionStateKnockedOut) {
        [self stopAllActions];
        [self runAction:_hurtAction];
        _actionState = kActionStateHurt;
        _hitPoints -= damage;
        int randomSound = random_range(0, 1);
        [[SimpleAudioEngine sharedEngine] playEffect:[NSString stringWithFormat:@"pd_hit%d.caf",randomSound]];
        
        if (_hitPoints <= 0.0) {
            [self knockout];
        }
    }
}

- (void)knockout {
    [self stopAllActions];
    [self runAction:_knockedOutAction];
    _hitPoints = 0.0;
    _actionState = kActionStateKnockedOut;
}
- (void)walkWithDirection:(CGPoint)direction {
    if (_actionState == kActionStateIdle) {
        [self stopAllActions];
        [self runAction:_walkAction];
        _actionState = kActionStateWalk;
    }
    
    if (_actionState == kActionStateWalk) {
        _velocity = ccp(direction.x * _walkSpeed, direction.y * _walkSpeed);
        if (_velocity.x >= 0) {
            self.scaleX = 1.0;
        } else
            self.scaleX = -1.0;
    }
}

- (void)update:(ccTime)delta {
    if (_actionState == kActionStateWalk) {
        _desiredPosition = ccpAdd(_position, ccpMult(_velocity, delta));
    }
}


//Creates a new BoundingBox and is there to assist subclass of ActionSprite in creating their own bounding boxes.
- (BoundingBox)createBoundingBoxWithOrigin:(CGPoint)origin size:(CGSize)size {
    BoundingBox boundingBox;
    boundingBox.original.origin = origin;
    boundingBox.original.size = size;
    boundingBox.actual.origin = ccpAdd(_position, ccp(boundingBox.original.origin.x, boundingBox.original.origin.y));
    boundingBox.actual.size = size;
    return boundingBox;
}

//Updates the origin and size of the actual measurements of each bounding box, based on the sprite’s position and scale, and the local origin and size of the bounding box. You take the scale into consideration because it determines the direction the sprite is facing. A box located on the right side of the sprite will flip to the left side when the scale is set to -1.
- (void)transformBoxes {
    _hitBox.actual.origin = ccpAdd(_position, ccp(_hitBox.original.origin.x * _scaleX, _hitBox.original.origin.y * _scaleY));
    _hitBox.actual.size = CGSizeMake(_hitBox.original.size.width * _scaleX, _hitBox.original.size.height * _scaleY);
    _attackBox.actual.origin = ccpAdd(_position, ccp(_attackBox.original.origin.x * _scaleX, _attackBox.original.origin.y * _scaleY));
    _attackBox.actual.size = CGSizeMake(_attackBox.original.size.width * _scaleX, _attackBox.original.size.height * _scaleY);
}

- (void)setPosition:(CGPoint)position {
    [super setPosition:position];
    [self transformBoxes];
}
@end
