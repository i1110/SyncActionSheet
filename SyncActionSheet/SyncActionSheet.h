//
//  SyncActionSheet.h
//  SyncActionSheet
//
//  Created by PengJiang on 5/19/13.
//  Copyright (c) 2013 ebatong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SyncActionSheet : NSObject <UIActionSheetDelegate>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) NSArray *buttonTitles;

- (id)initWithTitle:(NSString *)title otherButtonTitles:(NSArray *)otherButtonTitles;
- (NSInteger)showInView:(UIView *)view;

@end
