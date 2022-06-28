//
//  RawRepresentable.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation

extension RawRepresentable where RawValue == Int {
    
    static var itemCount: Int {
        var index = 0
        while Self(rawValue: index) != nil {
            index += 1
        }
        return index
    }
    
    static var items: [Self] {
        var items = [Self]()
        var index = 0
        while let item = Self(rawValue: index) {
            items.append(item)
            index += 1
        }
        
        return items
    }
}
