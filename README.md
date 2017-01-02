# YTPasswordField

YTPasswordField adds a toggle button to default UITextfield to hide / show password. You can also use default password strength levels or add your own regexp to check pasword strength. Border color changes accordingly to indicate password strength. 

You can use interface builder to change default icons or disable safety check.

![alt text](https://github.com/yasinturkdogan/YTPasswordField/blob/master/YTPasswordField/Resources/passwordfield.gif "")

## Basic Usage

Set YTPasswordField as custom class for your UITextField and use attribute inspector.

## How to register custom safety level?

```
yt.registerSafetyLevel(color: UIColor.red, regexp: ".{2,6}");

yt.registerSafetyLevel(color: UIColor.green, regexp: "^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})");
```
