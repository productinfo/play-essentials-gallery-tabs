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
#import "ShinobiPlayUtils/UITextView+SPUImage.h"

@interface EssentialsGalleryTabsViewController ()

@property (strong, nonatomic) NSMutableDictionary *mapTabToView;
@property (assign, nonatomic) NSInteger activeTab;
@property (assign, nonatomic) CGPoint scrollableTabBarContentOffset;

@end

@implementation EssentialsGalleryTabsViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self setupTabbedView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  if (!self.tabbedView) {
    [self restoreTabbedView];
    
    // Restore position scrolled to in tab selector scroll view
    ((SEssentialsScrollableTabBar*)self.tabbedView.tabBarView).contentOffset = self.scrollableTabBarContentOffset;
    
    // Restore active tab
    [self.tabbedView activateTabDisplayedAtIndex:self.activeTab];
  }
}

- (void)viewDidDisappear:(BOOL)animated {
  if ([self isMovingFromParentViewController]) {
    // Save tabs
    [self saveTabs];
    
    // Save position of active tab
    self.activeTab = (NSInteger)[self.tabbedView.allTabs indexOfObject:self.tabbedView.activeTab];
    
    // Save position scrolled to in tab selector scroll view
    SEssentialsScrollableTabBar *scrollableTabBar = (SEssentialsScrollableTabBar*)self.tabbedView.tabBarView;
    self.scrollableTabBarContentOffset = scrollableTabBar.contentOffset;
    
    self.contentText = nil;
    self.mapTabToView = nil;
    [self.tabbedView removeFromSuperview];
    self.tabbedView = nil;
  }
  
  [super viewDidDisappear:animated];
}

- (void)setupTabbedView {
  // Implement in subclass
}

- (void)restoreTabbedView {
  // Implement in subclass
}

- (void)initialiseDataSource {
  self.mapTabToView = [NSMutableDictionary new];
  self.tabbedView.dataSource = self;
  self.tabbedView.delegate = self;
}

- (void)resetTabs {
  [self initialiseDataSource];
  [self addTabs:3];
  for (int i = ((int)self.tabbedView.allTabs.count - 3); i > 0; --i) {
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
  
  self.tabbedView.style.decoration = NO;
  self.tabbedView.style.defaultFont = [UIFont boldShinobiFontOfSize:16];
  self.tabbedView.style.defaultOverflowFont = [UIFont shinobiFontOfSize:16];
  self.tabbedView.style.defaultFontColor = [UIColor shinobiDarkGrayColor];
}

- (void)saveTabs {
  self.tabArray = [NSMutableArray new];
  for (SEssentialsTab *tab in self.tabbedView.allTabs) {
    NSString *tabNumberString = [tab.name stringByReplacingOccurrencesOfString:@"Tab " withString:@""];
    [self.tabArray addObject:@([tabNumberString integerValue] - 1)];
  }
}

- (void)restoreTabs {
  for (NSUInteger i = 0; i < self.tabArray.count; ++i) {
    [self.tabbedView addTab:[self createTabWithValue:[self.tabArray[i] intValue]]];
  }
}

- (void)addTabs:(NSInteger)numberOfTabs {
  for (int i = 0; i < numberOfTabs; ++i) {
    [self.tabbedView addTab:[self createTabWithValue:i]];
  }
}

- (SEssentialsTab *)createTabWithValue:(NSInteger)value {
  SEssentialsTab *tab = [[SEssentialsTab alloc] initWithName:[NSString stringWithFormat:@"Tab %ld", (long)(value + 1)] icon:nil];

  UITextView *textView = [[UITextView alloc] initWithFrame:self.tabbedView.contentViewBounds];
  textView.editable = NO;
  
  CGFloat padding = 20;
  textView.textContainerInset = UIEdgeInsetsMake(textView.textContainerInset.top + padding,
                                                 textView.textContainerInset.left + padding,
                                                 textView.textContainerInset.bottom,
                                                 textView.textContainerInset.right + padding);
  
  // Retreive path to rtf containing text for display in the SEssentialsTabbedView
  NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"ContentTab%ld", (long)(value % 3)] ofType:@"rtf"];
  
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
  
  SPUTextViewImageAlignment imageAlignment = (value % 2) ? SPUTextViewImageAlignmentRight : SPUTextViewImageAlignmentLeft;
  [textView addImage:[UIImage imageNamed:@"shinobi_play_orange_placeholder_image"]
           imageSize:CGSizeMake(85, 85)
      imageAlignment:imageAlignment
           yPosition:60
             padding:padding];
  
  if ((value % 3) == 1) {
    [textView sizeToFit];
    [self addImage:[UIImage imageNamed:@"shinobi_play_orange_placeholder_image_long"]
         withFrame:CGRectMake(190, CGRectGetMaxY(textView.frame) + 12, 450, 55)
      toUITextView:textView];
  }
  
  self.mapTabToView[[NSValue valueWithNonretainedObject:tab]] = textView;
  return tab;
}

- (void) addImage:(UIImage*)image withFrame:(CGRect)frame toUITextView:(UITextView*)textView{
  UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
  imageView.frame = frame;
  [textView addSubview:imageView];
}

@end
