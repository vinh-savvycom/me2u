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

@interface ProductDetailCtrl : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) IBOutlet UILabel *lblTitleProduct;
@property (nonatomic, retain) IBOutlet UIImageView *imvImgProduct;
@property (nonatomic, retain) IBOutlet UILabel *lblShop;
@property (nonatomic, retain) IBOutlet UILabel *lblManufacturer;
@property (nonatomic, retain) IBOutlet UILabel *lblPrice;
@property (nonatomic, retain) IBOutlet UITextView *txvDescription;
@property (nonatomic, retain) IBOutlet UIButton *btnAddFavourite;
@property (nonatomic, retain) IBOutlet UIButton *btnAddBasket;
@property (nonatomic, retain) IBOutlet UITextField *txfNumber;

- (IBAction)addToBasket:(id)sender;
- (IBAction)addToFavourite:(id)sender;

@property (nonatomic, retain) ProductDetail *product;

- (id)initWithProductDetail:(ProductDetail*)productTemp;

@end
