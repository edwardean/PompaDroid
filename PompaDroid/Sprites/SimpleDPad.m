//
//  SimpleDPad.m
//  PompaDroid
//
//  Created by Edward on 13-6-2.
//  Copyright 2013年 Lihang. All rights reserved.
//

#import "SimpleDPad.h"


@implementation SimpleDPad
+ (id)dPadWithFile:(NSString *)fileName radius:(float)radius {
    return [[self alloc] initWithFile:fileName radius:radius];
}

- (id)initWithFile:(NSString *)fileName radius:(float)radius {
    if (self = [super initWithFile:fileName]) {
        _radius = radius;
        _direction = CGPointZero;
        _isHeld = NO;
        [self scheduleUpdate];
    }
    return self;
}


- (void)onEnterTransitionDidFinish {
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:1 swallowsTouches:YES];
}

- (void)onExit {
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
}

- (void)update:(ccTime)delta {
    if (_isHeld) {
        [_delegate simpleDPad:self isHoldingDirection:_direction];
    }
}

//Checks if the touch location is inside the D-pad's circle.
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
    
    float distanceSQ = ccpDistanceSQ(location, _position);
    if (distanceSQ <= _radius * _radius) {
        //get angle 8 directions
        [self updateDirectionForTouchLocation:location];
        _isHeld = YES;
        return YES;
    }
    return NO;
}

//Simply triggers an update of its direction value every time the touch is moved.
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
    [self updateDirectionForTouchLocation:location];
}

//Switches off the isHeld Boolean, centers the direction,and notifies its delegate that the touch has ended.
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    _direction = CGPointZero;
    _isHeld = NO;
    [_delegate simpleDPadTouchEnded:self];
}


//Calculates the location of the touch against the center of the D-pad.
- (void)updateDirectionForTouchLocation:(CGPoint)location {
    float radius = ccpToAngle(ccpSub(location, _position));
    float degrees = -1 * CC_RADIANS_TO_DEGREES(radius);
    
    if (degrees <= 22.5 && degrees >= -22.5) {
        //Right
        _direction = ccp(1.0,0.0);
        CCLOG(@"Right");
    } else if (degrees > 22.5 && degrees < 67.5) {
        //BottomRight
        _direction = ccp(1.0, -1.0);
        CCLOG(@"BottomRight");
    } else if (degrees >= 67.5 && degrees <= 112.5) {
        //Bottom
        _direction = ccp(0.0, -1.0);
        CCLOG(@"Bottom");
    } else if (degrees > 112.5 && degrees < 157.5) {
        //BottomLeft
        _direction = ccp(-1.0, -1.0);
        CCLOG(@"BottomLeft");
    } else if (degrees >= 157.5 && degrees <= -157.5) {
        //Left
        _direction = ccp(-1.0, 0.0);
        CCLOG(@"Left");
    } else if (degrees < -22.5 && degrees > -67.5) {
        //TopRight
        _direction = ccp(1.0, 1.0);
        CCLOG(@"TopRight");
    } else if (degrees <= -67.5 && degrees >= -112.5) {
        //Top
        _direction = ccp(0.0, 1.0);
        CCLOG(@"Top");
    } else if (degrees < -112.5 && degrees > -157.5) {
        //TopLeft
        _direction = ccp(-1.0, 1.0);
        CCLOG(@"TopLeft");
    }
    
    [_delegate simpleDPad:self didChangeDirectionTo:_direction];
}


@end
