//
//  SecondVCDelegation.h
//  Final_Ass
//
//  Created by Sanket Sonje on 18/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondVCDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondVCDelegation : NSObject <UITableViewDelegate>

@property (strong, nonatomic) NSArray<SecondVCDataModel *> *listOfItems;
@property (strong, nonatomic) UINavigationController *navigationController;

- (instancetype)initWithListOfItemsDataSource:(NSArray<SecondVCDataModel *> *)listOfItems andWithNavigationController:(UINavigationController *)navigationController;

@end

NS_ASSUME_NONNULL_END
