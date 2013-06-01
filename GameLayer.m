//
//  GameLayer.m
//  PompaDroid
//
//  Created by Edward on 13-6-1.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import "GameLayer.h"


@implementation GameLayer

- (id)init {
    if (self = [super init]) {
        [self initTileMap];
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"pd_sprites.plist"];
        _actors = [CCSpriteBatchNode batchNodeWithFile:@"pd_sprites.pvr.ccz"];
        [_actors.texture setAliasTexParameters];
        [self addChild:_actors z:-5];
        
        self.touchEnabled = YES;
        
        [self initHero];
    }
    return self;
}

- (void)initTileMap {
    _tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"pd_tilemap.tmx"];
    for (CCTMXLayer *child in [_tileMap children]) {
        
        //设置精灵贴图反锯齿
        [[child texture] setAliasTexParameters];
    }
    [self addChild:_tileMap z:-6];
}

- (void) initHero {
    _hero = [Hero node];
    [_actors addChild:_hero];
    _hero.position = ccp(_hero.centerToSides, 80);
    _hero.desiredPosition = _hero.position;
    [_hero idle];
}

//Trigger the attack method
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_hero attack];
}
@end
