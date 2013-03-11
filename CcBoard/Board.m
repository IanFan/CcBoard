//
//  Board.m
//  RpsDefence
//
//  Created by Ian Fan on 11/03/13.
//
//

#import "Board.h"

#pragma mark - BOARDUNIT

@implementation BoardUnit
@synthesize position=_position;

-(void)setupBoardUnitWithXOrder:(int)xOrder yOrder:(int)yOrder position:(CGPoint)pos sizeLength:(float)length {
  self.xOrder = xOrder;
  self.yOrder = yOrder;
  self.position = pos;
  _length = length;
  
  self.frame = CGRectMake(_position.x-_length/2, _position.y-_length/2, _length, _length);
}

-(void)setupTextureSpriteWithParentLayer:(CCLayer *)parentL BoardType:(BoardType)bType {
  _parentLayer = parentL;
  self.boardType = bType;
  
  NSString *pngString = @"board_frame.png";
  _textureSprite = [CCSprite spriteWithFile:pngString];
  _textureSprite.position = _position;
  
  float scale = _length/_textureSprite.boundingBox.size.width;
  _textureSprite.scale = scale;
  
  [_parentLayer addChild:_textureSprite];
}

-(id)init {
	if( (self=[super init]) ) {
  }
	return self;
}

-(void)dealloc {
  if (_textureSprite != nil) [_parentLayer removeChild:_textureSprite cleanup:YES];
	[super dealloc];
}

@end


#pragma mark - BOARD

@implementation Board
@synthesize position = _position;

-(void)setupBoardWithParentLayer:(CCLayer *)parentL position:(CGPoint)pos maxLength:(float)maxLen xOrderAmount:(int)xAmount yOrderAmount:(int)yAmount {
  _parentLayer = parentL;
  _position = pos;
  _length = maxLen;
  _xAmount = xAmount;
  _yAmount = yAmount;
  
  [self setupBoardUnitArray];
}

-(void)setupBoardUnitArray {
  if (self.boardUnitArray == nil) self.boardUnitArray = [[NSMutableArray alloc]init];
  else [_boardUnitArray removeAllObjects];
  
  float unitLength = _length/MAX(_xAmount, _yAmount);
  float totalXLength = _xAmount*unitLength;
  float totalYLength = _yAmount*unitLength;
  
  CGPoint firstUnitPoint = CGPointMake(_position.x-totalXLength/2+unitLength/2, _position.y-totalYLength/2+unitLength/2);
  
  for (int i=0; i<_xAmount; i++) {
    for (int j=0; j<_yAmount; j++) {
      CGPoint position = ccp(firstUnitPoint.x+i*unitLength, firstUnitPoint.y+j*unitLength);
      
      BoardUnit *unit = [[[BoardUnit alloc]init]autorelease];
      [unit setupBoardUnitWithXOrder:i yOrder:j position:position sizeLength:unitLength];
      [unit setupTextureSpriteWithParentLayer:_parentLayer BoardType:BoardType_FlatGround];
      [self.boardUnitArray addObject:unit];
    }
  }
  
}

-(id)init {
	if( (self=[super init]) ) {
	}
  
	return self;
}

-(void)dealloc {
	[super dealloc];
}

@end
