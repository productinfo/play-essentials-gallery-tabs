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
    [self.tabbedView removeTabDisplayedAtIndex:0];
  }

}

#pragma mark - SEssentialsTabbedViewDataSource methods

- (UIView *)tabbedView:(SEssentialsTabbedView *)tabbedView contentForTab:(SEssentialsTab *)tab {
  return self.mapTabToView[[NSValue valueWithNonretainedObject:tab]];
}

- (void)styleTabbedView {
  // Add a border to the tab
  self.tabbedView.layer.borderWidth = 1.f;
  self.tabbedView.layer.borderColor = [[UIColor shinobiDarkGrayColor] colorWithAlphaComponent:0.5].CGColor;
}

- (void)addTabs:(int)numberOfTabs {
  for(int i = 0; i < numberOfTabs; ++i){
    [self.tabbedView addTab:[self createTabWithName:[NSString stringWithFormat:@"Tab %i", (i + 1)] atIndex:(NSUInteger)i]];
  }
}

- (SEssentialsTab *)createTabWithName:(NSString *)name atIndex:(NSUInteger)index {
  SEssentialsTab *tab = [[SEssentialsTab alloc] initWithName:name icon:nil];

  UITextView *textView = [[UITextView alloc] initWithFrame:self.tabbedView.contentViewBounds];
  textView.editable = NO;
  
  CGFloat padding = 20;
  
  textView.textContainerInset = UIEdgeInsetsMake(textView.textContainerInset.top + padding,
                                                 textView.textContainerInset.left + padding,
                                                 textView.textContainerInset.bottom,
                                                 textView.textContainerInset.right + padding);
  
  // Retreive path to rtf containing text for display in the SEssentialsTabbedView
  NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"ContentTab%lu", (unsigned long)(index % 3)] ofType:@"rtf"];
  
  // Load the data from the rtf at the path
  NSData *data = [[NSFileManager defaultManager] contentsAtPath:path];
  
  // Init an attributed string using the loaded rtf data retaining the format of
  // the text as it was in the rtf
  NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:data
                                                                          options:nil
                                                               documentAttributes:nil
                                                                            error:nil];
  textView.attributedText = attributedString;
  textView.textAlignment = NSTextAlignmentJustified;
  
  BOOL imageOnLeft = (index % 2) ? NO : YES;
  [self addImage:[UIImage imageNamed:@"shinobi_play_orange_placeholder_image"]
        withSize:CGSizeMake(85, 85) andExclusionPathToUITextView:textView
    leftPosition:imageOnLeft
         padding:padding];
  
  if ((index % 3) == 1) {
    [textView sizeToFit];
    [self addImage:[UIImage imageNamed:@"shinobi_play_orange_placeholder_image_long"]
         withFrame:CGRectMake(190, CGRectGetMaxY(textView.frame) + 12, 450, 55)
      toUITextView:textView];
  }
  
  self.mapTabToView[[NSValue valueWithNonretainedObject:tab]] = textView;
  return tab;
}

- (void)addImage:(UIImage*)image withSize:(CGSize)size andExclusionPathToUITextView:(UITextView*)textView
    leftPosition:(BOOL)leftPosition padding:(CGFloat)padding{
  
    CGFloat leftHandPadding = (leftPosition) ? padding + textView.textContainer.lineFragmentPadding
                                             : CGRectGetWidth(textView.frame) - size.width - padding - textView.textContainer.lineFragmentPadding;
  
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(leftHandPadding, 60 + padding, size.width, size.height)];
  

    // The coordinates of the bezier path must be specified in container coordinates.
    CGRect imageFrame = [textView convertRect:imageView.bounds fromView:imageView];
    imageFrame.origin.x -= textView.textContainerInset.left;
    imageFrame.origin.y -= textView.textContainerInset.top;
  
    // An exclusionPaths can be set as a property on NSTextContainer to specify where
    // UIBezierPaths that should not be filled with text.
    UIBezierPath *exclusionPath;
    if (leftPosition) {
      exclusionPath = [UIBezierPath bezierPathWithRect:CGRectMake(CGRectGetMinX(imageFrame),
                                                                  CGRectGetMinY(imageFrame),
                                                                  CGRectGetWidth(imageFrame) + padding,
                                                                  CGRectGetHeight(imageFrame))];
      
    } else {
      exclusionPath = [UIBezierPath bezierPathWithRect:CGRectMake(CGRectGetMinX(imageFrame) - padding,
                                                                  CGRectGetMinY(imageFrame),
                                                                  CGRectGetWidth(imageFrame) + (padding * 2),
                                                                  CGRectGetHeight(imageFrame))];
    }
    textView.textContainer.exclusionPaths = @[exclusionPath];
    [textView addSubview:imageView];
}

- (void) addImage:(UIImage*)image withFrame:(CGRect)frame toUITextView:(UITextView*)textView{
  UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
  imageView.frame = frame;
  [textView addSubview:imageView];
}

@end
