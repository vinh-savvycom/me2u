//
//  StoreScreenCtrl.h
//  Me2U
//
//  Created by duong2179 on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreTableViewCtrl.h"
#import "CatetoryPickerView.h"
#import "define.h"

@interface StoreScreenCtrl : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, retain) StoreTableViewCtrl* tableViewCtrl;

- (void)categorySelected:(id)sender;

@end
