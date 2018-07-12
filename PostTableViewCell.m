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
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setPost:(Post *)post {
   
    NSDateFormatter *inFormat = [[NSDateFormatter alloc] init];
    [inFormat setDateFormat:@"dd\\'MM\\'yy"];
    
    NSString *parsed = [inFormat stringFromDate:[NSDate date]];
    _post = post;
    PFUser *user = self.post.author;
    self.username.text = user.username;
     self.usernameTwo.text = user.username;
    self.timeStamp.text = parsed;
    self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.width / 2;
    self.profilePicture.clipsToBounds = YES;
    
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    // Do something with the images (based on your use case)
    self.postPicture.image = editedImage;
    
    // Dismiss UIImagePickerController to go back to your original view controller
}

@end
