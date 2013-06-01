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
@interface GameLayer : CCLayer {
    CCTMXTiledMap *_tileMap;
    
    CCSpriteBatchNode *_actors;
    
    Hero *_hero;
}

@end
