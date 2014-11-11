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

@property SEssentialsTabbedView *tabbedView;
@property NSArray *contentText;

- (void)resetTabs;

#pragma mark - Utility methods

- (void)styleTabbedView;
- (void)addTabs:(int)numberOfTabs;
- (SEssentialsTab *)addTabWithName:(NSString *)name andContent:(NSString *)content;
- (void)initialiseDataSource;

@end
