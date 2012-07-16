//
//  StoreScreenCtrl.m
//  Me2U
//
//  Created by duong2179 on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StoreScreenCtrl.h"
#import "StoreListProductViewController.h"

@implementation StoreScreenCtrl

@synthesize tableViewCtrl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
    // Do any additional setup after loading the view from its nib.
    
    UIButton *btnCategory = [UIButton buttonWithType:UIButtonTypeRoundedRect];;
    [btnCategory setFrame:CGRectMake(10.0f, 10.0f, 300.0f, 25.0f)];
    [btnCategory setTintColor:[UIColor darkGrayColor]];
    [btnCategory setTitle:@"Category" forState:UIControlStateNormal];
    [self.view addSubview:btnCategory];
    [btnCategory setTag:BTN_CATEGORY_TAG];
    [btnCategory addTarget:self action:@selector(categorySelected:) forControlEvents:UIControlEventTouchDown];
    
    
    
    
    //tableview
    tableViewCtrl = [[StoreTableViewCtrl alloc] init];
    UITableView *tableView = tableViewCtrl.tableView;
    tableView.tag = TBViewStore_TAG;
    [tableView setFrame:CGRectMake(0.0f, 44.0f, 320.0f, 412.0f)];
    [self.view addSubview:tableView];
    
    //notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cellDidSelect:) name:@"cellSelected" object:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{
    [tableViewCtrl release];
    
    [super dealloc];
}

#pragma mark - custom actions
- (void)categorySelected:(id)sender
{
    CatetoryPickerView* picker = [[CatetoryPickerView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 460.0f - 44.0f - 49.0f)];
    [self.view addSubview:picker];
    [picker release];
    picker.storeCtrl = self;
}

- (void)cellDidSelect:(NSNotification *)noti
{
    /*
    NSLog(@"did receive notification");
    ProductDetail *product = (ProductDetail*)[noti object];
    
    NSLog(@"%@", product.titleProduct);
    
    ProductDetailCtrl *productDetailCtrl = [[ProductDetailCtrl alloc] initWithProductDetail:product];
    [self.navigationController pushViewController:productDetailCtrl animated:YES];
    */
    
    NSInteger idList = [[noti object] intValue];
    
    NSLog(@"%d",idList);
    StoreListProductViewController *vcList = [[StoreListProductViewController alloc] initWithNibName:@"StoreListProductViewController" bundle:nil];
    vcList.category_id = idList;
    [self.navigationController pushViewController:vcList animated:YES];
    [vcList release];
}

#pragma mark - delegate

@end
