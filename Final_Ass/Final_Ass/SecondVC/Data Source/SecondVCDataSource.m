//
//  SecondVCDataSource.m
//  Final_Ass
//
//  Created by Sanket Sonje on 18/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "SecondVCDataSource.h"
#import "SecondVCTableViewCell.h"

@implementation SecondVCDataSource

- (instancetype) initWilthListOfURLs:(NSArray<SecondVCDataModel *> *)listOfItems {
    self = [super init];
    
    if(self) {
        _listOfItems = listOfItems;
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // NSLog(@"Item Count :- %lu", (unsigned long)self.listOfItems.count);
    return self.listOfItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];
    
    // if image found in data then present that image
    if(![self.listOfItems[indexPath.row].imageLink.absoluteString isEqualToString:@""]) {
        cell.RSSItemImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.listOfItems[indexPath.row].imageLink]];
    }
    
    // if image not present in the data then add default "Image Not Found" image
    else {
        cell.RSSItemImageView.image = [UIImage imageNamed:@"Image Not Found"];
    }

    cell.RSSItemTitle.text = self.listOfItems[indexPath.row].title;
    cell.RSSItemDescription.text = self.listOfItems[indexPath.row].descriptionOfTitle;
    
    // NSLog(@"Cell added successfully");

    return cell;
}

@end
