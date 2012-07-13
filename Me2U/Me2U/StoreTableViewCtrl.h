//
//  StoreTableViewCtrl.h
//  Me2U
//
//  Created by duong2179 on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreCell.h"
#import "Category.h"

@interface StoreTableViewCtrl : UITableViewController

@property (nonatomic, retain) NSArray* dataForTableArr;
@property (nonatomic) NSInteger     filterID;

@end
