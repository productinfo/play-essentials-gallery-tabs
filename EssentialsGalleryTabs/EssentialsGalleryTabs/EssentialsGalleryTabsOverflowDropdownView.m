//
//  EssentialsGalleryTabsOverflowDropdownView.m
//  EssentialsGalleryTabs
//
//  Created by Alison Clarke on 11/02/2015.
//  Copyright (c) 2015 Alison Clarke. All rights reserved.
//

#import "EssentialsGalleryTabsOverflowDropdownView.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

@implementation EssentialsGalleryTabsOverflowDropdownView

- (void)tabbedView:(SEssentialsTabbedView *)tabbedView showTabs:(NSArray *)tabs {
  [super tabbedView:tabbedView showTabs:tabs];
  
  if (self.tableView) {
    // Style the table view
    self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.95f];
    self.layer.borderWidth = 1;
    self.layer.borderColor = [[UIColor shinobiDarkGrayColor] colorWithAlphaComponent:0.5].CGColor;
    self.layer.cornerRadius = 0;
  }
}

- (void)hideOverflowForTabbedView:(SEssentialsTabbedView *)tabbedView {
  if (self.tableView) {
    [self tabbedView:tabbedView showTabs:tabbedView.allTabs];
  }
}

@end
