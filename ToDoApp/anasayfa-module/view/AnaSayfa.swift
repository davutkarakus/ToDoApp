//
//  ViewController.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 1.02.2023.
//

import UIKit

class AnaSayfa: UIViewController {
    var liste = [ToDos]()
    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var buttonEkle: UIButton!
    @IBOutlet var backGroundView: UIView!
    var anaSayfaPresenterNesnesi:AnaSayfaViewToPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AllDesign()
        
        AnaSayfaRouter.createModule(ref: self)
        searchBar.delegate = self
        toDoTableView.backgroundColor = UIColor.clear
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        veritabaniKopyala()
    }
    override func viewWillAppear(_ animated: Bool) {
        anaSayfaPresenterNesnesi?.todosYukle()
    }
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("todo.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var")
        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    func AllDesign(){
        backGroundView.backgroundColor = UIColor(named: "backGroundRenk")
        buttonEkle.tintColor = .white
        buttonEkle.layer.cornerRadius = buttonEkle.frame.height/2
        buttonEkle.layer.shadowOpacity = 0.25
        buttonEkle.layer.shadowRadius = 5
        buttonEkle.layer.shadowOffset = CGSize(width: 0, height: 10)
        buttonEkle.toolTip = "Add a new to do item"
        self.searchBar.backgroundImage = UIImage()
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "anaRenk")
        appearance.largeTitleTextAttributes = [.foregroundColor:UIColor(named: "yaziRenk")!,.font:UIFont(name: "BubblegumSans-Regular", size: 30)!]
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    
    }
    
    @IBAction func buttonEkle(_ sender: Any) {
        performSegue(withIdentifier: "toKayit", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let toDo = sender as? ToDos {
                let gidilecekVC = segue.destination as! ToDoDetay
                gidilecekVC.todo = toDo
            }
        }
    }
}
extension AnaSayfa:AnaSayfaPresenterToViewProtocol {
    func vieweVeriGonder(todoListesi: [ToDos]) {
        self.liste = todoListesi
        self.toDoTableView.reloadData()
    }
    
    
}
extension AnaSayfa : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anaSayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension AnaSayfa:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "toDoHucre") as! ToDoTableViewCell
        let toDo = liste[indexPath.row]
        hucre.labelToDo.text = toDo.todo_description
        hucre.labelTarih.text = toDo.todo_date
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = liste[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: toDo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,Bool) in
            let toDo = self.liste[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(toDo.todo_description!) Silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){action in
                self.anaSayfaPresenterNesnesi?.sil(todo_id: toDo.todo_id!)
            }
            alert.addAction(evetAction)
            self.present(alert,animated: true)
           
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    
}
