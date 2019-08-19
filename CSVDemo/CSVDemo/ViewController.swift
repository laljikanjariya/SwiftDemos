//
//  ViewController.swift
//  CSVDemo
//
//  Created by Lalji on 07/08/18.
//  Copyright © 2018 Lalji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var allData:[[String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var data = readDataFromCSV(fileName: "google", fileType: "csv")
        data = cleanRows(file: data!)
        allData = csv(data: data!)
        allData?.remove(at: 0)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for row:[String] in allData! {
            let name:String = row[0]
            let path:String = row[27]
            
            if path.count > 0 {
                let imageURL:URL = URL(string: path)!

                let localPath = NSHomeDirectory()+"/Images/"+name+"."+imageURL.pathExtension
                if !FileManager.default.fileExists(atPath: localPath){
                    var imageData:Data!
                    do {
                        try imageData = Data.init(contentsOf: imageURL)
                    } catch {
                        print("File Read Error for file \(path)")
                    }
                    do {
                        try imageData.write(to: URL(fileURLWithPath: localPath))
                        print(name+" image downloaded")
                    } catch {
                        print("File Write Error for file \(path)")
                    }
                }
            }
//            if FileManager.default.fileExists(atPath: <#T##String#>)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func csv(data: String) -> [[String]] {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ",")
            result.append(columns)
        }
        return result
    }
    func readDataFromCSV(fileName:String, fileType: String)-> String!{
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
            else {
                return nil
        }
        do {
            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
            contents = cleanRows(file: contents)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
    
    
    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";;", with: "")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";\n", with: "")
        return cleanFile
    }
}

