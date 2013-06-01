//
//  GameScene.m
//  PompaDroid
//
//  Created by Edward on 13-6-1.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

- (id) init {
    if (self = [super init]) {
        _gameLayer = [GameLayer node];
        [self addChild:_gameLayer z:0];
        _hudLayer = [HudLayer node];
        [self addChild:_hudLayer z:1];
    }
    return self;
}
@end
