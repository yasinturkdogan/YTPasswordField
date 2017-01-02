Pod::Spec.new do |s|
  s.name             = 'YTPasswordField'
  s.version          = '0.1.0'
  s.summary          = 'UITextfield with password strength checker functionality'
 
  s.description      = <<-DESC
 YTPasswordField adds a toggle button to default UITextfield to hide / show password. You can use default password strength levels or add your own regexp to check pasword strength. Border color changes accordingly to indicate password strength.
                       DESC
 
  s.homepage         = 'https://github.com/yasinturkdogan/YTPasswordField'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yasin Turkdogan' => 'yasinturkdogan@gmail.com' }
  s.source           = { :git => 'https://github.com/yasinturkdogan/YTPasswordField.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'YTPasswordField/*'
 
end