//
//  LoginViewController.m
//  lizInsta
//
//  Created by Lizbeth Alejandra Gonzalez on 7/9/18.
//  Copyright © 2018 Lizbeth Alejandra Gonzalez. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _loginButton.layer.cornerRadius = 10; // this value vary as per your desire
    _loginButton.clipsToBounds = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapLogin:(id)sender {
    NSString  *username  =  self.username.text;
    NSString *password = self.password.text;
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
            [self alertController:error.localizedDescription];
        } else {
            NSLog(@"User logged in successfully");
            
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        }
    }];
    
}
- (IBAction)signUp:(id)sender {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    // set user properties
    newUser.username = self.username.text;
    //newUser.email = self.email.text;
    newUser.password = self.password.text;

    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            [self alertController:error.localizedDescription];
        } else {
            NSLog(@"User registered successfully");
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
            
            // manually segue to logged in view
        }
    }];
}

-(void)alertController: (NSString * )Message {
    NSString *title = @"Error";
    NSString *message = Message;
    NSString *text = @"Got it!";
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *button = [UIAlertAction actionWithTitle:text style:UIAlertControllerStyleAlert handler:nil];
    [alert addAction:button];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.username resignFirstResponder];
    
    [self.password resignFirstResponder];
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
