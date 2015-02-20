//
//  EssentialsGalleryTabsOverflowViewController.m
//  EssentialsGallery
//
//  Created by Daniel Allsop on 31/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "EssentialsGalleryTabsOverflowViewController.h"

@implementation EssentialsGalleryTabsOverflowViewController

- (void)createTabbedView {  
  self.tabbedView = [[SEssentialsTabbedView alloc] initWithFrame:self.tabsView.bounds];
  self.tabbedView.editable = NO;
  self.tabbedView.hasNewTabButton = NO;
  self.tabbedView.hasOverflowDropdown = YES;
  [self.tabsView addSubview:self.tabbedView];
  
  [self styleTabbedView];
  [self initialiseDataSource];
  [self addTabs:15];  
}

@end
