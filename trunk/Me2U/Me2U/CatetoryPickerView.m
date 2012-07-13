//
//  CatetoryPickerView.m
//  Me2U
//
//  Created by duong2179 on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CatetoryPickerView.h"
#import "StoreScreenCtrl.h"
#import "define.h"
#import "SBJson.h"
#import "JSON.h"

@implementation CatetoryPickerView

@synthesize arrOfCategory, storeCtrl, arrOfType;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        
        //arrOfCategory = [[NSMutableArray alloc] initWithObjects:@"Category", @"For Special Female", @"For Special Male", @"For Female Friend", @"For Male Friend", @"For Valentines", @"For Mother's Day", @"For Father's Day", nil];
        
        
        NSString *strGetCategories = [NSString stringWithFormat:@"%@%@",kBaseURL,@"get_filters.php"];
        NSURL *URLGetCategories = [NSURL URLWithString:strGetCategories];
        NSError *error;
        NSString *contentGetCategories = [NSString stringWithContentsOfURL:URLGetCategories 
                                                                  encoding:NSASCIIStringEncoding
                                                                     error:&error];
        
        
        NSDictionary* result;
        // convert to object
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        result = [jsonParser objectWithString:contentGetCategories error:nil];
        arrOfCategory = [[NSMutableArray alloc] initWithCapacity:0];
        [arrOfCategory addObject:@"Category"];
        NSLog(@"%@",[result description]);
        NSArray *arrayTem = [result valueForKey:@"filters"];
        for (int i = 0; i < [arrayTem count]; i++) {
            NSMutableDictionary *dicTem = [arrayTem objectAtIndex:i];
            [arrOfCategory addObject:[dicTem valueForKey:@"name"]];
        }
        
        
        arrOfType = [[NSArray alloc] initWithArray:[result valueForKey:@"filters"]];
        
        //create picker view
        UIPickerView *pkvCategory = [[UIPickerView alloc] initWithFrame:CGRectMake(10.0f, 36.0f, 300.0f, 100.0f)];
        [self addSubview:pkvCategory];
        [pkvCategory setDelegate:self];
        [pkvCategory setShowsSelectionIndicator:YES];
        [pkvCategory setTag:PKV_CATEGORY_TAG];
        [pkvCategory release];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [arrOfCategory release];
    
    [super dealloc];
}

#pragma mark - delegate
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [arrOfCategory count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [arrOfCategory objectAtIndex:row];
}

#pragma mark - custom actions
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGRect frame = [[self viewWithTag:PKV_CATEGORY_TAG] frame];
    
    if(!CGRectContainsPoint(frame, point))
        [self removeFromSuperview];
}

// Respond to user selection
- (void)pickerView:(UIPickerView *)aPickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [(UIButton*)[((StoreScreenCtrl*)storeCtrl).view viewWithTag:BTN_CATEGORY_TAG] setTitle:[arrOfCategory objectAtIndex:row] forState:UIControlStateNormal];
    //[(UITableView*)[((StoreScreenCtrl*)storeCtrl).view viewWithTag:TBViewStore_TAG] reloadData];
    
    //[[arrOfType objectAtIndex:row] valueForKey:@"id"];
    if (row == 0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"chooseType" object:@"0"];
    }
    else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"chooseType" object:[[arrOfType objectAtIndex:row-1] valueForKey:@"id"]];
    }
}

@end
