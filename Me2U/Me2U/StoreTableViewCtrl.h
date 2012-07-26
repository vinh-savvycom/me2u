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
#import "MyImageObject.h"
#import "IconDownloader.h"
#import "ProductListCell.h"

@interface StoreTableViewCtrl : UITableViewController <IconDownloaderDelegate, UIScrollViewDelegate>

@property (nonatomic, retain) NSArray* dataForTableArr;
@property (nonatomic) NSInteger     filterID;
@property (nonatomic, retain) NSMutableArray *cachedImgArr;
@property (nonatomic, retain) NSMutableDictionary *imageDownloadsInProgress;
@property (nonatomic) NSInteger currIDList;
@property (nonatomic, retain) IBOutlet UISearchBar *searBar;

- (void)appImageDidLoad:(NSIndexPath *)indexPath;
- (void)startIconDownload:(MyImageObject *)imgObj forIndexPath:(NSIndexPath *)indexPath;

@end
