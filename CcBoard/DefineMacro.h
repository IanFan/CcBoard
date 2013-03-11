//
//  DefineMacro.h
//  RpsDefence
//
//  Created by Ian Fan on 11/03/13.
//
//

#import <Foundation/Foundation.h>

typedef enum {
  BoardType_None,
  BoardType_FlatGround,
} BoardType;

typedef enum {
  StoneStatus_None,
  StoneStatus_Moving,
} StoneStatus;

typedef enum {
  Color_None,
  
  Color_Black,
  Color_White,
  Color_Red,
  Color_Blue,
  Color_Yellow,
  Color_Green,
  Color_Purple,
  Color_Pink,
  Color_Orange,
  Color_Brown,
  
  Color_Rainbow,
  
  Color_Block,
} ColorType;

@interface DefineMacro : NSObject

@end
