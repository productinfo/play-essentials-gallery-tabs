//
//  EssentialsGalleryTabsViewController.m
//  EssentialsGallery
//
//  Created by Daniel Allsop on 30/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "EssentialsGalleryTabsViewController.h"


@interface EssentialsGalleryTabsViewController ()

@property NSMutableDictionary *mapTabToView;

@end

@implementation EssentialsGalleryTabsViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.tabbedView.delegate = self;
  [self styleTabbedView];
}

- (void)initialiseDataSource {
  self.tabbedView.dataSource = self;
  self.mapTabToView = [NSMutableDictionary new];
  
  NSString *path = [[NSBundle mainBundle] pathForResource:@"EssentialsGalleryTabs-data" ofType:@"plist"];
  
  if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
    self.contentText = [[NSArray alloc] initWithContentsOfFile:path];
  }
}

- (void)resetTabs {
  [self initialiseDataSource];
  [self addTabs:3];
  for(int i = ((int)self.tabbedView.allTabs.count - 3); i > 0; --i){
    [self.tabbedView removeTabDisplayedAtIndex:i];
  }
}

#pragma mark - SEssentialsTabbedViewDataSource methods

- (UIView *)tabbedView:(SEssentialsTabbedView *)tabbedView contentForTab:(SEssentialsTab *)tab {
  return self.mapTabToView[[NSValue valueWithNonretainedObject:tab]];
}

- (void)styleTabbedView {
  // Add a border to the tab
  self.tabbedView.layer.borderColor = [UIColor lightGrayColor].CGColor;
  self.tabbedView.layer.borderWidth = 1.f;
}

- (void)addTabs:(int)numberOfTabs {
  for(int i = 0; i < numberOfTabs; ++i){
    [self.tabbedView addTab:[self createTabWithName:[NSString stringWithFormat:@"Tab %i", i+1] atIndex:(NSUInteger)i]];
  }
}

- (SEssentialsTab *)createTabWithName:(NSString *)name atIndex:(NSUInteger)index {
  SEssentialsTab *tab = [[SEssentialsTab alloc] initWithName:name icon:nil];
  UITextView *textView = [[UITextView alloc] initWithFrame:self.tabbedView.contentViewBounds];
  textView.text = self.contentText[index%15];
  textView.font = [UIFont systemFontOfSize:14];
  textView.editable = NO;
  
  self.mapTabToView[[NSValue valueWithNonretainedObject:tab]] = textView;
  return tab;
}

@end
