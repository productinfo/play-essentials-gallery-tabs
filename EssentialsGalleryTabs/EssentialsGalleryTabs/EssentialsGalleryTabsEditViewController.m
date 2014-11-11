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
    
  self.tabbedView = [[SEssentialsTabbedView alloc] initWithFrame:CGRectMake(50, 100, 874, 588)];
  self.tabbedView.editable = YES;
  self.tabbedView.hasNewTabButton = YES;
  self.nextTab = 3;
  self.tabbedView.delegate = self;
  [self.view addSubview:self.tabbedView];
  [self.view sendSubviewToBack:self.tabbedView];
  [self styleTabbedView];
  
  [self initialiseDataSource];
  [self addTabs:3];
}

- (SEssentialsTab *)tabForTabbedView:(SEssentialsTabbedView *)tabbedView; {
  self.nextTab++;
  NSString *name = [NSString stringWithFormat:@"Tab %i  ", self.nextTab];
  return [self addTabWithName:name andContent:self.contentText[self.nextTab % 3]];
}

- (IBAction)resetDemo{
  self.nextTab = 3;
  [super resetTabs];
}

@end
