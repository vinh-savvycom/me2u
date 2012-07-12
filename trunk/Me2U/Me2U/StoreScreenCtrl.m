//
//  StoreScreenCtrl.m
//  Me2U
//
//  Created by duong2179 on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StoreScreenCtrl.h"

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
    
    //create table here
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 300.0f, 25.0f)];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [textField setDelegate:self];
    [self.view addSubview:textField];
    [textField release];
    
    tableViewCtrl = [[StoreTableViewCtrl alloc] init];
    UITableView *tableView = tableViewCtrl.tableView;
    [tableView setFrame:CGRectMake(0.0f, 40.0f, 320.0f, 394.0f)];
    [self.view addSubview:tableView];
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

@end
