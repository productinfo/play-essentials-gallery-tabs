//
//  EssentialsGalleryTabsInvertedViewController.m
//  EssentialsGallery
//
//  Created by Daniel Allsop on 31/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "EssentialsGalleryTabsInvertedViewController.h"

@implementation EssentialsGalleryTabsInvertedViewController

- (void)createTabbedView {  
  self.tabbedView = [[SEssentialsTabbedView alloc] initWithFrame:self.tabsView.bounds
                                                  tabBarPosition:SEssentialsTabBarPositionBottom];
  self.tabbedView.editable = NO;
  [self.tabsView addSubview:self.tabbedView];
  
  [self styleTabbedView];
  [self initialiseDataSource];
}

- (void)setupTabbedView {
  [self createTabbedView];
  [self addTabs:3];
}

- (void)restoreTabbedView {
  [self createTabbedView];
  [self restoreTabs];
}

@end
