//
//  StoreTableViewCtrl.m
//  Me2U
//
//  Created by duong2179 on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StoreTableViewCtrl.h"
#import "Global.h"
#import "SBJson.h"
#import "JSON.h"
#import "define.h"
#import "StoreListProductViewController.h"

@implementation StoreTableViewCtrl

@synthesize dataForTableArr, filterID, cachedImgArr, imageDownloadsInProgress, currIDList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // terminate all pending download connections
    NSArray *allDownloads = [self.imageDownloadsInProgress allValues];
    [allDownloads makeObjectsPerformSelector:@selector(cancelDownload)];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    currIDList = 0; //category
    
    self.imageDownloadsInProgress = [NSMutableDictionary dictionary];
    
    NSString *strGetCategories = [NSString stringWithFormat:@"%@%@",kBaseURL,@"get_categories.php"];
    NSURL *URLGetCategories = [NSURL URLWithString:strGetCategories];
    NSError *error;
    NSString *contentGetCategories = [NSString stringWithContentsOfURL:URLGetCategories 
                                                       encoding:NSASCIIStringEncoding
                                                          error:&error];
    
    
    NSDictionary* result;
    // convert to object
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    result = [jsonParser objectWithString:contentGetCategories error:nil];    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chooseType:) name:@"chooseType" object:nil];

    dataForTableArr = [[NSArray alloc] initWithArray:[result valueForKey:@"categories"]];
    
    //init cache images
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
}

- (void)dealloc
{
    [cachedImgArr release];
	[imageDownloadsInProgress release];
    
    [super dealloc];
}

- (void)chooseType :(NSNotification*)noti{
    NSInteger idList = [[noti object] intValue];
    currIDList = idList;
    
    NSError *error;
    NSLog(@"%d", idList);
    if (idList == 0) {
        NSString *strGetCategories = [NSString stringWithFormat:@"%@%@",kBaseURL,@"get_categories.php"];
        NSURL *URLGetCategories = [NSURL URLWithString:strGetCategories];

        NSString *contentGetCategories = [NSString stringWithContentsOfURL:URLGetCategories 
                                                                  encoding:NSASCIIStringEncoding
                                                                     error:&error];
        
        
        NSDictionary* result;
        // convert to object
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        result = [jsonParser objectWithString:contentGetCategories error:nil];
        
        [dataForTableArr release];
        dataForTableArr = nil;
        dataForTableArr = [[NSArray alloc] initWithArray:[result valueForKey:@"categories"]];
        
        //init cache images
        MyImageObject *imgObj;
        [cachedImgArr release];
        cachedImgArr = nil;
        cachedImgArr = [[NSMutableArray alloc] init];
        for (int i=0; i<[dataForTableArr count]; i++) {
            imgObj = [[MyImageObject alloc] init];
            imgObj.url = [[dataForTableArr objectAtIndex:i] valueForKey:@"image"];
            imgObj.content = nil;
            [cachedImgArr addObject:imgObj];
            [imgObj release];
            imgObj = nil;
        }
        
        [self.tableView reloadData];
    }
    else{
        
        NSString *strGetCategoriesType = [NSString stringWithFormat:@"%@%@%d",kBaseURL,@"filter_products.php?filter_id=",idList];
        NSURL *URLGetCategoriesType = [NSURL URLWithString:strGetCategoriesType];

        NSString *contentGetCategoriesType = [NSString stringWithContentsOfURL:URLGetCategoriesType 
                                                                  encoding:NSASCIIStringEncoding
                                                                     error:&error];
        
        
        NSDictionary* result;
        // convert to object
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        result = [jsonParser objectWithString:contentGetCategoriesType error:nil];
        
        [dataForTableArr release];
        dataForTableArr = nil;
        dataForTableArr = [[NSArray alloc] initWithArray:[result valueForKey:@"products"]];
        
        //init cache images
        MyImageObject *imgObj;
        [cachedImgArr release];
        cachedImgArr = nil;
        cachedImgArr = [[NSMutableArray alloc] init];
        for (int i=0; i<[dataForTableArr count]; i++) {
            imgObj = [[MyImageObject alloc] init];
            imgObj.url = [[dataForTableArr objectAtIndex:i] valueForKey:@"image"];
            imgObj.content = nil;
            [cachedImgArr addObject:imgObj];
            [imgObj release];
            imgObj = nil;
        }
        
        [self.tableView reloadData];
    }
   

    //dataForTableArr = [gDataAccess getDataForCategoryOfStoreSearch];
    //dataForTableArr = [gDataAccess getCategoriesFromDB];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [dataForTableArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier1 = @"StoreCell";
    static NSString *CellIdentifier2 = @"ProductListCell";
    
    if(currIDList==0)
    {
        StoreCell *cell = (StoreCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
        if (cell == nil) {
            NSArray*    nib = [[NSBundle mainBundle] loadNibNamed:@"StoreCell" owner:(id)[StoreCell class] options:nil];
            cell = (StoreCell*)[nib objectAtIndex:0];
        }
        NSString *strName = [[dataForTableArr objectAtIndex:indexPath.row] valueForKey:@"name"];
        [cell.lblProductName setText:strName];
        
        MyImageObject *imgObj = [cachedImgArr objectAtIndex:indexPath.row];
        if(!imgObj.content)
        {
            if (self.tableView.dragging == NO && self.tableView.decelerating == NO)
            {
                [self startIconDownload:imgObj forIndexPath:indexPath];
            }
            // if a download is deferred or in progress, return a placeholder image
            cell.imageView.image = [UIImage imageNamed:@"Placeholder.png"]; 
        }
        else
            //[cell.imvProductLogo setImage:imgObj.content];
            cell.imageView.image = imgObj.content;
        
        return cell;
    }
    else
    {
        ProductListCell *cell = (ProductListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
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
        if(!imgObj.content)
        {
            if (self.tableView.dragging == NO && self.tableView.decelerating == NO)
            {
                [self startIconDownload:imgObj forIndexPath:indexPath];
            }
            // if a download is deferred or in progress, return a placeholder image
            cell.imageView.image = [UIImage imageNamed:@"Placeholder.png"];
            NSLog(@"%f", [cell.imvLogo frame].size.width);
        }
        else
        {
            //[cell.imvLogo setImage:imgObj.content];
            cell.imageView.image = imgObj.content;
            NSLog(@"%f", [cell.imvLogo frame].size.width);
        }
        
        return cell;
    }
    
    // Configure the cell...
    
     
    //cell.textLabel.text = @"123";
    return nil;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (currIDList==0 ? 60.0f : 120.0f);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    
    /*
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ProductDetail* product = [dataForTableArr objectAtIndex:indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cellSelected" object:product];
     */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    for (int i=0; i<[dataForTableArr count]; i++) {
        NSLog(@"%@", [dataForTableArr objectAtIndex:i]);
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cellSelected" object:[[dataForTableArr objectAtIndex:indexPath.row] valueForKey:@"id"]];
   
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
        NSArray *visiblePaths = [self.tableView indexPathsForVisibleRows];
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
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:iconDownloader.indexPathInTableView];
        
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
