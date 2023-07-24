//
//  CoinedWordViewController.swift
//  NewlyCoinedWord
//
//  Created by 선상혁 on 2023/07/20.
//

import UIKit

class CoinedWordViewController: UIViewController {

    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    
    @IBOutlet var quizButton: [UIButton]!
        
    
    @IBOutlet var answerLabel: UILabel!
        
    @IBOutlet var answerImageView: UIImageView!
    
    let question = ["상남자" : "남자다운 남자", "하남자" : "상남자의 반대말", "폼 미쳤다" : "무언가 범상치 않다"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if searchTextField
        
        setButton()
        setQuizButton()
        
        setImageView()
        setAnswerLabel()
    }
    
    
    @IBAction func searchTextFieldEnter(_ sender: UITextField) {
        
        answerImageView.image = UIImage(named: "background")
        
        if let value = question[searchTextField.text!] {
            
            answerLabel.text = value
        } else {
            answerLabel.text = "없는 문제입니다."
        }
        
        searchTextField.text = ""
        
        
    }

    @IBAction func tappedView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        answerImageView.image = UIImage(named: "background")
        
        if let value = question[searchTextField.text!] {
            
            answerLabel.text = value
        } else {
            answerLabel.text = "없는 문제입니다."
        }
        
        
        searchTextField.text = ""
        view.endEditing(true)
        
    }
    
    @IBAction func quizButtonPressed(_ sender: UIButton) {
        
        answerImageView.image = UIImage(named: "background")
        
        searchTextField.text = sender.titleLabel?.text
            
        answerLabel.text = question[sender.currentTitle!]
        
        view.endEditing(true)
        
    }
    
    func setButton() {
        searchButton.backgroundColor = .black
    }
    
    func setQuizButton() {
        
        var quizArray = question.keys.map{String($0)}
        
        //print(quizArray)
        
        for quiz in quizButton {
            
            if !quizArray.isEmpty {
                //print(quizArray)
                
                let title = quizArray.randomElement()
                let index = quizArray.firstIndex(of: title!)
                
                quiz.setTitle(title, for: .normal)
                quiz.setTitleColor(.black, for: .normal)
                
                quiz.layer.borderColor = UIColor.black.cgColor
                quiz.layer.borderWidth = 0.5
                quiz.layer.cornerRadius = 5
                
                quizArray.remove(at: index!)
            } else {
                quiz.isHidden = true
            }

            
            //quiz.titleLabel?.font = .systemFont(ofSize: 50) 적용이 안됨..
            
            
            
        }
        
    }
    
    func setAnswerLabel() {
        answerLabel.textColor = .black
        answerLabel.textAlignment = .center
        answerLabel.numberOfLines = 3
    }
    
    func setImageView() {
        answerImageView.image = UIImage(named: "word_logo")
        answerImageView.contentMode = .scaleAspectFill
    }

}
