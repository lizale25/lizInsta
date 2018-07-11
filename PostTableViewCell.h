//
//  postTableViewCell.h
//  lizInsta
//
//  Created by Lizbeth Alejandra Gonzalez on 7/10/18.
//  Copyright © 2018 Lizbeth Alejandra Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <ParseUI/ParseUI.h>

@interface PostTableViewCell : UITableViewCell
@property (nonatomic, strong) Post *post;

@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet PFImageView *postPicture;
@property (weak, nonatomic) IBOutlet UILabel *caption;

@end
