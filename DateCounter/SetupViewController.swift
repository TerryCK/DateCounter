//
//  SetupViewController.swift
//  DateCounter
//
//  Created by CHEN GUAN-JHEN on 2019/7/7.
//  Copyright © 2019 Yi Shiung Liu. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var date: UILabel!
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        if let viewController = navigationController?.viewControllers.first(where: { $0 is ViewController }) as? ViewController {
            viewController.dateSource.append(pickedDate)
        }
        navigationController?.popViewController(animated: true)
    }
    
    private var pickedDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let datePickerView = UIDatePicker()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        datePickerView.datePickerMode = .date
        dateTextField.text = dateFormatter.string(from: Date())
        datePickerView.addTarget(self,
                             action: #selector(SetupViewController.datePickerChanged),
                             for: .valueChanged)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SetupViewController.tapView))
        view.addGestureRecognizer(tapGestureRecognizer)
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
                          UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(SetupViewController.tapView))]
                            , animated: true)
        dateTextField.inputAccessoryView = toolBar
        dateTextField.inputView = datePickerView
    }
    
    @objc func tapView() {
         view.endEditing(true)
    }
    @objc func datePickerChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        pickedDate = datePicker.date
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        
       
        
//        view.endEditing(true)
    }

    

}
