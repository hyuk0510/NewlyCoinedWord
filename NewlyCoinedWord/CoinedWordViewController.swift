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
        
        guard let title = searchTextField.text else {
            return
        }
        
        if title == "" || title.count <= 1{
            let alert = UIAlertController(title: "두 글자 이상 입력해주세요.", message: nil, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            let ok = UIAlertAction(title: "확인", style: .default)
            
            alert.addAction(cancel)
            alert.addAction(ok)
            
            present(alert, animated: true)
            
        } else if question.keys.contains(title) {
            answerLabel.text = title
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

        guard let title = searchTextField.text else {
            return
        }
        
        if title == "" || title.count <= 1{
            let alert = UIAlertController(title: "두 글자 이상 입력해주세요.", message: nil, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            let ok = UIAlertAction(title: "확인", style: .default)
            
            alert.addAction(cancel)
            alert.addAction(ok)
            
            present(alert, animated: true)
            
        } else if question.keys.contains(title) {
            answerLabel.text = title
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
        var quizIndex = 0
        
        quizArray.shuffle()
                
        for quiz in quizButton {

            if quiz.tag <= quizArray.count {
                quizIndex = quiz.tag - 1
            } else {
                quiz.isHidden = true
            }
                        
            quiz.setTitle(quizArray[quizIndex], for: .normal)
            quiz.setTitleColor(.black, for: .normal)
            
            quiz.layer.borderColor = UIColor.black.cgColor
            quiz.layer.borderWidth = 0.5
            quiz.layer.cornerRadius = 5
                        
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
