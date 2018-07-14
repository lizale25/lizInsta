//
//  PhotoViewController.m
//  lizInsta
//
//  Created by Lizbeth Alejandra Gonzalez on 7/11/18.
//  Copyright © 2018 Lizbeth Alejandra Gonzalez. All rights reserved.
//

#import "PhotoViewController.h"
#import "Post.h"
#import <ParseUI/ParseUI.h>
#import "FeedViewController.h"

@interface PhotoViewController ()


@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *timeStamp;
@property (weak, nonatomic) IBOutlet PFImageView *postPicture;
@property (weak, nonatomic) IBOutlet UILabel *usernameTwo;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (nonatomic, strong) NSMutableArray *likes;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFUser *user = PFUser.currentUser;
    self.username.text = user.username;
    self.usernameTwo.text = user.username;
    self.postPicture.file = self.post.image;
    self.caption.text = self.post.caption;
    [self.postPicture loadInBackground];
    self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.width / 2;
    self.profilePicture.clipsToBounds = YES;
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd.MM.YY HH:mm:ss"];
    NSString *dateString = [format stringFromDate:currentDate];
    self.timeStamp.text = dateString;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)likeAction:(id)sender {
    self.likeCount.text = [NSString stringWithFormat:@"%@", self.post.likeCount];
    
    int value = [self.post.likeCount intValue];
    if(self.likes == nil) {
        value += 1;
        self.likeCount.text = [NSString stringWithFormat:@"%d", value];
        [self.likeButton setSelected:YES];
        NSLog(@"Successfully favorited the following Tweet: ");
        self.likes = [[NSMutableArray alloc] init];
        [self.likes addObject:@"one"];
        NSLog(@"%lu",(unsigned long)[ self.likes count]);
    }
    else {
        value -= 1;
        [self.likeButton setSelected:NO];
        self.likeCount.text = [NSString stringWithFormat:@"%d", value];
        NSLog(@"Successfully unfavorited the following Tweet:");
        self.likes = nil;
    }

}

@end
