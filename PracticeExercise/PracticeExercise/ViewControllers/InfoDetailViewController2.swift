//
//  InfoDetailViewController2.swift
//  PracticeExercise
//
//  Created by User on 12/6/21.
//

import UIKit

class InfoDetailViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var infoItem : PersonalInfo?
    var todoArray = [ToDoInfo]()

    @IBOutlet weak var detailListTblview: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        detailListTblview.delegate = self
        detailListTblview.dataSource = self
        detailListTblview.estimatedRowHeight = 500
        makeNetworkCall()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return todoArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0) {
            guard let cell: DetailHeaderCell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for:indexPath) as? DetailHeaderCell
            else {
                    return UITableViewCell()
            }
            cell.nameLbl.text = infoItem?.name
            cell.emailLbl.text = infoItem?.email
            cell.phoneLbl.text = infoItem?.phone
            return cell
        }
        else {
            guard let cell: DetailListCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for:indexPath) as? DetailListCell
            else {
                    return UITableViewCell()
            }
            let detailInfo = todoArray[indexPath.row]
            cell.userIdLbl.text = String(detailInfo.userId)
            cell.todoIdLbl.text = String(detailInfo.id)
            cell.titleLbl.text = detailInfo.title
            cell.completedLbl.text = String(detailInfo.completed)
            return cell
        }
        
    }
    
    func makeNetworkCall() {
        if let infoItem = infoItem {
            print(infoItem)
        
            if let url = URL(string: "https://jsonplaceholder.typicode.com/todos?userId=\(infoItem.id)") {
           URLSession.shared.dataTask(with: url) { data, response, error in
               
               if let data = data {
                        if let jsonString = String(data: data, encoding: .utf8) {
                           print(jsonString)
                        }
                      }
              if let data = data {
                  do {
                      self.todoArray = try JSONDecoder().decode([ToDoInfo].self, from: data)
                      DispatchQueue.main.async {
                          self.detailListTblview.reloadData()
                         }
                               if let jsonString = String(data: data, encoding: .utf8) {
                                  print(jsonString)
                               }
                  } catch let error {
                     print(error)
                  }
               }
           }.resume()
        
        }
        }
    }
}
