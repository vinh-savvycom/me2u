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
@synthesize lblModel;
@synthesize lblManufacturer;
@synthesize lblPrice;
@synthesize txvDescription;
@synthesize btnAddFavourite;
@synthesize btnAddBasket;
@synthesize txfNumber;
@synthesize product;
@synthesize idProduct;
@synthesize dicProductDetail;
@synthesize lblQuantity;

int numberAddBasket = 0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andIdProduct:(int)idProductTemp
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        idProduct = idProductTemp;
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
    
    [txfNumber setDelegate:self];
    [txfNumber setText:@"0"];
    
    NSString *strGetProductDetail = [NSString stringWithFormat:@"%@%@%d", kBaseURL, @"get_product_by_id.php?product_id=", idProduct];
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
    dicProductDetail = [[NSDictionary alloc] initWithDictionary:[result valueForKey:@"product"]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [lblTitleProduct setText:[dicProductDetail valueForKey:@"name"]];
    //[imvImgProduct setFrame:CGRectMake(2.0f, 36.0f, 100.0f, 80.0f)];
    UIImage *imgLogo = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[dicProductDetail valueForKey:@"image"]]]];
    [imvImgProduct setImage:imgLogo];
    [lblManufacturer setText:[dicProductDetail valueForKey:@"manufacturer"]];
    [lblPrice setText:[dicProductDetail valueForKey:@"price"]];
    [lblQuantity setText:[dicProductDetail valueForKey:@"quantity"]];
    [lblModel setText:[dicProductDetail valueForKey:@"model"]];
    [txvDescription setText:[dicProductDetail valueForKey:@"description"]];

    /*
    UIImageView* imv = [[UIImageView alloc] initWithFrame:CGRectMake(2.0f, 36.0f, 100.0f, 80.0f)];
    [imv setImage:[UIImage imageNamed:product.linkToImgProduct]];
    [self.view addSubview:imv];
    [imv release];
     */
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{
    [product release];
    [dicProductDetail release];
    
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

- (IBAction)addToBasket:(id)sender
{
    NSLog(@"Add to Basket");
    
    if (numberAddBasket<=0) {
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Number should be larger than 0" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert1 show];
        return;
    }
    product.numberAddBasket = numberAddBasket;
    NSLog(@"So luong: %d", numberAddBasket);
    [arrOfBasket addObject:product];
    numberAddBasket = 0;
    [txfNumber setText:@"0"];
    
    UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Success" message:@"The product added to basket" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert2 show];
    
    return;
}

- (IBAction)addToFavourite:(id)sender
{
    NSLog(@"Add to Favourite");
    
    
}

#pragma mark - delegate
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [txfNumber resignFirstResponder];
    NSString *strInput = [txfNumber text];
    numberAddBasket = [strInput intValue];
    if(numberAddBasket==0)
        [txfNumber setText:@"0"];
    
    return YES;
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    numberAddBasket = 0;
    [txfNumber setText:@""];
    
    return YES;
}

@end
