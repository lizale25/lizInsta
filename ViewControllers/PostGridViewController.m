//
//  PostGridViewController.m
//  lizInsta
//
//  Created by Lizbeth Alejandra Gonzalez on 7/11/18.
//  Copyright © 2018 Lizbeth Alejandra Gonzalez. All rights reserved.
//

#import "PostGridViewController.h"
#import "ProfileCollectionViewCell.h"
#import "Post.h"
#import <ParseUI/ParseUI.h>


@interface PostGridViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *posts;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation PostGridViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    PFUser *user = PFUser.currentUser;
 
  
    
    UICollectionViewFlowLayout *layout =(UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    
    CGFloat postersPerLine = 3;
    CGFloat itemWidth = (self.collectionView.frame.size.width - layout.minimumInteritemSpacing * (postersPerLine - 1)) / postersPerLine;
    CGFloat itemHeight = itemWidth * 1.5;
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    
    // Do any additional setup after loading the view.
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
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
     ProfileCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProfileCollectionViewCell" forIndexPath:indexPath];
    
        Post *post = self.posts[indexPath.row];
        PFUser *user = PFUser.currentUser;
        cell.post = post;

      cell.postImage.file = post.image;

    [cell.postImage loadInBackground];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.posts.count;
}
@end
