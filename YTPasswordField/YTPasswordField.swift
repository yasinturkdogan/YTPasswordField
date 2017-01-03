//
//  YTPasswordField.swift
//  YTPasswordField
//
//  Created by Yasin Turkdogan on 1/2/17.
<<<<<<< HEAD
//  Copyright © 2017 turkdogan. All rights reserved.
=======
//  Copyright © 2017 Turkdogan. All rights reserved.
>>>>>>> origin/master
//

import Foundation


@IBDesignable public class YTPasswordField : UITextField {
    
    @IBInspectable var showPasswordIcon:UIImage = UIImage(named: "show.png", in: Bundle(for: YTPasswordField.self), compatibleWith: nil)!;
    @IBInspectable var hidePasswordIcon:UIImage = UIImage(named: "hide.png", in: Bundle(for: YTPasswordField.self), compatibleWith: nil)!;
    @IBInspectable var safetyCheck:Bool = true;
    
    private let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 30);
    private var toggleButton:UIButton = UIButton();
    
    private var defaultLevels:[(level:Int, color:UIColor, regexp:String)] = [
        
        (level:1, color:UIColor.clear, regexp: ".{0,2}"),
        (level:2, color:UIColor.fromHex(0xFF0000), regexp: ".{2,6}"),
        (level:3, color:UIColor.fromHex(0xFF0000), regexp: ".{2,6}"),
        (level:4, color:UIColor.fromHex(0xFF7700), regexp: ".{6,}"),
        (level:5, color:UIColor.fromHex(0xFFCC00), regexp: "^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})"),
        (level:6, color:UIColor.fromHex(0x77FF00), regexp: "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\\$%\\^&\\*])(?=.{8,})"),
        
    ];
    private var registeredLevels:[(level:Int,color:UIColor, regexp:String)] = [];
    
    override public func awakeFromNib() {
        
        toggleButton.frame = CGRect(x: self.frame.width - self.frame.height, y: 0, width: self.frame.height, height: self.frame.height);
        toggleButton.setImage(showPasswordIcon, for: UIControlState.normal);
        toggleButton.setImage(hidePasswordIcon, for: UIControlState.selected);
        toggleButton.isSelected = self.isSecureTextEntry
        toggleButton.isHidden = true;
        toggleButton.addTarget(self, action: #selector(onShowClick(sender:)), for: .touchUpInside)
        
        self.addSubview(toggleButton);
        
        if(safetyCheck) {
            self.layer.borderColor = UIColor.clear.cgColor;
            self.layer.borderWidth = 1;
            self.layer.cornerRadius = 4;
        }
        
        self.addTarget(self, action: #selector(onEditingChanged(sender:)), for: .editingChanged);
        self.addTarget(self, action: #selector(onEditingBegin(sender:)), for: .editingDidBegin);
        self.addTarget(self, action: #selector(onEditingEnd(sender:)), for: .editingDidEnd);
    }    
    
    public func registerSafetyLevel(color:UIColor, regexp:String) {
        registeredLevels.insert((level:registeredLevels.count + 1, color:color, regexp:regexp),at:0);
    }
    
    public func registerIcons(showIcon:UIImage, hideIcon:UIImage) {
        self.toggleButton.setImage(showIcon, for: .normal);
        self.toggleButton.setImage(hideIcon, for: .selected);
    }
    
    internal func onEditingBegin(sender:UITextField) {
        self.toggleButton.isHidden = false;
        
        if(safetyCheck) {
            self.layer.borderColor = self.safetyColor.cgColor;
        }
    }
    
    internal func onEditingEnd(sender:UITextField) {
        self.toggleButton.isHidden = true;
        
        if(safetyCheck) {
            self.layer.borderColor = UIColor.clear.cgColor;
        }
    }
    
    internal func onEditingChanged(sender:UITextField) {
        if(safetyCheck) {
            UIView.animate(withDuration: 0.2) {
                self.layer.borderColor = self.safetyColor.cgColor;
            }
        }
    }
    
    internal func onShowClick(sender:UIButton) {
        self.isSecureTextEntry = !self.isSecureTextEntry;
        self.toggleButton.isSelected = self.isSecureTextEntry
    }
    
    private var safetyColor:UIColor {
        let levelsToCheck = registeredLevels.isEmpty ? defaultLevels : registeredLevels;
        if let value = self.text {
            if(value.isEmpty) {
                return levelsToCheck.last!.color
            }
            
            for level in levelsToCheck {
                if (value.range(of: level.regexp, options: .regularExpression, range: nil, locale: nil) != nil ) {
                    return level.color;
                }
            }
            
            return levelsToCheck.last!.color;
        }
        
        return levelsToCheck.last!.color;
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews();
        self.toggleButton.frame = CGRect(x: self.frame.width - self.frame.height, y: 0, width: self.frame.height, height: self.frame.height);
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding);
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding);
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding);
    }
    
}
