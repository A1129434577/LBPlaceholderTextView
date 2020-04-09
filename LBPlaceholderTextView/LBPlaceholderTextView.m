//
//  LBPlaceholderTextView.m
//  TestDome
//
//  Created by 刘彬 on 2020/3/27.
//  Copyright © 2020 刘彬. All rights reserved.
//

#import "LBPlaceholderTextView.h"

@interface LBPlaceholderTextView ()
@property (nonatomic, strong) UITextView *placeholderTextView;
@end

@implementation LBPlaceholderTextView
- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _placeholderTextView = [[UITextView alloc] init];
        _placeholderTextView.backgroundColor = [UIColor clearColor];
        _placeholderTextView.textColor = [UIColor lightGrayColor];
        _placeholderTextView.userInteractionEnabled = NO;
        [self addSubview:_placeholderTextView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _placeholderTextView.frame = self.bounds;
}

- (void)setFont:(UIFont *)font{
    [super setFont:font];
    _placeholderTextView.font = font;
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    _placeholderTextView.textColor = placeholderColor;
}

-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    if (!self.text.length) {
        _placeholderTextView.text = placeholder;
    }
}

- (void)setText:(NSString *)text{
    [super setText:text];
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextViewTextDidChangeNotification object:self];
}

-(void)textDidChange{
    if (self.text.length) {
        _placeholderTextView.text = nil;
    }else{
        _placeholderTextView.text = _placeholder;
    }
    if (self.maxLength && self.text.length>self.maxLength.unsignedIntegerValue) {
        self.text = [self.text substringToIndex:self.maxLength.unsignedIntegerValue];
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
