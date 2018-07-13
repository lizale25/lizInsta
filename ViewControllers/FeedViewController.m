//
//  FeedViewController.m
//  lizInsta
//
//  Created by Lizbeth Alejandra Gonzalez on 7/9/18.
//  Copyright © 2018 Lizbeth Alejandra Gonzalez. All rights reserved.
//

#import "FeedViewController.h"
#import "PostTableViewCell.h"
#import "Post.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import <ParseUI/ParseUI.h>
#import "PhotoViewController.h"

@interface FeedViewController () <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property NSArray *posts;
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation FeedViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.feedTableView.dataSource = self;
    self.feedTableView.delegate = self;
    self.feedTableView.rowHeight = 400;
    [self beginRefresh];
    self. refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(beginRefresh) forControlEvents:UIControlEventValueChanged];
    [self.feedTableView insertSubview: self.refreshControl atIndex:0];
    
   // [self beginRefresh];
  
}

// network call returns posts
// self.posts = from network call

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"post" forIndexPath:indexPath];
    Post *post = self.posts[indexPath.row];
    cell.post = post;
    cell.username.text = post.author.username;
    cell.usernameTwo.text = post.author.username;
    cell.postPicture.file = post.image;
    cell.caption.text = post.caption;
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.YY HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    // NSLog(@"%@",dateString);
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"smallest"]];
    
    // Adding your dateString to your content string
    cell.timeStamp.text = dateString;
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
            [self.feedTableView reloadData];
            [self.refreshControl endRefreshing];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (IBAction)logout:(id)sender {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    NSLog(@"clicked");
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   if([segue.identifier isEqualToString:@"zoom"]){
    PostTableViewCell *cell = sender;
   PhotoViewController *control = [segue destinationViewController];
   control.post = cell.post;
    }
}

@end
