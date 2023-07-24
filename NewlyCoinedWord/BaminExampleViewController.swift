//
//  BaminExampleViewController.swift
//  NewlyCoinedWord
//
//  Created by 선상혁 on 2023/07/22.
//

import UIKit

class BaminExampleViewController: UIViewController {

    @IBOutlet var viewTitle: UINavigationItem!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewTitle()
        
    }
    
    func setViewTitle() {
        viewTitle.title = "레이아웃 뽀개기"
    }

}
