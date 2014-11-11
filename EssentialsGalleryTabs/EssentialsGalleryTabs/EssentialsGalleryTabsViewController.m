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

- (void)initialiseDataSource {
  self.tabbedView.dataSource = self;
  self.mapTabToView = [NSMutableDictionary new];
  self.contentText = [NSMutableArray new];
  
  NSString *path = [[NSBundle mainBundle] pathForResource:@"EssentialsGalleryTabs-data" ofType:@"plist"];
  
  if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
    NSArray *tempArray = [[NSArray alloc] initWithContentsOfFile:path];
    
    for (int i = 0; i <= ([tempArray count] - 2); ++i) {
      [self.contentText addObject:[[NSString stringWithFormat:@"%@\n\n%@", tempArray[i], tempArray[([tempArray count] - 1)]] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"]];
    }
  }
}

- (void)resetTabs {
  [self initialiseDataSource];
  [self addTabs:3];
  for(int i = (self.tabbedView.allTabs.count - 3); i > 0; --i){
    [self.tabbedView removeTabDisplayedAtIndex:i];
  }
}

#pragma mark - SEssentialsTabbedViewDataSource methods

- (UIView *)tabbedView:(SEssentialsTabbedView *)tabbedView contentForTab:(SEssentialsTab *)tab {
  return self.mapTabToView[[NSValue valueWithNonretainedObject:tab]];
}

#pragma mark - Utility methods

- (void)styleTabbedView {
  // Add a border to the sliding overlay
  self.tabbedView.layer.borderColor = [UIColor lightGrayColor].CGColor;
  self.tabbedView.layer.borderWidth = 1.f;
}

- (void)addTabs:(int)numberOfTabs {
  for(int i = 0; i < numberOfTabs; ++i){
    [self.tabbedView addTab:[self addTabWithName:[NSString stringWithFormat:@"Tab %i  ", i+1] andContent:self.contentText[i%3]]];
  }
}

- (SEssentialsTab *)addTabWithName:(NSString *)name andContent:(NSString *)content {
  SEssentialsTab *tab = [[SEssentialsTab alloc] initWithName:name icon:nil];
  UITextView *textView = [[UITextView alloc] initWithFrame:self.tabbedView.contentViewBounds];
  textView.text = content;
  textView.font = [UIFont systemFontOfSize:14];
  textView.editable = NO;
  
  [self.mapTabToView setObject:textView forKey:[NSValue valueWithNonretainedObject:tab]];
  return tab;
}

@end
