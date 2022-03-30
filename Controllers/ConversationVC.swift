//
//  ViewController.swift
//  MessengerClone
//
//  Created by Amirkhouzam on 25/03/2022.
//

import UIKit

class ConversationVC: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
     
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let loggedin = UserDefaults.standard.bool(forKey: "logedin")
        if !loggedin {
            let vc = LoginVC()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true, completion: nil)
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

