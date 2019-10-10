//
//  ViewController.swift
//  APITableView
//
//  Created by Kulyash Konyrova on 10/9/19.
//  Copyright © 2019 Kulyash Konyrova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tasks: [Task] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    final let url = URL(string: "https://jsonplaceholder.typicode.com/todos/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        downloadJson()
    }
    
    func downloadJson() {
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            print("downloaded")
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? NSArray

            for json_ in json!{
                let taskJSON = json_ as! NSDictionary
                let task = Task(userId: taskJSON["userId"] as! Int, id: taskJSON["id"] as! Int, title: taskJSON["title"] as! String, completed: taskJSON["completed"] as! Bool)
                self.tasks.self.append(task)
//                print(task.title)
            }
            
            DispatchQueue.main.sync {
                self.tableView.reloadData()
                
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell
            else { return UITableViewCell() }
        
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.text = tasks[indexPath.row].title
        
        //print ("data reload")
        return cell
    }
}

