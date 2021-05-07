//
//  FirstVCDataModel.m
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "FirstVCDataModel.h"

@implementation FirstVCDataModel

-(instancetype) initWithRSSURL:(NSURL *) RSSWebsiteURL {
    self = [super init];
    
    if(self) {
        _RSSWebsiteURL = RSSWebsiteURL;
    }
    
    return self;
}

@end
