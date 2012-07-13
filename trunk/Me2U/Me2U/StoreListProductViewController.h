//
//  StoreListProductViewController.h
//  Me2U
//
//  Created by Le Quang Vinh on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreListProductViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) IBOutlet UITableView  *tbView;
@property (nonatomic) NSInteger                      category_id;
@property (nonatomic, retain) NSArray               *dataForTableArr;

@end
