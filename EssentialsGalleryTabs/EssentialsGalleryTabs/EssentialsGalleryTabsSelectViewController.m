//
//  EssentialsGalleryTabsSelectViewController.m
//  EssentialsGallery
//
//  Created by Daniel Allsop on 31/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "EssentialsGalleryTabsSelectViewController.h"

@implementation EssentialsGalleryTabsSelectViewController

- (void)createTabbedView {
  self.tabbedView = [[SEssentialsTabbedView alloc] initWithFrame:self.tabsView.bounds];
  self.tabbedView.editable = NO;
  [self.tabsView addSubview:self.tabbedView];
  
  [self styleTabbedView];
  [self initialiseDataSource];
  [self addTabs:3];
}

@end
