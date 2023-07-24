//
//  DateCalculatorViewController.swift
//  NewlyCoinedWord
//
//  Created by 선상혁 on 2023/07/20.
//

import UIKit

class DateCalculatorViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var dateImageView: [UIImageView]!
    
    @IBOutlet var dateView: [UIView]!
    
    @IBOutlet var dateLabel: [UILabel]!
    
    @IBOutlet var dDayLabel: [UILabel]!
    
    var plusday = 100
    
    let format = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDatePicker()
//        testViewProperty()
        
        for iv in dateImageView {
            setImageView(iv)
        }
        
        for label in dateLabel {
            setLabel(label)
        }
        
        for view in dateView {
            setView(view)
        }
        
        
        for dDay in dDayLabel {
            dDay.text = "D + \(plusday)"
            plusday += 100
            dDay.textColor = .white
        }
        
        dateSelected(datePicker)
    }

    @IBAction func dateSelected(_ sender: UIDatePicker) {
//        print(sender.date)
        
        var selectedDate = sender.date
        
        //대문자YYYY하면 연말에 내년으로 년도적용 -> 소문자y사용
        format.dateFormat = "yyyy년 MM월 dd일"
        
        //+100일 뒤
//        var result = Calendar.current.date(byAdding: .day, value: 100, to: selectedDate)!
//        print(result)
//        selectedDate = result
        
        //DateFormatter: 1. 시간대 변경 2. 날짜 포맷 변경
        
//        let value = format.string(from: result)
//        print(value)
        
        for label in dateLabel {
            
            selectedDate = Calendar.current.date(byAdding: .day, value: 100, to: selectedDate)!
            
            label.text = format.string(from: selectedDate)
        }
        
        //date100Label.text = value
       
    }
    
//    func testViewProperty() {
//        date100ImageView.layer.cornerRadius = 20
//        date100ImageView.backgroundColor = .systemTeal
//        date100ImageView.layer.shadowColor = UIColor.black.cgColor
//        date100ImageView.layer.shadowOffset = .zero //햇빛이 비치는 방향 CGSize(width: 0, height: 0)
//        date100ImageView.layer.shadowRadius = 10 //그림자 퍼짐의 정도
//        date100ImageView.layer.shadowOpacity = 0.5 //그림자 불투명도?
//        date100ImageView.clipsToBounds = false
//
//        date100Label.layer.cornerRadius = 20
//        date100Label.clipsToBounds = true
//        date100Label.backgroundColor = .blue
//    }
    
    
    func setDatePicker() {
        
        datePicker.tintColor = .red
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    func setImageView(_ iv: UIImageView) {
//        iv.layer.shadowColor = UIColor.black.cgColor
//        iv.layer.shadowOffset = .zero
//        iv.layer.shadowRadius = 10
//        iv.layer.shadowOpacity = 0.5
//        iv.clipsToBounds = false
        
        iv.layer.cornerRadius = 20
//        iv.clipsToBounds = true

        
    }
    
    func setLabel(_ label: UILabel) {
        label.textAlignment = .center
        label.textColor = .white
        
    }
    
    func setView(_ view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        view.clipsToBounds = false

    }
}

//날짜계산
/*
 1. timeinterval(second)
 2. Calender
 */
