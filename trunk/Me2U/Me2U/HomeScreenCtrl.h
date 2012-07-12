//
//  HomeScreenCtrl.h
//  Me2U
//
//  Created by duong2179 on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComingSoon.h"

#import "GiftTypeViewController.h"

#import "StoreScreenCtrl.h"
#import "ShoppingBasketCtrl.h"


@interface HomeScreenCtrl : UIViewController <UITabBarControllerDelegate, UITabBarDelegate>

@property (nonatomic, retain) UITabBarController *tbarCtrl;

- (void)goToPriceRangeScreen;
- (void)goToGiftTypeScreen;
- (void)goToStoreScreen;
- (void)createTabbar;

@end
