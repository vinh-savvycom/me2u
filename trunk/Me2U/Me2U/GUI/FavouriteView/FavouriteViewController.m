//
//  FavouriteViewController.m
//  Me2U
//
//  Created by Le Quang Vinh on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FavouriteViewController.h"
#import "define.h"
#import "SBJson.h"
#import "JSON.h"
#import "ProductListCell.h"
#import "AppDelegate.h"

@interface FavouriteViewController ()

@end

@implementation FavouriteViewController

@synthesize tbView, dataForTableArr, cachedImgArr, imageDownloadsInProgress;

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

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.imageDownloadsInProgress = [NSMutableDictionary dictionary];
    
    [dataForTableArr release];
    dataForTableArr = [[NSMutableArray alloc] init];
    
    NSFetchRequest* fetchRsq = [[NSFetchRequest alloc] init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"Favourite" inManagedObjectContext:[self managedObjectContext]];
    [fetchRsq setEntity:entity];
    
    NSError* requestErr = nil;
    
    NSArray* favourites = [self.managedObjectContext executeFetchRequest:fetchRsq error:&requestErr];
    if ([favourites count] > 0)
    {
        for(Favourite *fau in favourites)
        {
            NSString *strGetProductDetail = [NSString stringWithFormat:@"%@%@%d", kBaseURL, @"get_product_by_id.php?product_id=", fau.id_product.intValue];
            NSURL *URLGetProductDetail = [NSURL URLWithString:strGetProductDetail];
            NSError *error;
            NSString *contentGetProductDetail = [NSString stringWithContentsOfURL:URLGetProductDetail 
                                                                         encoding:NSASCIIStringEncoding
                                                                            error:&error];
            
            NSDictionary* result;
            // convert to object
            SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
            result = [jsonParser objectWithString:contentGetProductDetail error:nil];
            NSLog(@"%@", result);
            NSDictionary *dicProductDetail = [[NSDictionary alloc] initWithDictionary:[result valueForKey:@"product"]];
            
            [dataForTableArr addObject:dicProductDetail];
        }
    }
    
    MyImageObject *imgObj;
    cachedImgArr = [[NSMutableArray alloc] init];
    for (int i=0; i<[dataForTableArr count]; i++) {
        NSLog(@"%@", [dataForTableArr objectAtIndex:i]);
        imgObj = [[MyImageObject alloc] init];
        imgObj.url = [[dataForTableArr objectAtIndex:i] valueForKey:@"image"];
        imgObj.content = nil;
        [cachedImgArr addObject:imgObj];
        [imgObj release];
        imgObj = nil;
    }
    
    [tbView reloadData];
}

- (void)dealloc
{
    [dataForTableArr release];
    [cachedImgArr release];
    [imageDownloadsInProgress release];
    
    [super release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataForTableArr count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ProductListCell";
    
    ProductListCell *cell = (ProductListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray*    nib = [[NSBundle mainBundle] loadNibNamed:@"ProductListCell" owner:(id)[ProductListCell class] options:nil];
        cell = (ProductListCell*)[nib objectAtIndex:0];
    }
    NSString *strName = [[dataForTableArr objectAtIndex:indexPath.row] valueForKey:@"name"];
    [cell.lblProductName setText:strName];
    NSString *strModel = [[dataForTableArr objectAtIndex:indexPath.row] valueForKey:@"model"];
    [cell.lblProductModel setText:strModel];
    NSString *strPrice = [[dataForTableArr objectAtIndex:indexPath.row] valueForKey:@"price"];
    NSString *strPriceUSD = [NSString stringWithFormat:@"Price: %@ USD", strPrice];
    [cell.lblProductPrice setText:strPriceUSD];
    int quantity = [[[dataForTableArr objectAtIndex:indexPath.row] valueForKey:@"quantity"] intValue];
    NSString *strQuantity = [NSString stringWithFormat:@"Quantity: %d", quantity];
    [cell.lblProductQuantity setText:strQuantity];
    NSString *strDes = [[dataForTableArr objectAtIndex:indexPath.row] valueForKey:@"description"];
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
    else {
        //[cell.imvLogo setImage:imgObj.content];
        cell.imageView.image = imgObj.content;
    }
    
    return cell;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}

#pragma mark -
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

#pragma mark --
#pragma mark database

- (NSManagedObjectContext *) managedObjectContext{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    return managedObjectContext;
}

@end
