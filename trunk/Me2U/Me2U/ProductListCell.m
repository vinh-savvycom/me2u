//
//  ProductListCell.m
//  Me2U
//
//  Created by duong2179 on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProductListCell.h"

@implementation ProductListCell

@synthesize imvLogo, lblProductName, lblProductModel, lblProductPrice, lblProductQuantity, txvProductDescription;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
