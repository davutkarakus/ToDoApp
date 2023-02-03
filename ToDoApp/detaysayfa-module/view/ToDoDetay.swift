//
//  ToDoDetay.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 1.02.2023.
//

import UIKit

class ToDoDetay: UIViewController {
    @IBOutlet weak var tfDetay: UITextField!
    var todo:ToDos?
    @IBOutlet weak var tfTarih: UITextField!
    var datePicker : UIDatePicker?
    var presenterNesnesi:DetaySayfaViewToPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetayRouter.createModule(ref: self)
        
        if let t = todo {
            tfDetay.text = t.todo_description
            tfTarih.text = t.todo_date
        }
        tfTasarim()
        
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
    func tfTasarim(){
        let bottomline = CALayer()
        bottomline.frame = CGRect(x: 0, y: tfDetay.frame.height - 1, width: tfDetay.frame.width, height: 1.0)
        bottomline.backgroundColor =  UIColor.black.cgColor
        
        let bottomline1 = CALayer()
        bottomline1.frame = CGRect(x: 0, y: tfTarih.frame.height - 1, width: tfTarih.frame.width, height: 1.0)
        bottomline1.backgroundColor =  UIColor.black.cgColor
        
        tfDetay.borderStyle = .none
        tfDetay.layer.addSublayer(bottomline)
        
        tfTarih.borderStyle = .none
        tfTarih.layer.addSublayer(bottomline1)
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
    
    @IBAction func buttonEdit(_ sender: Any) {
        if let tD = tfDetay.text ,let tT = tfTarih.text ,let t = todo{
            presenterNesnesi?.guncelle(todo_id: t.todo_id!, todo_description: tD, todo_date: tT)
        }
    }
}
