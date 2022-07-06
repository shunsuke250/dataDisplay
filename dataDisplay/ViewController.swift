//
//  ViewController.swift
//  dataDisplay
//
//  Created by 副山俊輔 on 2022/06/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var fileData: [[String]] = []
    // ダウンロードしたcsvファイルを保存する変数
    var csvString = ""
    
    let pathURL = NSURL(string: "https://ckan.open-governmentdata.org/dataset/fe943202-2db4-44f8-9686-9cf682690bb7/resource/4470951b-5559-4778-9d02-33e66bbcc06f/download/400009_pref_fukuoka_covid19_kensa-youseisya.csv")
    
    
    var lineIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cellID")
        
        do {
            csvString = try NSString(contentsOf: pathURL! as URL, encoding: String.Encoding.utf8.rawValue) as String
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        csvString.enumerateLines { (line, stop) -> () in
            self.fileData.append(line.components(separatedBy: ","))
            print("\(self.lineIndex) : \(line)")
            self.lineIndex += 1
            if self.lineIndex == self.fileData.count {
                stop = true
            }
            //            print(self.csvString)
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
