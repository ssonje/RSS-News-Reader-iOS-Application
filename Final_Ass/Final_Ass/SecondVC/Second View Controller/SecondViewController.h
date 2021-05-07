//
//  SecondViewController.h
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//
#import "UIKit/UIKit.h"
#import "FirstVCDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController

@property (strong, nonatomic, nonnull) NSURL *URL;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UIActivityIndicatorView *indicator;

- (instancetype) initWithURL:(FirstVCDataModel *) URL andWithNavigationController:(UINavigationController *)navigationController;

@end

NS_ASSUME_NONNULL_END
