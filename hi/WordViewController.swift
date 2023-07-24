//
//  WordViewController.swift
//  NewlyCoinedWord
//
//  Created by 선상혁 on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var answerLabel: UILabel!
    
    @IBOutlet var wordFirstButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.text = getRandomWord()
        
        //wordFirstButton.isHidden = true
                
        wordFirstButton.isHidden = false
        
        wordFirstButton.titleLabel?.font = .systemFont(ofSize: 20)
        wordFirstButton.titleLabel?.textColor = .black

    }
    
    @IBAction func enterTextField(_ sender: UITextField) {
        
//        if searchTextField.text == "ㅎㅇ" {
//
//            answerLabel.text = "안녕"
//        } else if searchTextField.text == "ㅂㅇ" {
//
//            answerLabel.text = "잘가"
//        } else if searchTextField.text == "hi" {
//
//            answerLabel.text = "영어로 안녕"
//        } else {
//            answerLabel.text = "찾는 결과가 없습니다"
//        }
        
        switch searchTextField.text {
        case "ㅎㅇ":
            answerLabel.text = "안녕"
        case "ㅂㅇ":
            answerLabel.text = "잘가"
        case "hi":
            answerLabel.text = "영어로 안녕"
        default:
            answerLabel.text = "찾는 결과가 없습니다"
        }
        
//        searchTextField.text = ""
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        searchTextField.text = sender.currentTitle
//        print(sender.currentTitle)
        
        //sender.titleLabel?.text
        
        enterTextField(searchTextField)
    }
    
    // @discardableResult item을 써도 되고 안써도 되게끔 만들어줌
    func getRandomWord() -> String {
        let random = ["가", "나", "다", "라", "마", "바"]
        let result = random.randomElement()!
        print(result)
        
        return result
    }
}
