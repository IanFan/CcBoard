//
//  BoardLayer.h
//  CcBoard
//
//  Created by Ian Fan on 11/03/13.
//
//

#import "cocos2d.h"
#import "Board.h"

@interface BoardLayer : CCLayer
{
  Board *_board;
}
+(CCScene *) scene;

@end
