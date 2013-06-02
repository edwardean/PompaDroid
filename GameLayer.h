//
//  GameLayer.h
//  PompaDroid
//
//  Created by Edward on 13-6-1.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Hero.h"
#import "SimpleDPad.h"
#import "HudLayer.h"
@interface GameLayer : CCLayer <SimpleDPadDelegate> {
    CCTMXTiledMap *_tileMap;
    
    CCSpriteBatchNode *_actors;
    
    Hero *_hero;
}

@property (nonatomic, weak) HudLayer *hud;
@end
