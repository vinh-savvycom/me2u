//
//  ProductDetailCtrl.m
//  Me2U
//
//  Created by duong2179 on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProductDetailCtrl.h"

@implementation ProductDetailCtrl

@synthesize lblTitleProduct;
@synthesize imvImgProduct;
@synthesize lblShop;
@synthesize lblManufacturer;
@synthesize lblPrice;
@synthesize txvDescription;
@synthesize btnAddFavourite;
@synthesize btnAddBasket;
@synthesize product;

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.lblTitleProduct setText:product.titleProduct];
    [self.imvImgProduct setImage:[UIImage imageNamed:product.linkToImgProduct]];
    [self.lblManufacturer setText:product.manufacturerProduct];
    [self.lblPrice setText:[NSString stringWithFormat:@"%f", product.priceProduct]];
    [self.lblShop setText:product.shopProduct];
    [self.txvDescription setText:product.descriptionProduct];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{
    [product release];
    
    [super release];
}

#pragma mark - custom action
- (id)initWithProductDetail:(ProductDetail*)productTemp
{
    self = [super init];
	if (self) {
        self.product = productTemp;
	}
	return self;
}

@end
