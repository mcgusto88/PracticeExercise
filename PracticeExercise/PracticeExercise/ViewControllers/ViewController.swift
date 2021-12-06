//
//  ViewController.swift
//  PracticeExercise
//
//  Created by User on 12/1/21.
//

import UIKit

var infoArray = [PersonalInfo]()
let reuseIdentifier = "cell"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var listTblview: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Count \(infoArray.count)")
        return infoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : personalInfoCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? personalInfoCell else {
            return UITableViewCell()
        }
        let personalInfo = infoArray[indexPath.row]
        cell.phoneLbl.text = personalInfo.phone
        cell.emailLbl.text = personalInfo.email
        cell.nameLbl.text = personalInfo.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "InfoDetailViewController2") as! InfoDetailViewController2
        detailVC.infoItem = infoArray[indexPath.row]
       
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listTblview.delegate = self
        listTblview.dataSource = self
        listTblview.estimatedRowHeight = 100
        makeNetworkCall()
    }
    
    func makeNetworkCall() {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/users") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                      infoArray = try JSONDecoder().decode([PersonalInfo].self, from: data)
                      DispatchQueue.main.async {
                          self.listTblview.reloadData()
                         }
                     print(infoArray)
                  } catch let error {
                     print(error)
                  }
               }
           }.resume()
        }
    }
}

