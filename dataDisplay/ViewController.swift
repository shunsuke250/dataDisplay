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
    
    var fileData: [[String]] = []
    // ダウンロードしたcsvファイルを保存する変数
    var csvString = ""
    
    let pathURL = NSURL(string: "https://ckan.open-governmentdata.org/dataset/44e3a1d9-e1fa-4ed8-ba6e-114b716d3b38/resource/0b925907-32be-4e64-a1f6-56e6f6381810/download/fukuoka_2020buhinnerai.csv")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cellID")
        
        do {
            csvString = try NSString(contentsOf: pathURL! as URL, encoding: String.Encoding.shiftJIS.rawValue) as String
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        csvString.enumerateLines { (line, stop) -> () in
            self.fileData.append(line.components(separatedBy: ","))
            print(self.csvString)
        }
    }
}


//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as? CustomCell {
            cell.dataLabel?.text = fileData[indexPath.row].description
            return cell
        }
        return UITableViewCell()
    }
    
    
}


//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}
