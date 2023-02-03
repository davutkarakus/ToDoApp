//
//  ToDoKayit.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 1.02.2023.
//

import UIKit

class ToDoKayit: UIViewController {
    
    @IBOutlet weak var tfNewToDo: UITextField!
    var datePicker : UIDatePicker?
    @IBOutlet weak var tfTarih: UITextField!
    var presenterNesnesi:KayitSayfaViewToPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasarimAll()
        
        KayitRouter.createModule(ref: self)
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tfTarih.inputView = datePicker
        
        
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .wheels
        }
        
        
        let dokunmAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod))
        view.addGestureRecognizer(dokunmAlgilama)
        datePicker?.addTarget(self, action: #selector(tarihGoster(uiDatePicker: )), for: .valueChanged)
    }
    
    @objc func dokunmaAlgilamaMetod(){
        view.endEditing(true)
    }
    @objc func tarihGoster(uiDatePicker:UIDatePicker){
        let tarihFormati = DateFormatter()
        tarihFormati.dateFormat = "EEEE, MMM d, yyyy"
        let alinanTarih = tarihFormati.string(from: uiDatePicker.date)
        tfTarih.text = alinanTarih
    }
    @IBAction func buttonAddNewToDo(_ sender: Any) {
        if let tD = tfNewToDo.text , let tT = tfTarih.text {
            presenterNesnesi?.kaydet(todo_description: tD, todo_date: tT)
        }
    }
    func tasarimAll() {
        let bottomline = CALayer()
        bottomline.frame = CGRect(x: 0, y: tfNewToDo.frame.height - 1, width: tfNewToDo.frame.width, height: 1.0)
        bottomline.backgroundColor =  UIColor.black.cgColor
        let bottomline1 = CALayer()
        bottomline1.frame = CGRect(x: 0, y: tfTarih.frame.height - 1, width: tfTarih.frame.width, height: 1.0)
        bottomline1.backgroundColor =  UIColor.black.cgColor
        tfNewToDo.borderStyle = .none
        tfNewToDo.layer.addSublayer(bottomline)
        tfTarih.borderStyle = .none
        tfTarih.layer.addSublayer(bottomline1)
    }
}
