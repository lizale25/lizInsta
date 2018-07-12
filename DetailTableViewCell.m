//
//  detailTableViewCell.m
//  lizInsta
//
//  Created by Lizbeth Alejandra Gonzalez on 7/10/18.
//  Copyright © 2018 Lizbeth Alejandra Gonzalez. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "Post.h"

@implementation DetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)like:(id)sender {
    
    self.numberLikes.text = [NSString stringWithFormat:@"%d", self.post.likeCount];
    
}

-(void)setPost:(Post *)post {
    _post = post;
    PFUser *user = self.post.author;
    self.username.text = user.username;
   // self.caption.text = user.
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
