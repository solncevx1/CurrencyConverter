//
//  ValuteNameTableViewController.swift
//  ValuteConverter
//
//  Created by Максим Солнцев on 8/15/20.
//  Copyright © 2020 Максим Солнцев. All rights reserved.
//

import UIKit

class ValuteNameTableViewController: UITableViewController {
    
    var valuteValue: ValuteResponse?
    var nameArray: [String] = []
    var nominalArray: [Int] = []
    var valueArray: [Double] = []
    var charCodeArray: [String] = []
    var network = Networking()
    var charr: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.network.loadData { currencyData in
            
            DispatchQueue.main.async {
                
                self.valuteValue = currencyData
                
                for (_, valuteName) in self.valuteValue!.Valute {
                    
                    self.nameArray.append(valuteName.Name)
                    self.charCodeArray.append(valuteName.CharCode)
                    self.valueArray.append(valuteName.Value)
                    self.nominalArray.append(valuteName.Nominal)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Выберите Валюту"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let value = nameArray[indexPath.row]
        cell.textLabel?.text = value
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToConverte"  {
            
            let vc = segue.destination as! ViewController
            vc.dataName = charCodeArray[tableView.indexPathForSelectedRow!.row]
            vc.dataValue = valueArray[tableView.indexPathForSelectedRow!.row]
            vc.dataNominal = nominalArray[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}



