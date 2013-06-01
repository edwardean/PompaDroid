//
//  Hero.m
//  PompaDroid
//
//  Created by Edward on 13-6-1.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import "Hero.h"


@implementation Hero

- (id)init {
    if (self = [super initWithSpriteFrameName:@"hero_idle_00.png"]) {
        int i;
        
        //idle animation
        CCArray *idleFrames = [CCArray arrayWithCapacity:6];
        for (i = 0; i < 6; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"hero_idle_%02d.png",i]];
            [idleFrames addObject:frame];
        }
        
        CCAnimation *idleAnimation = [CCAnimation animationWithSpriteFrames:[idleFrames getNSArray] delay:1.0/12.0];
        self.idleAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:idleAnimation]];
        
        
        //attack animation
        CCArray *attackFrames = [CCArray arrayWithCapacity:3];
        for (i = 0; i < 3; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"hero_attack_00_%02d.png",i]];
            [attackFrames addObject:frame];
        }
        
        CCAnimation *attackAnimation = [CCAnimation animationWithSpriteFrames:[attackFrames getNSArray] delay:1.0/24.0];
        self.attackAction = [CCSequence actions:[CCAnimate actionWithAnimation:attackAnimation], nil];
        
        
        self.centerToBottom = 39.0;
        self.centerToSides = 29.0;
        self.hitPoints = 100.0;
        self.damage = 20.0;
        self.walkSpeed = 80;
    }
    return self;
}
@end
