//
//  ViewController.swift
//  contactsapp
//
//  Created by Navneet Kang on 11/30/20.
//  Copyright © 2020. All rights reserved.

import UIKit
import CoreData

class ViewController: UIViewController,DataUpdateDelegate {
    
    func updateContacts() {
        fetchRecord()
    }
    
    @IBOutlet weak var tableView: UITableView!
    var contactDatas: [NSManagedObject] = []
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return  appDelegate.persistentContainer.viewContext
    }
    
    func fetchRecord() {
        let managedContext =  getContext()
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Person")
        do {
            contactDatas = try managedContext.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func addNewContacts(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "secondVc", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVc = segue.destination as? SecondViewController {
            secondVc.delegate = self
        }
    }
    
    override func viewDidLoad() {
        self.title = "Contacts"
        fetchRecord()
        tableView.tableFooterView = UIView(frame: .zero)
        
        //        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(sender:)))
        //        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        //        tableView.addGestureRecognizer(doubleTapGestureRecognizer)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @objc func handleDoubleTap(sender: UITapGestureRecognizer) {
        let touchPoint = sender.location(in: tableView)
        if let indexPath = tableView.indexPathForRow(at: touchPoint) {
            print("handleDoubleTap",indexPath.row)
            
            let person = contactDatas[indexPath.row]
            
            if let name = person.value(forKey: "name") as? String {
                updateRecord(name)
            }
        }
    }
    
    func updateRecord(_ name: String) {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        let predicate = NSPredicate (format:"name = %@" ,name)
        fetchRequest.predicate = predicate
        do{
            let data = try context.fetch(fetchRequest)
            print(data.count)
            if data.count == 1
            {
                let objUpdate = data[0] as! NSManagedObject
                objUpdate.setValue(true, forKey: "favorite")
                do{
                    try context.save()
//                    self.presentAlert(withTitle: "Success!", message: "Added in Favourite contact list")
                    tableView.reloadData()
                }catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
        }catch {
            print(error)
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell",for: indexPath) as! ContactsTableViewCell
        let person = contactDatas[indexPath.row]
        cell.nameLabel.text =
            person.value(forKey: "name") as? String
        cell.numberLabel.text = person.value(forKey: "number") as? String
        cell.contactIcon.image = UIImage(named: "avatar")
        if let isShow = person.value(forKey: "favorite") as? Bool {
            print("isShow",isShow)
            if(isShow) {
                cell.star.image = UIImage(named: "star")
                cell.heartImage.image = UIImage(named: "heart")

            } else {
                cell.star.image = UIImage(named: "")
                cell.heartImage.image = UIImage(named: "")

            }
            
            
        }
    
        
        let doubleTapGestureRecognizerImage = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(sender:)))
        doubleTapGestureRecognizerImage.numberOfTapsRequired = 2
        cell.contactIcon.addGestureRecognizer(doubleTapGestureRecognizerImage)
        
        let doubleTapGestureRecognizerCell = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(sender:)))
        doubleTapGestureRecognizerCell.numberOfTapsRequired = 2
        cell.addGestureRecognizer(doubleTapGestureRecognizerCell)

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let context = getContext()
            context.delete(contactDatas[indexPath.row] as NSManagedObject)
            do {
                try context.save()
                fetchRecord()
            } catch {
                print(error)
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
