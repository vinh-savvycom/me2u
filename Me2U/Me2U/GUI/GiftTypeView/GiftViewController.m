//
//  GiftViewController.m
//  Me2U
//
//  Created by Le Quang Vinh on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GiftViewController.h"
#import "define.h"
#import "JSON.h"
#import "SBJson.h"
#import "MyImageObject.h"
#import "ProductListCell.h"
#import "IconDownloader.h"

@interface GiftViewController ()

@end

@implementation GiftViewController

@synthesize arrayGift, tbView, strID, cachedImgArr, imageDownloadsInProgress;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"All Product"];
    NSError *error;
    NSInteger idList = [strID intValue];
    NSString *strGetCategoriesType = [NSString stringWithFormat:@"%@%@%d",kBaseURL,@"filter_products.php?filter_id=",idList];
    NSURL *URLGetCategoriesType = [NSURL URLWithString:strGetCategoriesType];
    
    NSString *contentGetCategoriesType = [NSString stringWithContentsOfURL:URLGetCategoriesType 
                                                                  encoding:NSASCIIStringEncoding
                                                                     error:&error];
    
    
    NSDictionary* result;
    // convert to object
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    result = [jsonParser objectWithString:contentGetCategoriesType error:nil];
    
    
    arrayGift = [[NSArray alloc] initWithArray:[result valueForKey:@"products"]];
    
    //init cache images
    MyImageObject *imgObj;
    cachedImgArr = [[NSMutableArray alloc] init];
    for (int i=0; i<[arrayGift count]; i++) {
        imgObj = [[MyImageObject alloc] init];
        imgObj.url = [[arrayGift objectAtIndex:i] valueForKey:@"image"];
        imgObj.content = nil;
        [cachedImgArr addObject:imgObj];
        [imgObj release];
        imgObj = nil;
    }

    
    
    // Do any additional setup after loading the view from its nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // terminate all pending download connections
    NSArray *allDownloads = [self.imageDownloadsInProgress allValues];
    [allDownloads makeObjectsPerformSelector:@selector(cancelDownload)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayGift count];
}
- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier2 = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
//    
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"%@",[arrayGift objectAtIndex:indexPath.row]];
//    
//    return cell;
    
    ProductListCell *cell = (ProductListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
    if (cell == nil) {
        NSArray*    nib = [[NSBundle mainBundle] loadNibNamed:@"ProductListCell" owner:(id)[ProductListCell class] options:nil];
        cell = (ProductListCell*)[nib objectAtIndex:0];
    }
    NSString *strName = [[arrayGift objectAtIndex:indexPath.row] valueForKey:@"name"];
    [cell.lblProductName setText:strName];
    NSString *strModel = [[arrayGift objectAtIndex:indexPath.row] valueForKey:@"model"];
    [cell.lblProductModel setText:strModel];
    NSString *strPrice = [[arrayGift objectAtIndex:indexPath.row] valueForKey:@"price"];
    NSString *strPriceUSD = [NSString stringWithFormat:@"Price: %@ USD", strPrice];
    [cell.lblProductPrice setText:strPriceUSD];
    int quantity = [[[arrayGift objectAtIndex:indexPath.row] valueForKey:@"quantity"] intValue];
    NSString *strQuantity = [NSString stringWithFormat:@"Quantity: %d", quantity];
    [cell.lblProductQuantity setText:strQuantity];
    NSString *strDes = [[arrayGift objectAtIndex:indexPath.row] valueForKey:@"description"];
    [cell.txvProductDescription setText:strDes];
    
    MyImageObject *imgObj = [cachedImgArr objectAtIndex:indexPath.row];
    cell.imvLogo.contentMode = UIViewContentModeScaleAspectFit;
    
    if(!imgObj.content)
    {
        if (self.tbView.dragging == NO && self.tbView.decelerating == NO)
        {
            [self startIconDownload:imgObj forIndexPath:indexPath];
        }
        // if a download is deferred or in progress, return a placeholder image
        cell.imageView.image = [UIImage imageNamed:@"Placeholder.png"];
    }
    else
    {
        //[cell.imvLogo setImage:imgObj.content];
        cell.imageView.image = imgObj.content;
    }
    
    return cell;

}

#pragma mark Table cell image support

- (void)startIconDownload:(MyImageObject *)imgObj forIndexPath:(NSIndexPath *)indexPath
{
    IconDownloader *iconDownloader = [imageDownloadsInProgress objectForKey:indexPath];
    //if (iconDownloader == nil) 
    {
        iconDownloader = [[IconDownloader alloc] init];
        iconDownloader.imgObj = imgObj;
        iconDownloader.indexPathInTableView = indexPath;
        iconDownloader.delegate = self;
        [imageDownloadsInProgress setObject:iconDownloader forKey:indexPath];
        [iconDownloader startDownload];
        [iconDownloader release];   
    }
}

// this method is used in case the user scrolled into a set of cells that don't have their app icons yet
- (void)loadImagesForOnscreenRows
{
    if ([self.cachedImgArr count] > 0)
    {
        NSArray *visiblePaths = [self.tbView indexPathsForVisibleRows];
        for (NSIndexPath *indexPath in visiblePaths)
        {
            MyImageObject *imgObj = [self.cachedImgArr objectAtIndex:indexPath.row];
            
            if (!imgObj.content) // avoid the app icon download if the app already has an icon
            {
                [self startIconDownload:imgObj forIndexPath:indexPath];
            }
        }
    }
}

// called by our ImageDownloader when an icon is ready to be displayed
- (void)appImageDidLoad:(NSIndexPath *)indexPath
{
    IconDownloader *iconDownloader = [imageDownloadsInProgress objectForKey:indexPath];
    if (iconDownloader != nil)
    {
        UITableViewCell *cell = [self.tbView cellForRowAtIndexPath:iconDownloader.indexPathInTableView];
        
        // Display the newly loaded image
        cell.imageView.image = iconDownloader.imgObj.content;
    }
}


#pragma mark -
#pragma mark Deferred image loading (UIScrollViewDelegate)

// Load images for all onscreen rows when scrolling is finished
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
	{
        [self loadImagesForOnscreenRows];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self loadImagesForOnscreenRows];
}


@end
