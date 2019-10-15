# LBPlaceholderTextView
```OBJC
LBPlaceholderTextView *placeholderTextView = [[LBPlaceholderTextView alloc] initWithFrame:CGRectMake(20, 200, CGRectGetWidth(self.view.frame)-20*2, 60)];
placeholderTextView.backgroundColor = [UIColor cyanColor];
placeholderTextView.font = [UIFont systemFontOfSize:17];
placeholderTextView.maxLength = 200;
placeholderTextView.clearButtonMode = UITextFieldViewModeAlways;
placeholderTextView.placeholder = @"请输入";
```
![](https://github.com/A1129434577/LBPlaceholderTextView/blob/master/LBPlaceholderTextView.gif?raw=true)
