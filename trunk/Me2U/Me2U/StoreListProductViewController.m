//
//  StoreListProductViewController.m
//  Me2U
//
//  Created by Le Quang Vinh on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StoreListProductViewController.h"
#import "StoreCell.h"
#import "define.h"
#import "SBJson.h"
#import "JSON.h"

@interface StoreListProductViewController ()

@end

@implementation StoreListProductViewController

@synthesize tbView, category_id, dataForTableArr;

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
    
    NSString *strGetCategories = [NSString stringWithFormat:@"%@%@%d",kBaseURL,@"get_category_products.php?category_id=",category_id];
    NSURL *URLGetCategories = [NSURL URLWithString:strGetCategories];
    NSError *error;
    NSString *contentGetCategories = [NSString stringWithContentsOfURL:URLGetCategories 
                                                              encoding:NSASCIIStringEncoding
                                                                 error:&error];
    
    
    NSDictionary* result;
    // convert to object
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    result = [jsonParser objectWithString:contentGetCategories error:nil];
    
    NSLog(@"%@",[result description]);
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //prepare data here
    dataForTableArr = [[NSArray alloc] initWithArray:[result valueForKey:@"status"]];
    //dataForTableArr = [result valueForKey:@"categories"];
    
    NSLog(@"%@",[dataForTableArr description]);
    
    NSLog(@"%d",[dataForTableArr count]);
    
    
    // Do any additional setup after loading the view from its nib.
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
//    NSString *strName = [[dataForTableArr objectAtIndex:indexPath.row] valueForKey:@"name"];
//    NSString *strImage = [[dataForTableArr objectAtIndex:indexPath.row] valueForKey:@"image"];
//    NSURL *url = [NSURL URLWithString:strImage];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    UIImage *img = [[[UIImage alloc] initWithData:data] autorelease];
//    [cell.imvProductLogo setImage:img];
//    //cell.imvProductLogo.image = [UIImage imageWithContentsOfURL:[NSURL URLWithString:strImage]];
//    
//    
//    [cell.lblProductName setText:strName];
    
    cell.textLabel.text = @"123";
    return cell;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}


@end
