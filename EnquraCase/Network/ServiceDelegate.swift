//
//  ServiceDelegate.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 30.06.2022.
//

import Foundation

protocol ServiceDelegate: class {
    var networkManager: NetworkManagerDelegate { get }
}
