//
//  FirstVCDelegation.m
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "FirstVCDelegation.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation FirstVCDelegation

- (instancetype) initWithListOfURLsDataSource:(NSArray<FirstVCDataModel *> *)listOfURLs andWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    
    if (self) {
        _listOfURLs = listOfURLs;
        _navigationController = navigationController;
    }
    
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FirstVCDataModel *URLInformation = [[FirstVCDataModel alloc] initWithRSSURL:self.listOfURLs[indexPath.row].RSSWebsiteURL];
    // NSLog(@"Opening : %@", URLInformation.RSSWebsiteURL);
                           
    UIViewController *secondViewController = [[SecondViewController alloc] initWithURL:URLInformation andWithNavigationController:self.navigationController];
    
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 276, 70)];
    [headerView setBackgroundColor:[UIColor systemGrayColor]];
    
    UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 276, 30)];
    
    if(self.listOfURLs.count == 1) {
        labelView.text = @"Entered URL";
    }
    else {
        labelView.text = @"List of URLs";
    }

    [headerView addSubview:labelView];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

@end

