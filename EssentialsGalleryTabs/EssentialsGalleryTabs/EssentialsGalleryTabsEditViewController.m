//
//  EssentialsGalleryTabsEditViewController.m
//  EssentialsGallery
//
//  Created by Daniel Allsop on 31/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "EssentialsGalleryTabsEditViewController.h"
#import "EssentialsGalleryTabsOverflowDropdownView.h"

@interface EssentialsGalleryTabsEditViewController ()

@property (assign, nonatomic) NSInteger nextTab;
@property (strong, nonatomic) EssentialsGalleryTabsOverflowDropdownView *overflowView;

@end

@implementation EssentialsGalleryTabsEditViewController

- (void)createTabbedView {
  self.tabbedView = [[SEssentialsTabbedView alloc] initWithFrame:self.tabsView.bounds];
  self.tabbedView.editable = YES;
  self.tabbedView.hasNewTabButton = YES;
  
  self.overflowView = [[EssentialsGalleryTabsOverflowDropdownView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
  self.tabbedView.tabOverflowDropdown = self.overflowView;
  [self.tabsView addSubview:self.tabbedView];
  
  // Use the number of tabs specified by the user unless this is the initial setup when
  // self.nextTab is equal to 0 in which case we want to set this to 8 to display 8 tabs
  self.nextTab = MAX(self.nextTab, 8);
  
  [self styleTabbedView];
  [self initialiseDataSource];
  [self addTabs:self.nextTab];
}

- (SEssentialsTab *)tabForTabbedView:(SEssentialsTabbedView *)tabbedView; {
  NSString *name = [NSString stringWithFormat:@"Tab %zd", self.nextTab + 1];
  return [self createTabWithName:name atIndex:(NSUInteger)self.nextTab++];
}

- (IBAction)resetDemo{
  self.nextTab = 8;
  [self initialiseDataSource];
  [self addTabs:self.nextTab];
  for(int i = ((int)self.tabbedView.allTabs.count - 8); i > 0; --i){
    [self.tabbedView removeTabDisplayedAtIndex:0];
  }
  
  [self.overflowView hideOverflowForTabbedView:self.tabbedView];
}

@end
