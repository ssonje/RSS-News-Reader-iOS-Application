//
//  SecondViewController.m
//  Final_Ass
//
//  Created by Sanket Sonje on 17/02/21.
//  Copyright © 2021 Sanket Sonje. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondVCDataModel.h"
#import "SecondVCTableViewCell.h"
#import "SecondVCDataSource.h"
#import "SecondVCDelegation.h"

@interface SecondViewController ()

@property (strong, nonatomic) NSMutableArray<SecondVCDataModel *> *listOfItems;
@property (strong, nonatomic) UITableView *secondVCTableView;
@property (strong, nonatomic) SecondVCDataSource *secondVCDataSource;
@property (strong, nonatomic) SecondVCDelegation *secondVCDelegate;

@end

@implementation SecondViewController

- (instancetype) initWithURL:(FirstVCDataModel *)URL andWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    
    if(self) {
        _URL = URL.RSSWebsiteURL;
        _navigationController = navigationController;
        _listOfItems = [NSMutableArray array];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self convertRSSToJSON];
    
    self.view.backgroundColor = [UIColor opaqueSeparatorColor];
    
    [self setupSecondVCTableView];
    
}

- (void) convertRSSToJSON {
    // NSLog(@"Conversion Started...");
    
    NSURL *convertedURL = [self convertURLToTargedFormat:_URL];
    NSString *fullURLString = [NSString stringWithFormat:@"https://api.rss2json.com/v1/api.json?rss_url=%@",convertedURL.absoluteString];
    
    // NSLog(@"%@", fullURLString);

    // test link -> https://techcrunch.com/feed/
    [[NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:fullURLString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        // NSLog(@"Finised converting");

        NSError *JSONParsingError;
        NSMutableDictionary *jsonFormatData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&JSONParsingError];
        
        if(JSONParsingError) {
            NSLog(@"JSON Data Parsing Failed...");
            return;
        }
        
        // NSLog(@"%@", jsonFormatData);
        
        NSArray *items = jsonFormatData[@"items"];
        
        // NSLog(@"%@", items);
        
        // iterate over the items
        for(NSDictionary *currentDict in items) {
            
            NSURL *imageLink = [NSURL URLWithString:currentDict[@"thumbnail"]];
            NSString *title = currentDict[@"title"];
            NSString *description = currentDict[@"description"];
            NSString *itemLink = currentDict[@"link"];
            
            //NSLog(@"Image Link :- %@",imageLink.absoluteString);
            //NSLog(@"Title :- %@",title);
            //NSLog(@"Desciption :- %@",description);
            //NSLog(@"Link :- %@",link);
            
            SecondVCDataModel *information = [[SecondVCDataModel alloc] initWithImageLink:imageLink andWithTitle:title andWithDesciption:description andWithTheItemLink:itemLink];
            
            // add this "information" object to the listOfItems array
            [self.listOfItems addObject:information];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.secondVCTableView reloadData];
            [self.indicator stopAnimating];
            self.indicator.hidden = true;
        });
        
    }] resume];
}

- (NSURL *) convertURLToTargedFormat:(NSURL *)URL {
    return [NSURL URLWithString:[URL.absoluteString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]];
}

- (void) setupSecondVCTableView {
    self.secondVCTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.secondVCTableView];
    
    [self setupActivityIndicator];
    
    [self setupSecondVCDelegate];
    
    [self.secondVCTableView registerClass:[SecondVCTableViewCell class] forCellReuseIdentifier:@"cellReuseIdentifier"];
}

- (void) setupActivityIndicator {
    self.indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectZero];
    [self.indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleLarge];
    self.indicator.color = [UIColor systemGrayColor];
    self.indicator.center = self.secondVCTableView.center;
    [self.view addSubview:self.indicator];

    [self.indicator startAnimating];
}

- (void) setupSecondVCDelegate {
    self.secondVCDataSource = [[SecondVCDataSource alloc] initWilthListOfURLs:_listOfItems];
    self.secondVCDelegate = [[SecondVCDelegation alloc] initWithListOfItemsDataSource:_listOfItems andWithNavigationController:_navigationController];
    
    self.secondVCTableView.dataSource = self.secondVCDataSource;
    self.secondVCTableView.delegate = self.secondVCDelegate;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Second Screen";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(dismissViews)];
}

- (void) dismissViews {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
