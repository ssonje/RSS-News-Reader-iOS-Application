//
//  FirstVCDelegation.h
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstVCDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstVCDelegation : NSObject <UITableViewDelegate>

@property (strong, nonatomic) NSArray<FirstVCDataModel *> *listOfURLs;
@property (strong, nonatomic) UINavigationController *navigationController;

 - (instancetype)initWithListOfURLsDataSource:(NSArray<FirstVCDataModel *> *)listOfURLs andWithNavigationController:(UINavigationController *)navigationController;
@end

NS_ASSUME_NONNULL_END
