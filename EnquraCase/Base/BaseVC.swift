//
//  BaseVC.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import UIKit
import RxSwift

class BaseVC<T>: UIViewController,TopNavBarDelegate where T : BaseVM {
    var viewModel : T?
    let disposeBag = DisposeBag()
    
    var subView: UIView?
    
    let errorTitle = NSLocalizedString("ErrorTitle", comment: "")
    let warningTitle = NSLocalizedString("WarningTitle", comment: "")
    let infoTitle = NSLocalizedString("InfoTitle", comment: "")
    let okText = NSLocalizedString("OkAction", comment: "")
    
    let textAttributes =  [NSAttributedString.Key.foregroundColor: UIColor.white,
                         NSAttributedString.Key.font: UIFont(name: "MarkPro-Bold", size: 12.0) as Any]  as [NSAttributedString.Key : Any]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.showLoading.subscribe(onNext: {(isLoading) in
            if isLoading{
                self.startIndicatingActivity()
            }else{
                self.stopIndicatingActivity()
            }
            
        }).disposed(by: disposeBag)
        viewModel?.error.subscribe(onNext : {(data) in
            let alert = UIAlertController(title: self.infoTitle, message: data, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: self.okText, style: .default, handler: nil))
            self.present(alert, animated: true)
        }).disposed(by: disposeBag)
    }
    
    func showMessage(withTitle _title: String? = "NERFIT!",
                     withMessage _message: String,
                     buttonTitle: String? = "Tamam",
                     callBack: (()->())? = nil) {
        
        let alert = UIAlertController(title: _title!,
                                      message: _message,
                                      preferredStyle: .alert)
        
        let cancelAction:UIAlertAction!
        if let cb = callBack{
            cancelAction = UIAlertAction(title: buttonTitle!,
                                         style: .destructive,
                                         handler: { (action) in
                cb()
            })
        }
        else{
            cancelAction = UIAlertAction(title: buttonTitle!,
                                         style: .destructive)
        }
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func backAction() {
         if let navc = self.navigationController {
             navc.popViewController(animated: true)
         }
         else {
             self.dismiss(animated: true, completion: nil)
         }
     }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func keyboardConfig(view: UIView?) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hide))
        tapGesture.cancelsTouchesInView = false
        subView = view
        subView?.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func hide() {
        self.subView?.endEditing(true)
        self.subView?.endEditing(true)
    }
    
}
