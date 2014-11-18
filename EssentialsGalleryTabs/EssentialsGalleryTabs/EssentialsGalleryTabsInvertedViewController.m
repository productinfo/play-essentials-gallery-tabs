//
//  EssentialsGalleryTabsInvertedViewController.m
//  EssentialsGallery
//
//  Created by Daniel Allsop on 31/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "EssentialsGalleryTabsInvertedViewController.h"

@implementation EssentialsGalleryTabsInvertedViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.tabbedView = [[SEssentialsTabbedView alloc] initWithFrame:self.tabsView.bounds
                                                  tabBarPosition:SEssentialsTabBarPositionBottom];
  [self.tabsView addSubview:self.tabbedView];
    
  [self initialiseDataSource];
  [self addTabs:3];
}

@end
