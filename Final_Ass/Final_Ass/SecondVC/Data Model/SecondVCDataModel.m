//
//  SecondVCDataModel.m
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "SecondVCDataModel.h"

@implementation SecondVCDataModel

- (instancetype) initWithImageLink:(NSURL *)imageLink andWithTitle:(NSString *)title andWithDesciption:(NSString *)descriptionOfTitle andWithTheItemLink:(NSString *)itemLink {
    self = [super init];
    
    if(self) {
        _imageLink = imageLink;
        _title = title;
        _descriptionOfTitle = descriptionOfTitle;
        _itemLink = itemLink;
    }
    
    return self;
}

@end
