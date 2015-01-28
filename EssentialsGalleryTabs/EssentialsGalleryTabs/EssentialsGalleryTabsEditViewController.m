//
//  EssentialsGalleryTabsEditViewController.m
//  EssentialsGallery
//
//  Created by Daniel Allsop on 31/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "EssentialsGalleryTabsEditViewController.h"

@interface EssentialsGalleryTabsEditViewController ()

@property NSInteger nextTab;

@end

@implementation EssentialsGalleryTabsEditViewController

- (void)viewDidLoad {
  [super viewDidLoad];
    
  self.tabbedView = [[SEssentialsTabbedView alloc] initWithFrame:self.tabsView.bounds];
  self.tabbedView.editable = YES;
  self.tabbedView.hasNewTabButton = YES;
  self.nextTab = 2;
  [self.tabsView addSubview:self.tabbedView];
  
  [self initialiseDataSource];
  [self addTabs:3];
  [self styleTabbedView];
}

- (SEssentialsTab *)tabForTabbedView:(SEssentialsTabbedView *)tabbedView; {
  self.nextTab++;
  NSString *name = [NSString stringWithFormat:@"Tab %zd", self.nextTab + 1];
  return [self createTabWithName:name atIndex:(NSUInteger)self.nextTab];
}

- (IBAction)resetDemo{
  self.nextTab = 2;
  [super resetTabs];
}

@end
