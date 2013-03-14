//
//  Board.h
//  RpsDefence
//
//  Created by Ian Fan on 11/03/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum {
  BoardType_None,
  BoardType_FlatGround,
} BoardType;

#pragma mark - BOARD_UNIT

@interface BoardUnit : NSObject
{
  float _length;
  CCSprite *_textureSprite;
  CCLayer *_parentLayer;
}
@property BoardType boardType;
@property int xOrder;
@property int yOrder;
@property CGPoint position;
@property CGRect frame;
-(void)setupBoardUnitWithXOrder:(int)xOrder yOrder:(int)yOrder position:(CGPoint)pos sizeLength:(float)length;
-(void)setupTextureSpriteWithParentLayer:(CCLayer*)parentL BoardType:(BoardType)bType;//optional visibility
@end

#pragma mark - BOARD

@interface Board : NSObject
{
  CCLayer *_parentLayer;
  float _length;
  int _xAmount;
  int _yAmount;
}
@property (nonatomic,retain) NSMutableArray *boardUnitArray;
@property CGPoint position;
-(void)setupBoardWithParentLayer:(CCLayer*)parentL position:(CGPoint)pos maxLength:(float)maxLen xOrderAmount:(int)xAmount yOrderAmount:(int)yAmount;

//Control
-(void)changeBoardWithEditXAmount:(int)editX editYAmount:(int)editY;

@end
