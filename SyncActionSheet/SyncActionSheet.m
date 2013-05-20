//
//  SyncActionSheet.m
//  SyncActionSheet
//
//  Created by PengJiang on 5/19/13.
//  Copyright (c) 2013 ebatong. All rights reserved.
//

#import "SyncActionSheet.h"

@interface SyncActionSheet ()

{
    NSInteger selectedButtonIndex;
}

@end

@implementation SyncActionSheet

@synthesize title = _title;
@synthesize buttonTitles = _buttonTitles;

- (void)dealloc
{
    self.title = nil;
    self.buttonTitles = nil;
    
    [super dealloc];
}

- (id)initWithTitle:(NSString *)title otherButtonTitles:(NSArray *)otherButtonTitles
{
    if (self = [super init])
    {
        _title = [title copy];
        _buttonTitles = [[NSArray arrayWithArray:otherButtonTitles] retain];
    }
    
    return self;
}

- (NSInteger)showInView:(UIView *)view
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: _title
                                                             delegate: self
                                                    cancelButtonTitle: nil
                                               destructiveButtonTitle: nil
                                                    otherButtonTitles: nil];
    NSInteger count = _buttonTitles.count;
    for (int i = 0;i < count;i++)
    {
        [actionSheet addButtonWithTitle:[_buttonTitles objectAtIndex:i]];
    }
    [actionSheet setCancelButtonIndex:actionSheet.numberOfButtons - 1];
//    [actionSheet setDestructiveButtonIndex:actionSheet.numberOfButtons - 1];
    
    [actionSheet showInView:view];
    [actionSheet release];
    
    CFRunLoopRun();
    
    return selectedButtonIndex;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    selectedButtonIndex = buttonIndex;
    
    CFRunLoopRef run = CFRunLoopGetCurrent();
    CFRunLoopStop(run);
}

@end
