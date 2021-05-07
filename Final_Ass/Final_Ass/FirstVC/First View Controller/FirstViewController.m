//
//  FirstViewController.m
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstVCDataModel.h"
#import "URLTableViewCell.h"
#import "FirstVCDataSource.h"
#import "FirstVCDelegation.h"

@interface FirstViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UITableView *URLTableView;
@property (strong, nonatomic) FirstVCDataSource *firstVCDataSource;
@property (strong, nonatomic) FirstVCDelegation *firstVCDelegate;

@end

@implementation FirstViewController

- (instancetype) init {
    self = [super init];
    
    if (self) {
        _listOfURLs = [NSMutableArray array];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFirstVCTableView];
}

- (void) setupFirstVCTableView {
    self.URLTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height-200)];
    self.URLTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_URLTableView];
    
    [self setupFirstVCTableViewDelegate];
}

- (void) setupFirstVCTableViewDelegate {
    self.firstVCDataSource = [[FirstVCDataSource alloc] initWilthListOfURLs:_listOfURLs];
    self.firstVCDelegate = [[FirstVCDelegation alloc] initWithListOfURLsDataSource:self.listOfURLs andWithNavigationController:self.navigationController];
    
    self.URLTableView.dataSource = _firstVCDataSource;
    self.URLTableView.delegate = _firstVCDelegate;
    
    [self.URLTableView registerClass:[URLTableViewCell class] forCellReuseIdentifier:@"cellReuseIdentifier"];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"First Screen";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(dismissViews)];
}

- (void) dismissViews {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addURLToTable:(id)sender {
    
    // add URL to the table view as a cell
    if(![_URLTextField.text isEqual:@""]) {
        FirstVCDataModel *url = [[FirstVCDataModel alloc] initWithRSSURL:[NSURL URLWithString:self.URLTextField.text]];
        [self.listOfURLs addObject:url];
        [self.URLTableView reloadData];
        // NSLog(@"URL added successfully : %@", url.RSSWebsiteURL);
        
        [self updateTextFieldSettingAfterModification];
    }
}

// after successfully adding the URL to the table view
// lets clear the text in the text field and
// dismiss the keyboard.
- (void) updateTextFieldSettingAfterModification {
    self.URLTextField.text = @"";
    [self.view endEditing:YES];
}

@end
