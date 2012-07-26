//
//  GiftViewController.h
//  Me2U
//
//  Created by Le Quang Vinh on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IconDownloader.h"

@interface GiftViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, IconDownloaderDelegate>

@property (nonatomic, retain) IBOutlet UITableView  *tbView;
@property (nonatomic, retain) NSArray        *arrayGift;
@property (nonatomic, retain) NSString              *strID;
@property (nonatomic, retain) NSMutableArray        *cachedImgArr;
@property (nonatomic, retain) NSMutableDictionary *imageDownloadsInProgress;

@end
