//
//  ViewController.m
//  HBValidate
//
//  Created by aplle on 2017/2/23.
//  Copyright © 2017年 fenger. All rights reserved.
//

#import "ViewController.h"
#import "HBValidateM.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat offY        = 60;
    CGFloat offX        = 40;
    CGFloat textFieldW  = 200;
    CGFloat textFieldH  = 40;
    CGFloat spacing     = 20;
    CGFloat buttonW     = 50;
    CGFloat buttonH     = 40;
    
    //验证电话号码
    UITextField *phoneTF = [[UITextField alloc]initWithFrame:CGRectMake(offX, offY, textFieldW, textFieldH)];
    phoneTF.borderStyle = UITextBorderStyleRoundedRect;
    phoneTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    phoneTF.placeholder = @"请输入电话号码";
    phoneTF.tag = 1;
    [self.view addSubview:phoneTF];
    
    UIButton *phoneBt = [UIButton buttonWithType:UIButtonTypeCustom];
    phoneBt.frame = CGRectMake(offX+spacing+textFieldW, offY, buttonW, buttonH);
    phoneBt.backgroundColor = [UIColor orangeColor];
    [phoneBt setTitle:@"验证" forState:UIControlStateNormal];
    phoneBt.tag = 1;
    [phoneBt addTarget:self action:@selector(clickBt:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:phoneBt];
    
    offY += spacing+textFieldH;
    
    //验证邮箱
    UITextField *emailTF = [[UITextField alloc]initWithFrame:CGRectMake(offX, offY, textFieldW, textFieldH)];
    emailTF.borderStyle = UITextBorderStyleRoundedRect;
    emailTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    emailTF.placeholder = @"请输入电子邮箱";
    emailTF.tag = 2;
    [self.view addSubview:emailTF];
    
    UIButton *emailBt = [UIButton buttonWithType:UIButtonTypeCustom];
    emailBt.frame = CGRectMake(offX+spacing+textFieldW, offY, buttonW, buttonH);
    emailBt.backgroundColor = [UIColor orangeColor];
    [emailBt setTitle:@"验证" forState:UIControlStateNormal];
    emailBt.tag = 2;
    [emailBt addTarget:self action:@selector(clickBt:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:emailBt];
    
    offY += spacing+textFieldH;
    
    //验证银行卡
    UITextField *bankTF = [[UITextField alloc]initWithFrame:CGRectMake(offX, offY, textFieldW, textFieldH)];
    bankTF.borderStyle = UITextBorderStyleRoundedRect;
    bankTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    bankTF.placeholder = @"请输入银行卡";
    bankTF.tag = 3;
    [self.view addSubview:bankTF];
    
    UIButton *bankBt = [UIButton buttonWithType:UIButtonTypeCustom];
    bankBt.frame = CGRectMake(offX+spacing+textFieldW, offY, buttonW, buttonH);
    bankBt.backgroundColor = [UIColor orangeColor];
    [bankBt setTitle:@"验证" forState:UIControlStateNormal];
    bankBt.tag = 3;
    [bankBt addTarget:self action:@selector(clickBt:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bankBt];
    
    offY += spacing+textFieldH;
    
    //验证身份证
    UITextField *cardTF = [[UITextField alloc]initWithFrame:CGRectMake(offX, offY, textFieldW, textFieldH)];
    cardTF.borderStyle = UITextBorderStyleRoundedRect;
    cardTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    cardTF.placeholder = @"请输入身份证";
    cardTF.tag = 4;
    [self.view addSubview:cardTF];
    
    UIButton *cardBt = [UIButton buttonWithType:UIButtonTypeCustom];
    cardBt.frame = CGRectMake(offX+spacing+textFieldW, offY, buttonW, buttonH);
    cardBt.backgroundColor = [UIColor orangeColor];
    [cardBt setTitle:@"验证" forState:UIControlStateNormal];
    cardBt.tag = 4;
    [cardBt addTarget:self action:@selector(clickBt:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cardBt];
    
}
-(void)clickBt:(UIButton *)button{

    switch (button.tag) {
        case 1:
        {
            NSString *string = [self returnTextFeildText:1];
            //验证手机号码
            if ([HBValidateM validateMobile:string]) {
                //验证手机号码成功
                NSLog(@"验证手机号码成功");
            }
            else{
                NSLog(@"验证手机号码失败");
            }
            
        }
            break;
        case 2:
        {
            NSString *string = [self returnTextFeildText:2];
            //验证电子邮箱
            if ([HBValidateM validateEmail:string]) {
                //验证电子邮箱成功
                NSLog(@"验证电子邮箱成功");
            }
            else{
                NSLog(@"验证电子邮箱失败");
            }
            
        }
            break;
        case 3:
        {
            NSString *string = [self returnTextFeildText:3];
            //验证银行卡
            if ([HBValidateM validateBankCard:string]) {
                //验证银行卡成功
                NSLog(@"验证银行卡成功");
            }
            else{
                NSLog(@"验证银行卡失败");
            }
            
        }
            break;
        case 4:
        {
            NSString *string = [self returnTextFeildText:4];
            //验证身份证
            if ([HBValidateM isIdCard:string]) {
                //验证身份证成功
                NSLog(@"验证身份证成功");
            }
            else{
                NSLog(@"验证身份证失败");
                NSString *message = @"验证身份证失败";
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                                    message:message
                                                                   delegate:nil
                                                          cancelButtonTitle:@"确定"
                                                          otherButtonTitles:nil, nil];
                [alertView show];
            }
            
        }
            break;
            
        default:
            break;
    }
    
}

-(NSString *)returnTextFeildText:(NSInteger)tag{

    NSString *string = nil;
    for (UIView *aSubView in self.view.subviews) {
        if ([aSubView isKindOfClass:[UITextField class]]) {
            if (aSubView.tag==tag) {
                UITextField *textField = (UITextField *)aSubView;
                string = textField.text;
                
            }
        }
    }
    return string;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
