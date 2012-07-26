//
//  FavouriteViewController.h
//  Me2U
//
//  Created by Le Quang Vinh on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IconDownloader.h"
#import "MyImageObject.h"

@interface FavouriteViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, IconDownloaderDelegate, UIScrollViewDelegate>

@property (nonatomic, retain) IBOutlet UITableView *tbView;
@property (nonatomic, retain) NSMutableArray               *dataForTableArr;
@property (nonatomic, retain) NSMutableArray *cachedImgArr;
@property (nonatomic, retain) NSMutableDictionary *imageDownloadsInProgress;
//@property (nonatomic) NSInteger currIDList;

- (void)appImageDidLoad:(NSIndexPath *)indexPath;
- (void)startIconDownload:(MyImageObject *)imgObj forIndexPath:(NSIndexPath *)indexPath;
- (NSManagedObjectContext *) managedObjectContext;
- (void)deleteRecode:(NSString*)entityDescription andID:(NSInteger)idRecord;

@end
