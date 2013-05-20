//
//  ViewController.m
//  SyncActionSheet
//
//  Created by PengJiang on 5/19/13.
//  Copyright (c) 2013 ebatong. All rights reserved.
//

#import "ViewController.h"
#import "SyncActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Show Action Sheet" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(40, 200, 240, 50)];
    [button addTarget:self action:@selector(showActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:button];
}

- (void)showActionSheet:(id)sender
{
    SyncActionSheet *actionSheet = [[SyncActionSheet alloc] initWithTitle:@"Sync Action Sheet"
                                                        otherButtonTitles:@[@"Button 1", @"Button 2", @"Cancel"]];
    NSInteger buttonIndex = [actionSheet showInView:self.view];
    [actionSheet release];
    
    NSLog(@"selected button index: %d", buttonIndex);
}

@end
