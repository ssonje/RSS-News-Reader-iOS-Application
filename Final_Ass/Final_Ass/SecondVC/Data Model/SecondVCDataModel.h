//
//  SecondVCDataModel.h
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondVCDataModel : NSObject

@property (strong, nonatomic) NSURL *imageLink;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *descriptionOfTitle;
@property (strong, nonatomic) NSString *itemLink;

- (instancetype) initWithImageLink:(NSURL *)imageLink andWithTitle:(NSString *)title andWithDesciption:(NSString *)descriptionOfTitle  andWithTheItemLink:(NSString *)itemLink;

@end

NS_ASSUME_NONNULL_END
