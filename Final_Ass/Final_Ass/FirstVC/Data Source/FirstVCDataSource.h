//
//  FirstVCDataSource.h
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstVCDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstVCDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSArray<FirstVCDataModel *> *listOfURLs;
 - (instancetype) initWilthListOfURLs:(NSArray<FirstVCDataModel *> *) listOfURLs;

@end

NS_ASSUME_NONNULL_END
