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
    
//    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]
//                                              initWithBarButtonSystemItem:UIBarButtonSystemItemSearch 
//                                              target:self
//                                              action:@selector(showSearch:)] autorelease];
//    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelEdit:)];
    
    UIBarButtonItem *btnSynch = [[UIBarButtonItem alloc] initWithTitle:@"Synch" style:UIBarButtonItemStylePlain target:self action:@selector(onSynchData)];
    self.navigationItem.rightBarButtonItem = btnSynch;
    [btnSynch release];

    
    
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showListProduct:) name:@"showListProduct" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showProductDetail:) name:@"showProductDetail" object:nil];
}


- (void)showSearch:(id)sender {
    // toggle visibility of the search bar
    [self setSearchVisible:(searchBar.alpha != 1.0)];
}

- (void)setSearchVisible:(BOOL)visible {
    // assume searchBar is an instance variable
    UIView *mainView = tableViewCtrl.tableView; // set this to whatever your non-searchBar view is
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:UINavigationControllerHideShowBarDuration];
    if (!visible) {
        searchBar.alpha = 0.0;
        CGRect frame = mainView.frame;
        frame.origin.y = 0;
        frame.size.height += searchBar.bounds.size.height;
        mainView.frame = frame;
    } else {
        searchBar.alpha = 1.0;
        CGRect frame = mainView.frame;
        frame.origin.y = searchBar.bounds.size.height;
        frame.size.height -= searchBar.bounds.size.height;
        mainView.frame = frame;
    }
    [UIView commitAnimations];
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

- (void)showListProduct:(NSNotification *)noti
{
    /*
    NSLog(@"did receive notification");
    ProductDetail *product = (ProductDetail*)[noti object];
    
    NSLog(@"%@", product.titleProduct);
    
    ProductDetailCtrl *productDetailCtrl = [[ProductDetailCtrl alloc] initWithProductDetail:product];
    [self.navigationController pushViewController:productDetailCtrl animated:YES];
    */
    
    NSInteger idList = [[noti object] intValue];
    
    NSLog(@"Show List Product of Category");
    NSLog(@"%d", idList);
    
    StoreListProductViewController *vcList = [[StoreListProductViewController alloc] initWithNibName:@"StoreListProductViewController" bundle:nil];
    vcList.category_id = idList;
    [self.navigationController pushViewController:vcList animated:YES];
    [vcList release];
}

- (void)showProductDetail:(NSNotification *)noti
{
    NSLog(@"Show Product Detail");
    NSInteger idProduct = [[noti object] intValue];
    NSLog(@"idProduct = %d", idProduct);
    
    ProductDetailCtrl *productDetail = [[ProductDetailCtrl alloc] initWithNibName:@"ProductDetailCtrl" bundle:nil andIdProduct:idProduct];
    [self.navigationController pushViewController:productDetail animated:YES];
    [productDetail release];
}

#pragma mark - delegate

@end
