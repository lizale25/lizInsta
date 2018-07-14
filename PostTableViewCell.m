//
//  postTableViewCell.m
//  lizInsta
//
//  Created by Lizbeth Alejandra Gonzalez on 7/10/18.
//  Copyright © 2018 Lizbeth Alejandra Gonzalez. All rights reserved.
//

#import "PostTableViewCell.h"

@implementation PostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setPost:(Post *)post {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd\\'MM\\'yy"];
    
    NSString *formatted = [format stringFromDate:[NSDate date]];
    _post = post;
    PFUser *user = self.post.author;
    self.username.text = user.username;
    self.usernameTwo.text = user.username;
    self.timeStamp.text = formatted;
    self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.width / 2;
    self.profilePicture.clipsToBounds = YES;
}

- (IBAction)didTapFavorite:(id)sender {
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
    else{
        value -= 1;
        [self.likeButton setSelected:NO];
        self.likeCount.text = [NSString stringWithFormat:@"%d", value];
        NSLog(@"Successfully unfavorited the following Tweet:");
        self.likes = nil;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    self.postPicture.image = editedImage;
}

@end
