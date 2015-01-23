//
//  EssentialsGalleryTabsViewController.m
//  EssentialsGallery
//
//  Created by Daniel Allsop on 30/10/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "EssentialsGalleryTabsViewController.h"
#import "ShinobiPlayUtils/UIFont+SPUFont.h"
#import "ShinobiPlayUtils/UIColor+SPUColor.h"

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
  textView.editable = NO;
  
  NSArray *contentArray = [NSArray arrayWithObjects:@"Lorem ipsum",
                           @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tempor sollicitudin augue a interdum. In sed finibus nisi. Etiam feugiat fermentum purus, id molestie erat consequat vel. Ut magna urna, ultrices at commodo in, luctus et metus. Aenean ullamcorper enim neque, sit amet feugiat orci dictum fringilla. Curabitur pretium odio diam, vitae venenatis arcu suscipit at. Pellentesque eu ligula tincidunt, varius neque sed, vehicula orci. Cras hendrerit leo non elit varius, et mollis massa hendrerit. Fusce quis eros lectus. Suspendisse lobortis enim urna, eu placerat quam dictum ut. Aliquam erat volutpat.",
                           @"Morbi Pulvinar",
                           @"Ac ipsum ac molstie. Donec dignissim, leo ut convallis ullamcorper, leo lorem auctor enim, id blandit lorem purus quis sem. Ut rhoncus placerat risus at ullamcorper. Suspendisse cursus velit id lacus lobortis, non rhoncus augue convallis. Cras gravida accumsan convallis. Maecenas nisl turpis, tempus sit amet tempor non, mollis eget dui. Sed felis augue, dictum vitae ullamcorper sit amet, convallis quis ipsum. Quisque neque arcu, dignissim et dolor sit amet, ultricies rutrum purus. Nulla magna purus, porttitor nec massa eu, interdum dapibus ligula. Maecenas consectetur risus eget risus euismod volutpat. Mauris dignissim risus eget felis vehicula auctor. Vivamus sit amet facilisis augue. Quisque posuere malesuada quam, quis blandit lectus convallis eu.",
                           @"Nullam sed massa vitae elit dapibus sagittis. Maecenas venenatis lobortis elit ac lacinia. Aenean mattis, purus fringilla ultrices varius, purus velit aliquet nunc, eu viverra massa mi eget nibh. Donec mi ipsum, lobortis ac lorem quis, blandit facilisis diam. Etiam dui urna, fringilla nec posuere eu, ullamcorper a ipsum. Nulla ut lacinia turpis, ac imperdiet urna. Pellentesque egestas dictum lectus, vel blandit diam posuere eget. Cras vestibulum feugiat mauris at aliquet.",
                           nil];
  NSString *content = [contentArray componentsJoinedByString:@"\n\n"];
  NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:content];
  [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor shinobiDarkGrayColor] range:[content rangeOfString:content]];
  for (int i = 0; i < contentArray.count; ++i) {
    NSRange range = [content rangeOfString:contentArray[i]];
    if (i == 0) {
      [attributedString addAttribute:NSFontAttributeName value:[UIFont boldShinobiFontOfSize:20] range:range];
    } else if (i == 2) {
      [attributedString addAttribute:NSFontAttributeName value:[UIFont boldShinobiFontOfSize:14] range:range];
    } else if (i == 4) {
      [attributedString addAttribute:NSFontAttributeName value:[UIFont boldShinobiFontOfSize:14] range:range];
      [attributedString addAttribute:NSParagraphStyleAttributeName value:[self blockquoteStyleForUITextView:textView] range:range];
    } else {
      [attributedString addAttribute:NSFontAttributeName value:[UIFont shinobiFontOfSize:14] range:range];
    }
  }
  textView.attributedText = attributedString;
  textView.textAlignment = NSTextAlignmentJustified;
  
  [self addImage:[UIImage imageNamed:@"shinobi_play_orange_placeholder_image"] withSize:CGSizeMake(75, 75) andExclusionPathToUITextView:textView];
  [textView sizeToFit];
  
  [self addImage:[UIImage imageNamed:@"shinobi_play_orange_square_placeholder_image"]
       withFrame:CGRectMake(230, CGRectGetMaxY(textView.frame) + 10, 150, 150)
    toUITextView:textView];
  
  [self addImage:[UIImage imageNamed:@"shinobi_play_orange_placeholder_image"]
       withFrame:CGRectMake(380, CGRectGetMaxY(textView.frame) + 10, 150, 150)
    toUITextView:textView];
  
  [self addImage:[UIImage imageNamed:@"shinobi_play_orange_square_placeholder_image"]
       withFrame:CGRectMake(530, CGRectGetMaxY(textView.frame) + 10, 150, 150)
    toUITextView:textView];
  
  self.mapTabToView[[NSValue valueWithNonretainedObject:tab]] = textView;
  return tab;
}

- (NSMutableParagraphStyle*) blockquoteStyleForUITextView:(UITextView*)textView{
  NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
  int indent = 75;
  style.firstLineHeadIndent = indent;
  style.headIndent = indent;
  style.tailIndent = textView.frame.size.width - indent - ((textView.textContainerInset.left + textView.textContainer.lineFragmentPadding) * 2);
  return style;
}

- (void) addImage:(UIImage*)image withSize:(CGSize)size andExclusionPathToUITextView:(UITextView*)textView{
  UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
  CGFloat padding = textView.textContainerInset.left + textView.textContainer.lineFragmentPadding;
  [imageView setFrame:CGRectMake(padding, 50, size.width, size.height)];
  UIBezierPath *exclusionPath = [UIBezierPath bezierPathWithRect:CGRectMake(CGRectGetMinX(imageView.frame),
                                                                            CGRectGetMinY(imageView.frame),
                                                                            CGRectGetWidth(imageView.frame) + padding, CGRectGetHeight(imageView.frame))];
  textView.textContainer.exclusionPaths = @[exclusionPath];
  [textView addSubview:imageView];
}

- (void) addImage:(UIImage*)image withFrame:(CGRect)frame toUITextView:(UITextView*)textView{
  UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
  imageView.frame = frame;
  [textView addSubview:imageView];
}

@end
