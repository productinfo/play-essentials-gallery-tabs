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

-(void)viewDidLoad {
  self.nextTab = 8;
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
  if (self.tabbedView && [self isMovingToParentViewController]) {
    // Hide overflow if we have a tabbed view at this point - it probably
    // means a snapshot is about to be taken inside play
    [self.overflowView hideOverflowForTabbedView:self.tabbedView];
  }
  
  [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
  if ([self isMovingFromParentViewController]) {
    // Throw away overflow before its parent tabbed view is destroyed
    self.overflowView = nil;
  }
  
  [super viewDidDisappear:animated];
}

- (void)createTabbedView {
  self.tabbedView = [[SEssentialsTabbedView alloc] initWithFrame:self.tabsView.bounds];
  self.tabbedView.editable = YES;
  self.tabbedView.hasNewTabButton = YES;
  
  self.overflowView = [[EssentialsGalleryTabsOverflowDropdownView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
  self.tabbedView.tabOverflowDropdown = self.overflowView;
  [self.tabsView addSubview:self.tabbedView];
  
  [self styleTabbedView];
  [self initialiseDataSource];
}

- (void)setupTabbedView {
  [self createTabbedView];
  [self addTabs:self.nextTab];
}

- (void)restoreTabbedView {
  [self createTabbedView];
  [self restoreTabs];
}

- (SEssentialsTab *)tabForTabbedView:(SEssentialsTabbedView *)tabbedView {
  return [self createTabWithValue:self.nextTab++];
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
