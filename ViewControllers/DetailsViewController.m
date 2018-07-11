//
//  DetailsViewController.m
//  lizInsta
//
//  Created by Lizbeth Alejandra Gonzalez on 7/10/18.
//  Copyright © 2018 Lizbeth Alejandra Gonzalez. All rights reserved.
//

#import "DetailsViewController.h"
#import "Post.h"
#import <ParseUI/ParseUI.h>
#import "DetailTableViewCell.h"


@interface DetailsViewController ()  <UITableViewDelegate, UITableViewDataSource>

@property NSArray *posts;
@property (weak, nonatomic) IBOutlet UITableView *detailTable;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self. refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(beginRefresh) forControlEvents:UIControlEventValueChanged];
    [self.detailTable insertSubview: self.refreshControl atIndex:0];
    
    self.detailTable.dataSource = self;
    self.detailTable.delegate = self;
    self.detailTable.rowHeight = 500;
    // Do any additional setup after loading the view.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detail" forIndexPath:indexPath];
    Post *post = self.posts[indexPath.row];
    cell.postPicture.file = post.image;
    [cell.postPicture loadInBackground];
    return cell;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (void)beginRefresh {
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    //    [query whereKey:@"likesCount" greaterThan:@100];
    [query includeKey:@"author"];
    [query orderByDescending:@"createdAt"];
    query.limit = 20;
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.posts = posts;
            [self.detailTable reloadData];
            [self.refreshControl endRefreshing];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
