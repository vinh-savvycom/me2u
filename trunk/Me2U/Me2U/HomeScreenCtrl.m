//
//  HomeScreenCtrl.m
//  Me2U
//
//  Created by duong2179 on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeScreenCtrl.h"
#import "FavouriteViewController.h"

@implementation HomeScreenCtrl

@synthesize tbarCtrl;

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
    
    //background
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"homeBkg.png"]]];
    
    [self createTabbar];
    
    //home logo
    float offsetY = 30.0f;
    float paddingY = 15.0f;
    float paddingCategory = 50.0f;
    float screenWidth = 320.0f;
    
    UIImage *imgHomeLogo = [UIImage imageNamed:@"homeLogo.png"];
    UIImageView *imvHomeLogo = [[UIImageView alloc] initWithImage:imgHomeLogo];
    [imvHomeLogo setCenter:CGPointMake(screenWidth/2, offsetY + imgHomeLogo.size.height/2)];
    [self.view addSubview:imvHomeLogo];
    [imvHomeLogo release];
    
    UIImage *imgCategoryBounder = [UIImage imageNamed:@"categoryBounder.png"];
    UIImageView *imvCategoryBounder = [[UIImageView alloc] initWithImage:imgCategoryBounder];
    [imvCategoryBounder setCenter:CGPointMake(screenWidth/2, offsetY + imgHomeLogo.size.height + paddingY + imgCategoryBounder.size.height/2)];
    [self.view addSubview:imvCategoryBounder];
    [imvCategoryBounder release];
    
    float categoryBounderOriginY = [imvCategoryBounder frame].origin.y;
    UIImage *imgClickOnCategory = [UIImage imageNamed:@"clickOnCategory.png"];
    UIImageView *imvClickOnCategory = [[UIImageView alloc] initWithImage:imgClickOnCategory];
    [imvClickOnCategory setCenter:CGPointMake(screenWidth/2, categoryBounderOriginY + paddingCategory)];
    [self.view addSubview:imvClickOnCategory];
    [imgClickOnCategory release];
    
    UIImage *imgButtonBounder = [UIImage imageNamed:@"buttonBounder.png"];
    
    UIButton *btnStore = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, imgButtonBounder.size.width, imgButtonBounder.size.height)];
    [btnStore setImage:imgButtonBounder forState:UIControlStateNormal];
    [btnStore setCenter:CGPointMake(screenWidth/2, offsetY + imgHomeLogo.size.height + paddingY + 70.0f + imgButtonBounder.size.height/2)];
    [self.view addSubview:btnStore];
    [btnStore addTarget:self action:@selector(goToStoreScreen) forControlEvents:UIControlEventTouchDown];
    [btnStore release];
    //Store text
    UIImageView *imvStoreTxt = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"storeTxt.png"]];
    [imvStoreTxt setCenter:CGPointMake(screenWidth/2, offsetY + imgHomeLogo.size.height + paddingY + 70.0f + imgButtonBounder.size.height/2)];
    CGRect frame = [imvStoreTxt frame];
    frame.origin.x = 100.0f;
    [imvStoreTxt setFrame:frame];
    [self.view addSubview:imvStoreTxt];
    
    float prevCategoryOriginY = [btnStore frame].origin.y;
    UIButton *btnGiftCategory = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, imgButtonBounder.size.width, imgButtonBounder.size.height)];
    [btnGiftCategory setImage:imgButtonBounder forState:UIControlStateNormal];
    [btnGiftCategory setCenter:CGPointMake(screenWidth/2, prevCategoryOriginY + paddingCategory + imgButtonBounder.size.height/2)];
    [self.view addSubview:btnGiftCategory];
    [btnGiftCategory addTarget:self action:@selector(goToGiftTypeScreen) forControlEvents:UIControlEventTouchDown];
    [btnGiftCategory release];
    //Gift Type text
    UIImageView *imvGiftCategoryTxt = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"giftTypeTxt.png"]];
    [imvGiftCategoryTxt setCenter:CGPointMake(screenWidth/2, prevCategoryOriginY + paddingCategory + imgButtonBounder.size.height/2)];
    frame = [imvGiftCategoryTxt frame];
    frame.origin.x = 100.0f;
    [imvGiftCategoryTxt setFrame:frame];
    [self.view addSubview:imvGiftCategoryTxt];
    
    prevCategoryOriginY = [btnGiftCategory frame].origin.y;
    UIButton *btnPriceRange = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, imgButtonBounder.size.width, imgButtonBounder.size.height)];
    [btnPriceRange setImage:imgButtonBounder forState:UIControlStateNormal];
    [btnPriceRange setCenter:CGPointMake(screenWidth/2, prevCategoryOriginY + paddingCategory + imgButtonBounder.size.height/2)];
    [self.view addSubview:btnPriceRange];
    [btnPriceRange addTarget:self action:@selector(goToPriceRangeScreen) forControlEvents:UIControlEventTouchDown];
    [btnPriceRange release];
    //Price Range text
    UIImageView *imvPriceRangeTxt = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"priceRangeTxt.png"]];
    [imvPriceRangeTxt setCenter:CGPointMake(screenWidth/2, prevCategoryOriginY + paddingCategory + imgButtonBounder.size.height/2)];
    frame = [imvPriceRangeTxt frame];
    frame.origin.x = 100.0f;
    [imvPriceRangeTxt setFrame:frame];
    [self.view addSubview:imvPriceRangeTxt];
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)dealloc
{
    [tbarCtrl release];
    
    [super dealloc];
}

#pragma mark - custom actions
- (void)goToPriceRangeScreen
{
    NSLog(@"go to price range list");
    
    GiftTypeViewController *vcGiftType = [[GiftTypeViewController alloc] initWithNibName:@"GiftTypeViewController" bundle:nil];
    vcGiftType.frowView = 1;
    [self.navigationController pushViewController:vcGiftType animated:YES];
    self.navigationController.navigationBarHidden = NO;
    [vcGiftType release];
}

- (void)goToGiftTypeScreen
{
    NSLog(@"go to gift type list");
    
    GiftTypeViewController *vcGiftType = [[GiftTypeViewController alloc] initWithNibName:@"GiftTypeViewController" bundle:nil];
    vcGiftType.frowView = 0;
    [self.navigationController pushViewController:vcGiftType animated:YES];
    self.navigationController.navigationBarHidden = NO;
    [vcGiftType release];
}

- (void)goToStoreScreen
{
    NSLog(@"go to store list");
    
    [tbarCtrl setSelectedIndex:1];
    [tbarCtrl setTitle:@"Search Store"];
    
    [self.navigationController pushViewController:tbarCtrl animated:YES];
    self.navigationController.navigationBarHidden = NO;
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Search" style:UIBarButtonItemStylePlain target:self action:@selector(searchStore)];      
    tbarCtrl.navigationItem.rightBarButtonItem = anotherButton;
    self.navigationItem.backBarButtonItem = nil;
}

- (void)createTabbar {
    
    tbarCtrl = [[UITabBarController alloc] init];
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    ComingSoon* storeCtrl;
    
    storeCtrl = [[ComingSoon alloc] init];
    [storeCtrl.tabBarItem initWithTitle:@"Home" image:[UIImage imageNamed:@"shopping.png"] tag:100];
    [controllers addObject:storeCtrl];
    
    StoreScreenCtrl* storeScreenCtrl = [[StoreScreenCtrl alloc] init];
    [storeScreenCtrl.tabBarItem initWithTitle:@"Store Search" image:[UIImage imageNamed:@"cart.png"] tag:101];
    [controllers addObject:storeScreenCtrl];
    
    FavouriteViewController *vcFavour = [[FavouriteViewController alloc] init];
    [vcFavour.tabBarItem initWithTitle:@"Favourites" image:[UIImage imageNamed:@"shopping.png"] tag:102];
    [controllers addObject:vcFavour];
    
    ShoppingBasketCtrl *basketCtrl = [[ShoppingBasketCtrl alloc] init];
    [basketCtrl.tabBarItem initWithTitle:@"Shopping Basket" image:[UIImage imageNamed:@"cart.png"] tag:103];
    [controllers addObject:basketCtrl];
    
    tbarCtrl.viewControllers = controllers;
	tbarCtrl.customizableViewControllers = controllers;
	tbarCtrl.delegate = self;

}

- (void)searchStore
{
    NSLog(@"Search items here");
}

#pragma mark - delegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if ([tbarCtrl selectedIndex] == 0) {
        NSLog(@"back to home");
        [tbarCtrl.navigationController popViewControllerAnimated:YES];
    }
    else if([tbarCtrl selectedIndex]==1)
    {
        [tbarCtrl setTitle:@"Search Store"];
        UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Search" style:UIBarButtonItemStylePlain target:self action:@selector(searchStore)];      
        tbarCtrl.navigationItem.rightBarButtonItem = anotherButton;
    }
    else if([tbarCtrl selectedIndex]==2)
    {
        [tbarCtrl setTitle:@"Favourites"];
        tbarCtrl.navigationItem.rightBarButtonItem = nil;
    }
    else if([tbarCtrl selectedIndex]==3)
    {
        [tbarCtrl setTitle:@"Basket"];
        tbarCtrl.navigationItem.rightBarButtonItem = nil;
    }
}

@end
