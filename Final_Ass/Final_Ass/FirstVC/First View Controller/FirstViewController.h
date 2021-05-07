//
//  FirstViewController.h
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "FirstVCDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *URLTextField;
@property (weak, nonatomic) IBOutlet UIButton *addURLButton;
@property (strong, nonatomic) NSMutableArray<FirstVCDataModel *> *listOfURLs;

@end

NS_ASSUME_NONNULL_END
