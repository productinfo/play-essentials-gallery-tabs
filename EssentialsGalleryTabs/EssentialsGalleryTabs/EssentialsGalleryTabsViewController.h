//
//  EssentialsGalleryTabsViewController.h
//  EssentialsGallery
//
//  Created by Daniel Allsop on 30/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "ShinobiPlayUtils/SPUGalleryManagedViewController.h"
#import <ShinobiEssentials/ShinobiEssentials.h>

@interface EssentialsGalleryTabsViewController : SPUGalleryManagedViewController<SEssentialsTabbedViewDataSource, SEssentialsTabbedViewDelegate>

@property (strong, nonatomic) SEssentialsTabbedView *tabbedView;
@property (strong, nonatomic) NSMutableArray *contentText;
@property (strong, nonatomic) NSMutableArray *tabArray;

- (void)resetTabs;
- (void)styleTabbedView;
- (void)addTabs:(NSInteger)numberOfTabs;
- (void)restoreTabs;
- (SEssentialsTab *)createTabWithValue:(NSInteger)value;
- (void)initialiseDataSource;

@end
