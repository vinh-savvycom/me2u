//
//  FavouriteViewController.h
//  Me2U
//
//  Created by Le Quang Vinh on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavouriteViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) IBOutlet UITableView *tbView;

@end
