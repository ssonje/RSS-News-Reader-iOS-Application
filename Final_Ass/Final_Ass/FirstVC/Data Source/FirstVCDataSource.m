//
//  FirstVCDataSource.m
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "FirstVCDataSource.h"
#import "URLTableViewCell.h"
#import "FirstVCDataModel.h"

@implementation FirstVCDataSource

- (instancetype) initWilthListOfURLs:(NSArray<FirstVCDataModel *> *) listOfURLs {
    self = [super init];
    
    if(self) {
        _listOfURLs = listOfURLs;
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // return 1;
    
    NSInteger numOfSections = 0;
    
    // when there is no cell available in the table cell then
    // it shows blank table view.
    // and hence when we have cells available in the table view then only create a table view
    if (self.listOfURLs.count)
    {
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        numOfSections = 1;
        tableView.backgroundView = nil;
    }
    
    // otherwise we can have blank space over there.
    else
    {
        UILabel *noDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, tableView.frame.size.width, tableView.frame.size.height-200)];
        noDataLabel.backgroundColor = [UIColor opaqueSeparatorColor];
        noDataLabel.textAlignment = NSTextAlignmentCenter;
        tableView.backgroundView = noDataLabel;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }

    return numOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // NSLog(@"Count :- %lu", (unsigned long)self.listOfURLs.count);
    
    // when cell is created then only change the table view height
    // so when we don't have any cell in the table then
    // height of the table is zero and eventually table view is build based on the cells.
    // this gives us dynamic approach to build the table view.
    dispatch_async(dispatch_get_main_queue(), ^{
        CGRect frame = tableView.frame;
        frame.size.height = tableView.contentSize.height;
        tableView.frame = frame;
    });
    
    return self.listOfURLs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    URLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];
    cell.URLLabel.text = self.listOfURLs[indexPath.row].RSSWebsiteURL.absoluteString;
    
    // NSLog(@"Cell added successfully");
    
    return cell;
}

@end
