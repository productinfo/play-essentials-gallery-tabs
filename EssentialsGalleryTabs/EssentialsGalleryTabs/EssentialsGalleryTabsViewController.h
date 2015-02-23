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
- (void)saveTabs:(NSArray*)tabs;
- (void)styleTabbedView;
- (void)addTabs:(int)numberOfTabs;
- (void)restoreTabs;
- (SEssentialsTab *)createTabWithValue:(int)value;
- (void)initialiseDataSource;

@end
