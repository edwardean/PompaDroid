//
//  HudLayer.h
//  PompaDroid
//
//  Created by Edward on 13-6-1.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleDPad.h"
@interface HudLayer : CCLayer {
    
}

@property (nonatomic, weak) SimpleDPad *dPad;
@end
