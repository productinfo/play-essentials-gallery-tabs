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
  self.nextTab = 3;
  [self.tabsView addSubview:self.tabbedView];
  
  [self initialiseDataSource];
  [self addTabs:3];
}

- (SEssentialsTab *)tabForTabbedView:(SEssentialsTabbedView *)tabbedView; {
  self.nextTab++;
  NSString *name = [NSString stringWithFormat:@"Tab %zd", self.nextTab];
  return [self createTabWithName:name andContent:(NSUInteger)self.nextTab];
}

- (IBAction)resetDemo{
  self.nextTab = 3;
  [super resetTabs];
}

@end
