//
//  GameScene.h
//  PompaDroid
//
//  Created by Edward on 13-6-1.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameLayer.h"
#import "HudLayer.h"
@interface GameScene : CCScene {
    
}


@property (nonatomic, weak) GameLayer *gameLayer;
@property (nonatomic, weak) HudLayer *hudLayer;
@end
