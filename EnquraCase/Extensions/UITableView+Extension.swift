//
//  UITableView+Extension.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 30.06.2022.
//

import UIKit

extension UITableView {

    func deselectAllSelectedRows() {
        let _ = self.indexPathsForSelectedRows?.compactMap { self.deselectRow(at: $0, animated: true) }
    }
}
