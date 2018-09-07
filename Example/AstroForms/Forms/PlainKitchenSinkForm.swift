//
//  PlainKitchenSinkForm.swift
//  AstroForms_Example
//
//  Created by Andrew Plummer on 5/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import AstroForms

class PlainKitchenSinkForm: Form {
    
    enum KitchenSinkTag: RowTag {
        case
        custom(String),
        email,
        password
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        do {
            
            for i in 1...20 {
                let dummy = try TextFieldRow(
                    tag: KitchenSinkTag.custom("\(i)"),
                    title: "Dummy-(\(i))",
                    value: nil,
                    placeholder: "dummy-\(i)@astroforms.com",
                    keyboardType: .emailAddress,
                    isSecureTextEntry: false,
                    clearButtonMode: .whileEditing
                )
                self.append(dummy)
            }
            
            
            
            let textField = try TextFieldRow(
                tag: KitchenSinkTag.email,
                title: "Email",
                value: nil,
                placeholder: "email@astroforms.com",
                keyboardType: .emailAddress,
                isSecureTextEntry: false,
                clearButtonMode: .whileEditing
            )
            
            let passwordField = try TextFieldRow(
                tag: KitchenSinkTag.password,
                title: "Password",
                value: nil,
                placeholder: "******",
                keyboardType: .default,
                isSecureTextEntry: true,
                clearButtonMode: .always
            )
            
            textField.focusRect = {
                CGRect(
                    x: textField.baseView.frame.origin.x,
                    y: textField.baseView.frame.origin.y,
                    width: textField.baseView.frame.width,
                    height: textField.baseView.frame.height + passwordField.baseView.frame.height
                )
            }
            
            self.append(textField)
            self.append(passwordField)
            
        } catch let error {
            debugPrint("Error:", error)
        }
        
    }
    
    override func rowDidEndEditing(row: AnyRow) {
        
        guard let tag = row.tag as? KitchenSinkTag else { return }
        
        switch tag {
        case .custom(let str):
            break
        case .email:
            
            guard let helloWorldRow = row as? TextFieldRow else {
                return
            }
            
            let str = helloWorldRow.value
            
            print("str:", str)
        case .password:
            break
            
        }
        
    }
    
}