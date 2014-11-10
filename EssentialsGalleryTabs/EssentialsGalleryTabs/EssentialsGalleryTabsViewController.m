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
  NSMutableArray *tempArray = [@[
                       @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae tellus mauris, at iaculis lectus. Donec porttitor libero sit amet nulla iaculis ornare. Nullam in turpis odio. Praesent porttitor vehicula velit nec interdum. Donec tempor, odio id blandit congue, mauris magna venenatis justo, at elementum urna ligula a leo. Quisque non nisi arcu. Maecenas vulputate aliquam nunc, sed tempor enim euismod ut. Sed arcu purus, ornare eget auctor ut, dapibus fermentum ante. Pellentesque lectus risus, sagittis non imperdiet ut, cursus vel massa.",
                       @"Donec sem nisi, pulvinar sit amet tincidunt non, aliquet eu odio. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse congue sem eu justo rhoncus vel consequat leo mattis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam augue massa, bibendum a elementum vitae, tempor vel tortor. Vivamus leo lacus, scelerisque eu ultrices nec, volutpat id leo. Sed consequat aliquam leo, ut rutrum diam malesuada rutrum. Duis pretium lectus et libero tincidunt bibendum. Pellentesque adipiscing porttitor dui sit amet pulvinar. Ut eget nisi eget velit venenatis tincidunt a eu nisl.",
                       @"Vivamus facilisis velit et augue porttitor quis lacinia est imperdiet. Maecenas sagittis felis in est lobortis molestie sit amet eget quam. Cras a dui non erat imperdiet sodales. Quisque fringilla nulla id leo congue posuere. Fusce id ultricies sapien. Sed venenatis metus nec nulla tincidunt molestie vitae et enim. Morbi egestas risus quis nibh lobortis aliquam. Pellentesque massa massa, cursus eget consequat et, sollicitudin nec magna. Etiam sodales posuere massa vitae pharetra. Morbi vehicula fringilla ullamcorper. Nunc non gravida tortor. In nisi mi, commodo eu lobortis a, cursus et sem."] mutableCopy];
  
  NSString *addendum = @"Aenean in dictum tellus. Morbi molestie lectus risus. Aenean leo neque, auctor et aliquam non, scelerisque at dui. Nunc et tellus porta mauris pharetra pellentesque. Sed nunc lectus, facilisis at lacinia ut, gravida eu sapien. Phasellus sit amet sapien ac velit ultrices ullamcorper vel vel augue. Donec vehicula enim quis pretium bibendum. In hac habitasse platea dictumst. Aliquam imperdiet tortor magna, placerat euismod felis ultrices quis. Cras in pulvinar quam. Fusce id laoreet velit, sit amet scelerisque lectus. In hac habitasse platea dictumst.\n\nSuspendisse consequat iaculis ex, non egestas orci mollis a. Maecenas semper dui nulla, eu ultricies eros gravida ac. Mauris quis ante odio. Sed sed nunc bibendum dui lacinia porttitor porta vitae lectus. Phasellus vulputate erat lacus, vitae vestibulum elit pellentesque vel. Aenean non urna nibh. Nam facilisis felis eu magna pharetra tincidunt. Sed tincidunt sed metus ut sollicitudin.\n\nNullam sit amet nunc sed turpis vehicula malesuada. Ut cursus dolor nec maximus auctor. Ut in rhoncus mauris. Donec sit amet molestie elit. Proin sem ipsum, feugiat id ornare non, accumsan non ante. Vestibulum sed facilisis ex. Nullam sed nibh a erat faucibus tincidunt. Cras cursus odio a nisl volutpat, vitae posuere massa tempor. Vestibulum et nisi dui.\n\nSuspendisse potenti. Proin gravida ullamcorper elit, vel auctor enim gravida tincidunt. Morbi purus massa, ultrices sit amet orci non, laoreet viverra ipsum. Nam ac mollis erat. Sed suscipit malesuada orci, at mattis erat aliquam sed. Donec convallis elementum urna, in gravida eros venenatis ac. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis vitae tellus risus. Cras nunc libero, bibendum laoreet metus at, maximus vulputate ligula. Curabitur nisl ante, sodales ut finibus vitae, feugiat id est.\n\nSed vitae arcu vitae odio scelerisque scelerisque vitae sit amet erat. Nunc id elementum felis. Nunc efficitur suscipit aliquam. Nulla nec nunc vitae tellus molestie maximus eget viverra ante. Sed molestie dui eu sem lacinia tristique sit amet vitae leo. Phasellus tempus sed turpis sit amet eleifend. Pellentesque elementum, quam nec malesuada pulvinar, nisl eros dignissim ex, in blandit odio elit id lacus. Etiam id ornare augue, et finibus eros. Integer malesuada et mauris non mollis. Proin volutpat nulla quis ligula posuere egestas. Fusce eget sapien a nisi posuere viverra.\n\nAliquam sodales iaculis sem, quis venenatis enim rutrum nec. Vestibulum finibus varius augue, quis condimentum mauris consequat et. In pharetra vestibulum lectus mollis lacinia. Donec quis magna ipsum. Aliquam at vehicula elit, ut accumsan lacus. Morbi aliquet quis tellus a varius. Cras et dignissim felis. Ut tempus lorem turpis, sit amet cursus libero elementum sit amet. Morbi lobortis, neque sed tempus blandit, nisi erat hendrerit diam, ac congue ipsum augue eu ante. Aliquam erat volutpat. Etiam ligula turpis, tincidunt nec est sed, auctor cursus eros.\n\nEtiam eros turpis, pharetra vel rutrum non, porta vitae dolor. Mauris felis augue, sodales quis neque ut, condimentum vulputate orci. Donec auctor diam elementum, dapibus lorem vitae, iaculis nunc. Aliquam accumsan imperdiet magna, sit amet facilisis dui vulputate eu. Nulla facilisi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In sagittis nec neque nec consectetur. Etiam dapibus dictum bibendum. Etiam eu pharetra magna. Integer dictum, odio ac fermentum sodales, ipsum eros consequat nibh, ut consequat mauris enim a nisi.";

  for (NSString *content in tempArray) {
    [self.contentText addObject:[NSString stringWithFormat:@"%@\n\n%@", content, addendum]];
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
