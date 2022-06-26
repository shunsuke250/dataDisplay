//
//  ViewController.swift
//  dataDisplay
//
//  Created by 副山俊輔 on 2022/06/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var testData: [String] = ["a", "b", "c", "d"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cellID")
    }
    
}


//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as? CustomCell {
            cell.dataLabel?.text = testData[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    
}


//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}
