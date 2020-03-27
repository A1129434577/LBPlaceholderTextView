//
//  LBPlaceholderTextView.h
//  TestDome
//
//  Created by 刘彬 on 2020/3/27.
//  Copyright © 2020 刘彬. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBPlaceholderTextView : UITextView
@property (nonatomic, strong, nullable) NSString *placeholder;
@property (nonatomic, strong, nullable) UIColor  *placeholderColor;
@property (nonatomic, assign, nullable) NSNumber *maxLength;

@end

NS_ASSUME_NONNULL_END
