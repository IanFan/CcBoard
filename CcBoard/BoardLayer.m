//
//  BoardLayer.m
//  CcBoard
//
//  Created by Ian Fan on 11/03/13.
//
//

#import "BoardLayer.h"

@implementation BoardLayer

+(CCScene *) scene {
	CCScene *scene = [CCScene node];
	BoardLayer *layer = [BoardLayer node];
	[scene addChild: layer];
	
	return scene;
}

-(void)setupBoard {
  CGSize winSize = [CCDirector sharedDirector].winSize;
  float length = MIN(winSize.width, winSize.height);
  
  _board = [[Board alloc]init];
  [_board setupBoardWithParentLayer:self position:ccp(winSize.width/2, winSize.height/2) maxLength:length xOrderAmount:5 yOrderAmount:4];
  
}

-(id)init {
  if ((self = [super init])) {
    [self setupBoard];
  }
  
  return self;
}

- (void) dealloc {
  [_board release];
	[super dealloc];
}

@end
