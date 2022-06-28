//
//  TopNavBar.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import UIKit
import RxSwift

protocol TopNavBarDelegate {
    func backAction()
}

class TopNavBar: UIView {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet var container: UIView!
    
    let disposeBag = DisposeBag()
    var delegate: TopNavBarDelegate?
    
    var barKind: String?
    
    lazy var titleConstraints: [NSLayoutConstraint] = [
        NSLayoutConstraint(item: self.titleLbl as Any, attribute: .left, relatedBy: .equal, toItem: self.container, attribute: .left, multiplier: 1, constant: 60),
        NSLayoutConstraint(item: self.titleLbl as Any, attribute: .right, relatedBy: .equal, toItem: self.container, attribute: .right, multiplier: 1, constant: 0),
        NSLayoutConstraint(item: self.titleLbl as Any, attribute: .top, relatedBy: .equal, toItem: self.container, attribute: .top, multiplier: 1, constant: 0),
        NSLayoutConstraint(item: self.titleLbl as Any, attribute: .bottom, relatedBy: .equal, toItem: self.container, attribute: .bottom, multiplier: 1, constant: 0),
    ]
    
    @IBInspectable var fontSize: CGFloat = 18 {
        didSet {
            titleLbl.font = UIFont(name: fontName, size: fontSize)
        }
    }
    
    @IBInspectable var fontName: String = "ProximaNova-Bold" {
        didSet {
            titleLbl.font = UIFont(name: fontName, size: fontSize)
        }
    }
    
    @IBInspectable var kind: String {
        get {
            return self.kind
        }
        set{
            if newValue == "others" {
                self.container.addConstraints(titleConstraints)
                self.titleLbl.textAlignment = .left
            }
        }
    }
    
    @IBInspectable var titleText: String {
        get {
            return self.titleLbl.text!
        }
        set {
            let title = NSLocalizedString(newValue, comment: "")
            let font = UIFont(name: fontName, size: fontSize)
            let attribute = [ NSAttributedString.Key.foregroundColor: UIColor.white,
                              NSAttributedString.Key.font: font]
            let attrString = NSAttributedString(string: title, attributes: attribute as [NSAttributedString.Key : Any])
            
            self.titleLbl.attributedText = attrString
            self.titleLbl.text = title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ownFirstNib()
        configure()
        

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ownFirstNib()
        configure()
    }
}

extension TopNavBar {
    func configure() {
        self.backBtn.rx.tap.bind{
            self.delegate?.backAction()
        }.disposed(by: disposeBag)
    }
}
