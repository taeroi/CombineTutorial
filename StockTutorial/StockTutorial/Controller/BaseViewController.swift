//
//  BaseViewController.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import UIKit
import RxSwift
import Combine

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    var subscriber: Set<AnyCancellable> = .init()
    private var scrollView: UIScrollView?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        bind()
        setupTableView()
    }
    
    
    //MARK: - Methods
    
    func setupViews() {
        view.backgroundColor = .systemBackground
    }
    
    func bind() { }
    
    func setupTableView() { }
    
    
    // ----- Keyboard Observer -----
    
    func connectObservers(scrollView: UIScrollView) {
        self.scrollView = scrollView
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    func disconnectObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    private func keyboardWillShow(notification: NSNotification) {
        guard let scrollView = scrollView,
              let userInfo = notification.userInfo else { return }
        var keyboradFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboradFrame = self.view.convert(keyboradFrame, from: nil)
        
        var contentInset: UIEdgeInsets = scrollView.contentInset
        contentInset.bottom = keyboradFrame.size.height + 20
        scrollView.contentInset = contentInset
    }
    
    @objc
    private func keyboardWillHide(notification: NSNotification) {
        guard let scrollView = scrollView else { return }
        
        let contentInset: UIEdgeInsets = .zero
        scrollView.contentInset = contentInset
    }
}
