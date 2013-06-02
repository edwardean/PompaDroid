//
//  Robot.m
//  PompaDroid
//
//  Created by Edward on 13-6-2.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import "Robot.h"


@implementation Robot

- (id)init {
    if (self = [super initWithSpriteFrameName:@"robot_idle_00.png"]) {
        int i;
        
        //idle animation
        CCArray *idleFrames = [CCArray arrayWithCapacity:5];
        for (i = 0; i < 5; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"robot_idle_%02d.png",i]];
            [idleFrames addObject:frame];
        }
        CCAnimation *idleAnimation = [CCAnimation animationWithSpriteFrames:[idleFrames getNSArray] delay:1.0/12.0];
        self.idleAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:idleAnimation]];
        
        //attack animation
        CCArray *attackFrames = [CCArray arrayWithCapacity:5];
        for (i = 0; i < 5; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"robot_attack_%02d.png",i]];
            [attackFrames addObject:frame];
        }
        CCAnimation *attackAnimation = [CCAnimation animationWithSpriteFrames:[attackFrames getNSArray] delay:1.0 / 24.0];
        self.attackAction = [CCSequence actions:[CCAnimate actionWithAnimation:attackAnimation],[CCCallFunc actionWithTarget:self selector:@selector(idle)], nil];
        
        //walk animation
        CCArray *walkFrames = [CCArray arrayWithCapacity:6];
        for (i = 0; i < 6; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"robot_walk_%02d.png",i]];
            [walkFrames addObject:frame];
        }
        CCAnimation *walkAnimation = [CCAnimation animationWithSpriteFrames:[walkFrames getNSArray] delay:1.0 / 12.0];
        self.walkAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnimation]];
        
        
        self.walkSpeed = 80;
        self.centerToBottom = 39.0;
        self.centerToBottom = 29.0;
        self.hitPoints = 100;
        self.damage = 10;
    }
    return self;
}
@end
