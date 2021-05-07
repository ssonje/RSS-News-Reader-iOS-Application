//
//  URLTableViewCell.m
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "URLTableViewCell.h"

@implementation URLTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _URLLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _URLLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_URLLabel];

        [self addConstraints];
        
        // NSLog(@"Table Cell is called");
    }
    
    return self;
}

-(void)addConstraints {
    [NSLayoutConstraint activateConstraints:@[
        
        [self.URLLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10],
        [self.URLLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10],
        [self.URLLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10],

    ]];
}

@end
