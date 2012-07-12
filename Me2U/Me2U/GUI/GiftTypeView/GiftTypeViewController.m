//
//  GiftTypeViewController.m
//  Me2U
//
//  Created by Le Quang Vinh on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GiftTypeViewController.h"
#import "Global.h"
#import "GiftViewController.h"

@interface GiftTypeViewController ()

@end

@implementation GiftTypeViewController

@synthesize tbView, arrayType, frowView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (frowView == 0) {
        arrayType = [gDataAccess getDataForGiftType];
        [self setTitle:@"Type Product"];
    }
    else {
        arrayType = [gDataAccess getDataForPrice];
        [self setTitle:@"Price Product"];
    }
    //arrayType = [gDataAccess getDataForGiftType];
    isFirst = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayType count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (isFirst == YES) {
        for (NSString* key in [arrayType objectAtIndex:indexPath.row]) {
            if (frowView == kGiftType) {
                if (indexPath.row == 0) {
                    cell.textLabel.text = @"Thoi Trang";
                }
                else {
                    cell.textLabel.text = @"Do Dung";
                }
            }
            else {
                if (indexPath.row == 0) {
                    cell.textLabel.text = @"Under 25";
                }
                else if (indexPath.row == 1){
                    cell.textLabel.text = @"25-50";
                }
                else 
                    cell.textLabel.text = @"50-100";
            }
            
        }
    }
    else {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[arrayType objectAtIndex:indexPath.row]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (isFirst == YES) {
        
        NSMutableDictionary *dicType = [arrayType objectAtIndex:indexPath.row];
        /*
        arrayType = [dicType valueForKey:[NSString stringWithFormat:@"%d",indexPath.row]];
        [self.tbView reloadData];
        isFirst = NO;
         */
        GiftViewController *vcGift = [[GiftViewController alloc] initWithNibName:@"GiftViewController" bundle:nil];
        [self.navigationController pushViewController:vcGift animated:YES];
        vcGift.arrayGift = [dicType valueForKey:[NSString stringWithFormat:@"%d",indexPath.row]];
        
        [vcGift release];
    }
    
}

@end
