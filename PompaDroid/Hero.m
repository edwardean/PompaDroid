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
        self.attackAction = [CCSequence actions:[CCAnimate actionWithAnimation:attackAnimation],[CCCallFunc actionWithTarget:self selector:@selector(idle)], nil];
        
        //walk animation
        CCArray *walkFrames = [CCArray arrayWithCapacity:8];
        for (i = 0; i < 8; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"hero_walk_%02d.png",i]];
            [walkFrames addObject:frame];
        }
        CCAnimation *walkAnimation = [CCAnimation animationWithSpriteFrames:[walkFrames getNSArray] delay:1.0/12.0];
        self.walkAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnimation]];
        
        //hurt animation
        CCArray *hurtFrames = [CCArray arrayWithCapacity:8];
        for (i = 0; i < 3; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"hero_hurt_%02d.png",i]];
            [hurtFrames addObject:frame];
        }
        CCAnimation *hurtAnimation = [CCAnimation animationWithSpriteFrames:[hurtFrames getNSArray] delay:1.0 / 12.0];
        self.hurtAction = [CCSequence actions:[CCAnimate actionWithAnimation:hurtAnimation],[CCCallFuncN actionWithTarget:self selector:@selector(idle)], nil];
        
        //knocked out animation
        CCArray *knockedOutFrames = [CCArray arrayWithCapacity:5];
        for (i = 0; i < 5; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"hero_knockout_%02d.png",i]];
            [knockedOutFrames addObject:frame];
        }
        CCAnimation *knockedOutAnimation = [CCAnimation animationWithSpriteFrames:[knockedOutFrames getNSArray] delay:1.0 / 12.0];
        self.knockedOutAction = [CCSequence actions:[CCAnimate actionWithAnimation:knockedOutAnimation], [CCBlink actionWithDuration:2.0 blinks:10.0],nil];
        
        self.centerToBottom = 39.0;
        self.centerToSides = 29.0;
        
        
        //Create bounding boxes
        self.hitBox = [self createBoundingBoxWithOrigin:ccp(-self.centerToSides, -self.centerToSides) size:CGSizeMake(self.centerToSides * 2, self.centerToBottom * 2)];
        self.attackBox = [self createBoundingBoxWithOrigin:ccp(self.centerToSides, -10) size:CGSizeMake(20, 20)];
        
        self.hitPoints = 100.0;
        self.damage = 20.0;
        self.walkSpeed = 80;
    }
    return self;
}
@end
