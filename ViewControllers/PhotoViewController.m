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

@property (weak, nonatomic) IBOutlet PFImageView *postPicture;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *timeStamp;


@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFUser *user = PFUser.currentUser;
    self.username.text = user.username;
   // self.postPicture.file = self.post.image;
    //self.caption.text = self.post.caption;
   // [self.postPicture loadInBackground];
    
   
   // [self.postPicture loadInBackground];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
