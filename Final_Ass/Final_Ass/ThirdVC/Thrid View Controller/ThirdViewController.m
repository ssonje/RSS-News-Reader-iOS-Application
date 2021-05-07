//
//  ThirdViewController.m
//  Final_Ass
//
//  Created by Sanket Sonje on 18/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "ThirdViewController.h"
#import <WebKit/WebKit.h>

@interface ThirdViewController () <WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation ThirdViewController

- (instancetype) initWithItemObject:(SecondVCDataModel *)item andWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    
    if(self) {
        _itemObject = item;
        _navigationController = navigationController;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor opaqueSeparatorColor];
    
    [self setupViews];
}

- (void) setupViews {
    [self setupWebView];
    [self setupActivityIndicatorView];
    [self setupBackButtonView];
}

- (void) setupWebView {
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    [self openWebView:self.webView];
}

- (void) openWebView:(WKWebView *)webView {
    // NSLog(@"Temp String -%@", self.itemObject.itemLink);
    
    NSURL *url = [NSURL URLWithString:self.itemObject.itemLink];
    NSURLRequest *nsrequest = [NSURLRequest requestWithURL:url];
    [webView loadRequest:nsrequest];
}

- (void) setupActivityIndicatorView {
    self.indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectZero];
    [self.indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleLarge];
    self.indicator.color = [UIColor systemGrayColor];
    self.indicator.center = self.view.center;
    [self.view addSubview:self.indicator];
}

- (void) setupBackButtonView {
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-85, self.view.frame.size.width, 50)];
    self.backButton.backgroundColor = [[UIColor opaqueSeparatorColor] colorWithAlphaComponent:0.5f];
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.backButton.titleLabel setFont:[UIFont systemFontOfSize:17]];
    self.backButton.titleEdgeInsets = UIEdgeInsetsMake(0,0,15,30);
    self.backButton.contentHorizontalAlignment = NSTextAlignmentRight;
    self.backButton.contentVerticalAlignment = NSLayoutAttributeTop;
    [self.backButton setTitleColor:[UIColor linkColor] forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor systemPurpleColor] forState:UIControlStateHighlighted];
    [self.backButton addTarget:self action:@selector(goToPreviousScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.webView addSubview:_backButton];
}

- (void) goToPreviousScreen {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Third Screen";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(dismissViews)];
}

- (void) dismissViews {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

// webview delegation method to activate the activity indicator
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    // NSLog(@"Website start loading");
    [self.indicator startAnimating];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    // NSLog(@"Website loaded");
    [self.indicator stopAnimating];
}
@end
