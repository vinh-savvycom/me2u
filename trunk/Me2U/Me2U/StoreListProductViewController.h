//
//  StoreListProductViewController.h
//  Me2U
//
//  Created by Le Quang Vinh on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyImageObject.h"
#import "IconDownloader.h"

@interface StoreListProductViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, IconDownloaderDelegate>

@property (nonatomic, retain) IBOutlet UITableView  *tbView;
@property (nonatomic) NSInteger                      category_id;
@property (nonatomic, retain) NSArray               *dataForTableArr;
@property (nonatomic, retain) NSMutableArray *cachedImgArr;
@property (nonatomic, retain) NSMutableDictionary *imageDownloadsInProgress;
//@property (nonatomic) NSInteger currIDList;

- (void)appImageDidLoad:(NSIndexPath *)indexPath;
- (void)startIconDownload:(MyImageObject *)imgObj forIndexPath:(NSIndexPath *)indexPath;

@end
