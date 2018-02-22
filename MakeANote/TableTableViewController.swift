//
//  TableTableViewController.swift
//  MakeANote
//
//  Created by Manasa on 2/21/18.
//  Copyright © 2018 baitinti. All rights reserved.
//

import UIKit
import CoreData


class TableTableViewController: UITableViewController {
    
    var listNotes = [MyNotes]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNotes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        cell.configureCell(data: listNotes[indexPath.row])
        cell.deleteBt.tag = indexPath.row
        cell.editBT.tag = indexPath.row
        cell.deleteBt.addTarget(self, action: #selector(onClickDelete(_:)), for: .touchUpInside)
        
        cell.editBT.addTarget(self, action: #selector(onClickEdit(_:)), for: .touchUpInside)

        // Configure the cell...

        return cell
    }
 
    @objc func onClickDelete(_ sender: UIButton) {
        print("index\(sender.tag)")
        context.delete(listNotes[sender.tag])
        loadData()
    }
    
    @objc func onClickEdit(_ sender: UIButton) {
        print("index\(sender.tag)")
        performSegue(withIdentifier: "ShowNotes", sender: listNotes[sender.tag])
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowNotes" {
            if let viewController: ViewController = (segue.destination as? ViewController){
                if let myNote = sender as? MyNotes{
            viewController.editNote = myNote
                }
            }
            
        }
    }
    @IBAction func onClickAdd(_ sender: Any) {
                performSegue(withIdentifier: "ShowNotes", sender: nil)
    }
    
    func loadData(){
        let fetchRequest: NSFetchRequest<MyNotes> = MyNotes.fetchRequest()
        do {
             listNotes = try context.fetch(fetchRequest)
            tableView.reloadData()
        } catch  {
            print("cannot access data")
        }
        
        
    }
}


