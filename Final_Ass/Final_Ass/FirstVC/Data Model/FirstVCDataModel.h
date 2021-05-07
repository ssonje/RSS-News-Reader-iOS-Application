//
//  FirstVCDataModel.h
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstVCDataModel : NSObject

@property (strong, nonatomic, nonnull) NSURL *RSSWebsiteURL;

-(instancetype) initWithRSSURL:(NSURL *) RSSWebsiteURL;

@end

NS_ASSUME_NONNULL_END
