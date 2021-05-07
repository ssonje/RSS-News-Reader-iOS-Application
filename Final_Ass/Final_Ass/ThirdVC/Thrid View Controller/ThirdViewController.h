//
//  ThirdViewController.h
//  Final_Ass
//
//  Created by Sanket Sonje on 18/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondVCDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThirdViewController : UIViewController

@property (strong, nonatomic) SecondVCDataModel *itemObject;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UIActivityIndicatorView *indicator;
@property (strong, nonatomic) UIButton *backButton;

- (instancetype) initWithItemObject:(SecondVCDataModel *) item andWithNavigationController:(UINavigationController *)navigationController;

@end

NS_ASSUME_NONNULL_END
