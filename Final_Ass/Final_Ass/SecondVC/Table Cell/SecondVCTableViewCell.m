//
//  SecondVCTableViewCell.m
//  Final_Ass
//
//  Created by Sanket Sonje on 18/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "SecondVCTableViewCell.h"

@implementation SecondVCTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // add required views in the table cell
        [self addItemImageView];
        [self addItemTitleView];
        [self addItemDescriptionView];
        
        // add constraints to each of the above view
        [self addConstraints];
    }
    return self;
}

- (void) addItemImageView {
    self.RSSItemImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.RSSItemImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_RSSItemImageView];
}

- (void) addItemTitleView {
    self.RSSItemTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    self.RSSItemTitle.translatesAutoresizingMaskIntoConstraints = NO;
    self.RSSItemTitle.numberOfLines = 0;
    self.RSSItemTitle.lineBreakMode = NSLineBreakByWordWrapping;
    self.RSSItemTitle.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    [self.contentView addSubview:self.RSSItemTitle];
}

- (void) addItemDescriptionView {
    self.RSSItemDescription = [[UILabel alloc] initWithFrame:CGRectZero];
    self.RSSItemDescription.translatesAutoresizingMaskIntoConstraints = NO;
    self.RSSItemDescription.numberOfLines = 0;
    [self.contentView addSubview:self.RSSItemDescription];
}

-(void)addConstraints {
    [NSLayoutConstraint activateConstraints:@[
        
        // add constraints for image view
        [self.RSSItemImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10],
        [self.RSSItemImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10],
        [self.RSSItemImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10],
        [self.RSSItemImageView.widthAnchor constraintEqualToConstant:50],
        
        // add constraints for Item Title
        [self.RSSItemTitle.leadingAnchor constraintEqualToAnchor:self.RSSItemImageView.trailingAnchor constant:15],
        [self.RSSItemTitle.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10],
        [self.RSSItemTitle.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-15],
        
        // add constraints for Item Description
        [self.RSSItemDescription.leadingAnchor constraintEqualToAnchor:self.RSSItemImageView.trailingAnchor constant:15],
        [self.RSSItemDescription.topAnchor constraintEqualToAnchor:self.RSSItemTitle.bottomAnchor constant:10],
        [self.RSSItemDescription.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10],
        [self.RSSItemDescription.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10],
    ]];
}

@end
