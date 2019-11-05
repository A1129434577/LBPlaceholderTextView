//
//  LBPlaceholderTextView.m
//  TransitBox
//
//  Created by 刘彬 on 2019/4/29.
//  Copyright © 2019 BIN. All rights reserved.
//

#import "LBPlaceholderTextView.h"

@interface LBTextViewTextField : UITextField
@property (nonatomic,assign)LBPlaceholderTextView *textView;
@end
@implementation LBTextViewTextField

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *hitView = [super hitTest:point withEvent:event];
    if ([hitView isEqual:self]) {
        return (UIView *)self.textView;
    }
    return hitView;
}
@end

@interface LBPlaceholderTextView()<UITextFieldDelegate>
@property (nonatomic,assign)CGRect placeholderTextFieldFrame;
@end
@implementation LBPlaceholderTextView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _maxLength = -1;
        self.font = [UIFont systemFontOfSize:16];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(frame)) options:NSKeyValueObservingOptionNew context:nil];
        _placeholderTextFieldFrame = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame)+(self.contentInset.top?self.contentInset.top:10), CGRectGetWidth(frame), self.font.lineHeight);
        _placeholderTextField = [[LBTextViewTextField alloc] initWithFrame:_placeholderTextFieldFrame];
        _placeholderTextField.leftViewMode = UITextFieldViewModeAlways;
        _placeholderTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, CGRectGetHeight(frame))];
        _placeholderTextField.textView = self;
        _placeholderTextField.delegate = self;
        _placeholderTextField.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)didMoveToSuperview{
    [super didMoveToSuperview];
    [self.superview addSubview:_placeholderTextField];
}

-(void)setFont:(UIFont *)font{
    [super setFont:font];
    self.placeholderTextField.font = font;
    
    _placeholderTextFieldFrame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame)+(self.contentInset.top?self.contentInset.top:10), CGRectGetWidth(self.frame), self.font.lineHeight);
    if (self.text.length) {
        self.placeholderTextField.frame = self.frame;
    }else self.placeholderTextField.frame = _placeholderTextFieldFrame;
}
-(void)setText:(NSString *)text{
    [super setText:text];
    [self textDidChange];
}
-(void)setClearButtonMode:(UITextFieldViewMode)clearButtonMode{
    _clearButtonMode = clearButtonMode;
    _placeholderTextField.clearButtonMode = clearButtonMode;
    
    if (clearButtonMode != UITextFieldViewModeNever) {
        self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, self.contentInset.bottom, 20);
    }
}
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.placeholderTextField.placeholder = placeholder;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (keyPath == NSStringFromSelector(@selector(frame))) {
        if (self.text.length) {
            self.placeholderTextField.frame = self.frame;
        }else self.placeholderTextField.frame = _placeholderTextFieldFrame;
        
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
-(void)textDidChange{
    if (self.text.length) {
        self.placeholderTextField.text = @" ";//让clearButton像TextField一样正常显示
        if (_maxLength>-1 && self.text.length > _maxLength) {
            self.text = [self.text substringToIndex:_maxLength];
        }
        self.placeholderTextField.frame = self.frame;
    }else{
        self.placeholderTextField.text = nil;
        self.placeholderTextField.frame = _placeholderTextFieldFrame;
    }
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    self.text = nil;
    [self textDidChange];
    return NO;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(frame))];
}
@end
