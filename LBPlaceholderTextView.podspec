Pod::Spec.new do |spec|
  spec.name         = "LBPlaceholderTextView"
  spec.version      = "0.0.1"
  spec.summary      = "支持placeholder、clearButtonMode、maxLength的TextView。"
  spec.description  = "支持placeholder、clearButtonMode、maxLength的TextView。"
  spec.homepage     = "https://github.com/A1129434577/LBPlaceholderTextView"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "刘彬" => "1129434577@qq.com" }
  spec.platform     = :ios
  spec.ios.deployment_target = '8.0'
  spec.source       = { :git => 'https://github.com/A1129434577/LBPlaceholderTextView.git', :tag => spec.version.to_s }
  spec.source_files = "LBPlaceholderTextView/**/*.{h,m}"
  spec.requires_arc = true
end
