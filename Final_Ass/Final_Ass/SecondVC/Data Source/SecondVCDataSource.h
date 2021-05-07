//
//  SecondVCDataSource.h
//  Final_Ass
//
//  Created by Sanket Sonje on 18/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondVCDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondVCDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSArray<SecondVCDataModel *> *listOfItems;
- (instancetype) initWilthListOfURLs:(NSArray<SecondVCDataModel *> *) listOfItems;

@end

NS_ASSUME_NONNULL_END
