//
//  HudLayer.m
//  PompaDroid
//
//  Created by Edward on 13-6-1.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import "HudLayer.h"


@implementation HudLayer
-(id)init {
    if (self = [super init]) {
        _dPad = [SimpleDPad dPadWithFile:@"pd_dpad.png" radius:64];
        _dPad.position = ccp(64.0,64.0);
        _dPad.opacity = 100;
        [self addChild:_dPad];
    }
    
    return self;
}
@end
