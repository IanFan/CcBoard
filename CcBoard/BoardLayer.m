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

#pragma mark - SetupControlMenu

-(void)setupControlMenu {
  CGSize winSize = [CCDirector sharedDirector].winSize;
  
  //HorizontalMenu
  {
  CCMenuItem *horizontalPlusMenuItem;
    {
    CCSprite *normalSprite = [CCSprite spriteWithFile:@"plus.png"];
    CCSprite *selectedSprite = [CCSprite spriteWithFile:@"plus.png"];
    selectedSprite.color = ccc3(200, 200, 200);
    horizontalPlusMenuItem = [CCMenuItemSprite itemWithNormalSprite:normalSprite selectedSprite:selectedSprite block:^(id sender){
      [_board changeBoardWithEditXAmount:1 editYAmount:0];
    }];
    }
  
  CCMenuItem *horizontalMinusMenuItem;
    {
    CCSprite *normalSprite = [CCSprite spriteWithFile:@"minus.png"];
    CCSprite *selectedSprite = [CCSprite spriteWithFile:@"minus.png"];
    selectedSprite.color = ccc3(200, 200, 200);
    horizontalMinusMenuItem = [CCMenuItemSprite itemWithNormalSprite:normalSprite selectedSprite:selectedSprite block:^(id sender){
      [_board changeBoardWithEditXAmount:-1 editYAmount:0];
    }];
    }
  
  CCMenu *menu = [CCMenu menuWithItems:horizontalPlusMenuItem,horizontalMinusMenuItem, nil];
  [menu alignItemsHorizontally];
  menu.position = ccp(60, winSize.height/2 + 50);
  
  [self addChild:menu];
  }
  
  //VerticalMenu
  {
  CCMenuItem *verticalPlusMenuItem;
    {
    CCSprite *normalSprite = [CCSprite spriteWithFile:@"plus.png"];
    CCSprite *selectedSprite = [CCSprite spriteWithFile:@"plus.png"];
    selectedSprite.color = ccc3(200, 200, 200);
    verticalPlusMenuItem = [CCMenuItemSprite itemWithNormalSprite:normalSprite selectedSprite:selectedSprite block:^(id sender){
      [_board changeBoardWithEditXAmount:0 editYAmount:1];
    }];
    }
  
  CCMenuItem *verticalMinusMenuItem;
    {
    CCSprite *normalSprite = [CCSprite spriteWithFile:@"minus.png"];
    CCSprite *selectedSprite = [CCSprite spriteWithFile:@"minus.png"];
    selectedSprite.color = ccc3(200, 200, 200);
    verticalMinusMenuItem = [CCMenuItemSprite itemWithNormalSprite:normalSprite selectedSprite:selectedSprite block:^(id sender){
      [_board changeBoardWithEditXAmount:0 editYAmount:-1];
    }];
    }
  
  CCMenu *menu = [CCMenu menuWithItems:verticalPlusMenuItem,verticalMinusMenuItem, nil];
  [menu alignItemsVertically];
  menu.position = ccp(60, winSize.height/2 - 50);
  
  [self addChild:menu];
  }
}

#pragma mark - SetupBoard

-(void)setupBoard {
  CGSize winSize = [CCDirector sharedDirector].winSize;
  float length = MIN(winSize.width, winSize.height);
  float adjustX = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)? 0:50;
  
  _board = [[Board alloc]init];
  [_board setupBoardWithParentLayer:self position:ccp(winSize.width/2+adjustX, winSize.height/2) maxLength:length xOrderAmount:5 yOrderAmount:5];
}

#pragma mark - Init

-(id)init {
  if ((self = [super init])) {
    [self setupBoard];
    
    [self setupControlMenu];
  }
  
  return self;
}

- (void) dealloc {
  [_board release];
	[super dealloc];
}

@end
