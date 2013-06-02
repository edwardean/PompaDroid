//
//  ActionSprite.h
//  PompaDroid
//
//  Created by Edward on 13-6-1.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ActionSprite : CCSprite {
    
}
//Actions
@property (nonatomic, strong) id idleAction;        //
@property (nonatomic, strong) id attackAction;      //
@property (nonatomic, strong) id walkAction;        //
@property (nonatomic, strong) id hurtAction;        //
@property (nonatomic, strong) id knockedOutAction;  //

//States
@property (nonatomic, assign) ActionState actionState;


//Atttributes
@property (nonatomic, assign) float walkSpeed;
@property (nonatomic, assign) float hitPoints;
@property (nonatomic, assign) float damage;

//Movement

@property (nonatomic, assign) CGPoint velocity;
@property (nonatomic, assign) CGPoint desiredPosition;

//Measurements
@property (nonatomic, assign) float centerToSides;
@property (nonatomic, assign) float centerToBottom;


//Bounding Box
@property (nonatomic, assign) BoundingBox hitBox;
@property (nonatomic, assign) BoundingBox attackBox;

//Action methods
- (void)idle;
- (void)attack;
- (void)hurtWithDamage:(float)damage;
- (void)knockout;
- (void)walkWithDirection:(CGPoint)driection;

//Scheduled methods
- (void)update:(ccTime)delta;


//A factory method for a bounding box, which simply create a BoundingBox structure given an origin and size.
- (BoundingBox)createBoundingBoxWithOrigin:(CGPoint)origin size:(CGSize)size;
@end
