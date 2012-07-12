//
//  GiftTypeViewController.h
//  Me2U
//
//  Created by Le Quang Vinh on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kGiftType   0
#define kPrice      1

@interface GiftTypeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    BOOL isFirst;
}

@property (nonatomic, retain) IBOutlet UITableView  *tbView;
@property (nonatomic, retain) NSMutableArray        *arrayType;
@property (nonatomic)         NSInteger             frowView;

@end
