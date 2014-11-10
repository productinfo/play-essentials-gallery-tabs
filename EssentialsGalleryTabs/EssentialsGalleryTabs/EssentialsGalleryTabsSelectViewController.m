//
//  EssentialsGalleryTabsSelectViewController.m
//  EssentialsGallery
//
//  Created by Daniel Allsop on 31/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "EssentialsGalleryTabsSelectViewController.h"

@implementation EssentialsGalleryTabsSelectViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.tabbedView = [[SEssentialsTabbedView alloc] initWithFrame:CGRectMake(50, 100, 924, 588)];
  [super viewDidLoad];
  self.tabbedView.editable = NO;
  self.tabbedView.delegate = self;
  [self.view addSubview:self.tabbedView];
  [self styleTabbedView];
  
  [self initialiseDataSource];
  [self addTabs:3];
}

@end
