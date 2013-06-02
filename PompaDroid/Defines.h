//
//  Defines.h
//  PompaDroid
//
//  Created by Edward on 13-6-1.
//  Copyright (c) 2013年 Lihang. All rights reserved.
//

#ifndef PompaDroid_Defines_h
#define PompaDroid_Defines_h


// 1 - convenience measurements
#define SCREEN [[CCDirector sharedDirector] winSize]
#define CENTER ccp(SCREEN.width/2,SCREEN.height/2)
#define CURTIME CACurrentMediaTime()


// 2 - convenience functions
#define random_range(low,high) (arc4random()%(high-low+1))+low
#define frandom (float)arc4random()/UINT64_C(0x100000000)
#define frandom_range(low,high) ((high-low)*frandom)+low


// 3 - enumerations
typedef enum _ActionState {
    kActionStateNone = 0,
    kActionStateIdle,
    kActionStateAttack,
    kActionStateWalk,
    kActionStateHurt,
    kActionStateKnockedOut,
} ActionState;

// 4 - structures
typedef struct _BoundingBox {
    CGRect actual;      //The rectangle local to each individual sprite,and never changes once it is set.
    CGRect original;    //On the one hand,is the rectangle as it is located in world space.As the sprite moves, so                  does the actual rectangle.
} BoundingBox;
#endif
