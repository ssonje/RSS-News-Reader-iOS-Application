//
//  SecondVCDelegation.m
//  Final_Ass
//
//  Created by Sanket Sonje on 18/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "SecondVCDelegation.h"
#import "ThirdViewController.h"

@implementation SecondVCDelegation

- (instancetype) initWithListOfItemsDataSource:(NSArray<SecondVCDataModel *> *)listOfItems andWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    
    if(self) {
        _listOfItems = listOfItems;
        _navigationController = navigationController;
    }
    
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SecondVCDataModel *informationObject = [[SecondVCDataModel alloc] initWithImageLink:self.listOfItems[indexPath.row].imageLink andWithTitle:self.listOfItems[indexPath.row].title andWithDesciption:self.listOfItems[indexPath.row].descriptionOfTitle andWithTheItemLink:self.listOfItems[indexPath.row].itemLink];
    
    // NSLog(@"Opening Image Link : %@", informationObject.imageLink);
    // NSLog(@"Opening Title : %@", informationObject.title);
    // NSLog(@"Opening Link : %@", informationObject.itemLink);
                           
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] initWithItemObject:informationObject andWithNavigationController:_navigationController];
    
    [self.navigationController pushViewController:thirdViewController animated:YES];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 276, 70)];
    [headerView setBackgroundColor:[UIColor systemGrayColor]];
    
    UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 276, 30)];
    labelView.text = @"RSS Feed";

    [headerView addSubview:labelView];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}


@end
