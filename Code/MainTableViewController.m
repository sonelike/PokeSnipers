//
//  MainTableViewController.m
//  PokeSnipers
//
//  Created by zzd on 16/8/1.
//  Copyright © 2016年 philamlife. All rights reserved.
//

#import "MainTableViewController.h"

#import <MJRefresh.h>
#import <SVProgressHUD.h>
#import <UIImageView+WebCache.h>
#import "HTTPSessionManager.h"
#import "PokemonCell.h"

@interface MainTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *results;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self pullToRefresh];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)pullToRefresh {
    [HTTPSessionManager getPokemonListSuccess:^(PokemonList *list) {
        self.results = list.results;
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSString *errorMsg) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        [SVProgressHUD showErrorWithStatus:errorMsg];
        
        [self.tableView.mj_header endRefreshing];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    Pokemon *pokemon = self.results[row];
    
    PokemonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    [cell.iconView sd_setImageWithURL:[NSURL URLWithString:pokemon.icon]];
    cell.nameLabel.text = pokemon.name;
    cell.coordsLabel.text = pokemon.coords;
    cell.untilLabel.text = pokemon.until;
    return cell;
}
@end
