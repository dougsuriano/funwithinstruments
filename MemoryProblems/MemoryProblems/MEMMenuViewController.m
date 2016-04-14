//
//  MEMMenuViewController.m
//  MemoryProblems
//
//  Created by Doug Suriano on 4/3/16.
//  Copyright © 2016 Hotel Tonight. All rights reserved.
//

#import "MEMMenuViewController.h"
#import "MEMDetailsViewController.h"
#import "MEMMenuOption.h"
#import "MEMImprovedDetailsViewController.h"

static NSString * const kReuseIdentifier = @"kReuseIdentifier";

@interface MEMMenuViewController ()

@property (nonatomic, copy) NSArray *menuItems;

@end

@implementation MEMMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Useful App";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kReuseIdentifier];
    
    self.menuItems = @[
            [MEMMenuOption itemWithOptionItem:MEMMenuOptionItemOrderChickenWings],
            [MEMMenuOption itemWithOptionItem:MEMMenuOptionItemGetFreePony]
    ];
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
    MEMMenuOption *problem = self.menuItems[indexPath.row];
    cell.textLabel.text = problem.title;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MEMMenuOption *problem = self.menuItems[indexPath.row];

    switch (problem.optionItem)
    {
        case MEMMenuOptionItemOrderChickenWings:
        {
            MEMDetailsViewController *vc = [[MEMDetailsViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case MEMMenuOptionItemGetFreePony:
        {
            MEMImprovedDetailsViewController *vc = [[MEMImprovedDetailsViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
    }
}

@end
