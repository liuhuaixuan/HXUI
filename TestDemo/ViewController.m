//
//  ViewController.m
//  TestDemo
//
//  Created by SS001 on 2021/4/27.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameView;
@property (weak, nonatomic) IBOutlet UITextField *pwdView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *testView;
    
    testView.textContentType = UITextContentTypePassword;
}


@end
