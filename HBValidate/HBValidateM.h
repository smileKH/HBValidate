//
//  HBValidateM.h
//  HBValidate
//
//  Created by aplle on 2017/2/23.
//  Copyright © 2017年 fenger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBValidateM : NSObject
//验证手机号码
+ (BOOL) validateMobile:(NSString *)mobile;
#pragma mark 电话号验证
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

//验证电子邮箱
+ (BOOL) validateEmail:(NSString *)email;

//验证密码
+ (BOOL) validatePassword:(NSString *) password;

//验证银行卡
+(BOOL)validateBankCard:(NSString *)card;

//  4.身份证验证
+ (BOOL)isIdCard:(NSString *)sPaperId;
@end
