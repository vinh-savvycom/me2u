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

@synthesize dataForTableArr, filterID;

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
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
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

}

- (void)chooseType :(NSNotification*)noti{
    NSInteger idList = [[noti object] intValue];
        NSError *error;
    NSLog(@"%d",idList);
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
        
        dataForTableArr = [[NSArray alloc] initWithArray:[result valueForKey:@"categories"]]; 
        
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
        
        dataForTableArr = [[NSArray alloc] initWithArray:[result valueForKey:@"products"]];
        
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
    static NSString *CellIdentifier = @"StoreCell";
    
    StoreCell *cell = (StoreCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray*    nib = [[NSBundle mainBundle] loadNibNamed:@"StoreCell" owner:(id)[StoreCell class] options:nil];
        cell = (StoreCell*)[nib objectAtIndex:0];
    }
    
    // Configure the cell...

    //ProductDetail* productTemp = [dataForTableArr objectAtIndex:indexPath.row];
    NSString *strName = [[dataForTableArr objectAtIndex:indexPath.row] valueForKey:@"name"];
    NSString *strImage = [[dataForTableArr objectAtIndex:indexPath.row] valueForKey:@"image"];
    NSURL *url = [NSURL URLWithString:strImage];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[[UIImage alloc] initWithData:data] autorelease];
    [cell.imvProductLogo setImage:img];
    //cell.imvProductLogo.image = [UIImage imageWithContentsOfURL:[NSURL URLWithString:strImage]];

    //ProductDetail* productTemp = [dataForTableArr objectAtIndex:indexPath.row];
    //[cell.imvProductLogo setImage:[UIImage imageNamed:productTemp.linkToImgProduct]];
    //[cell.lblProductName setText:productTemp.titleProduct];
    
    //Category* cate = [dataForTableArr objectAtIndex:indexPath.row];
    //[cell.imvProductLogo setImage:[UIImage imageNamed:cate.image]];
    //[cell.lblProductName setText:cate.name];

    

    [cell.lblProductName setText:strName];
     
    //cell.textLabel.text = @"123";
    return cell;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
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
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cellSelected" object:[[dataForTableArr objectAtIndex:indexPath.row] valueForKey:@"id"]];
   
}

@end
