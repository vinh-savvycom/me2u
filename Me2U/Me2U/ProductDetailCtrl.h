//
//  ProductDetailCtrl.h
//  Me2U
//
//  Created by duong2179 on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDetail.h"
#import "Global.h"
#import "define.h"
#import "SBJson.h"
#import "JSON.h"
#import "Favourite.h"

@interface ProductDetailCtrl : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (nonatomic, retain) IBOutlet UILabel *lblTitleProduct;
@property (nonatomic, retain) IBOutlet UIImageView *imvImgProduct;
@property (nonatomic, retain) IBOutlet UILabel *lblModel;
@property (nonatomic, retain) IBOutlet UILabel *lblManufacturer;
@property (nonatomic, retain) IBOutlet UILabel *lblPrice;
@property (nonatomic, retain) IBOutlet UILabel *lblQuantity;
@property (nonatomic, retain) IBOutlet UITextView *txvDescription;
@property (nonatomic, retain) IBOutlet UIButton *btnAddFavourite;
@property (nonatomic, retain) IBOutlet UIButton *btnAddBasket;
@property (nonatomic, retain) IBOutlet UITextField *txfNumber;
@property (nonatomic) int idProduct;
@property (nonatomic, retain) NSDictionary *dicProductDetail;

- (IBAction)addToBasket:(id)sender;
- (IBAction)addToFavourite:(id)sender;

@property (nonatomic, retain) ProductDetail *product;

- (id)initWithProductDetail:(ProductDetail*)productTemp;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andIdProduct:(int)idProductTemp;
- (NSManagedObjectContext *) managedObjectContext;

@end
