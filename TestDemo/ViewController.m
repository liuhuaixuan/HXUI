//
//  ViewController.m
//  TestDemo
//
//  Created by SS001 on 2021/4/27.
//

#import "ViewController.h"
#import "HXUITools.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameView;
@property (weak, nonatomic) IBOutlet UITextField *pwdView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *testView;
    
    testView.textContentType = UITextContentTypePassword;
    
    
    HXUIMoneyTextField *textView = [[HXUIMoneyTextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 200) * 0.5, 100, 200, 20)];
    textView.placeholder = @"请输入金额";
    [self.view addSubview:textView];
    
    NSString *date = [[HXUIDateTool shareInstance] getTomorrow:@"2021-4-30" formatter:nil];
    NSLog(@"%@", date);
    
    self.imgView.image = [UIImage hx_imageWithName:@"编组 8"];
}


@end
