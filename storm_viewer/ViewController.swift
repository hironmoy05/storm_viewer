//
//  ViewController.swift
//  Storm Viewer2
//
//  Created by Gaurav Sara on 16/07/23.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        let sortedPictures = pictures.sorted()
        cell.textLabel?.text = sortedPictures[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let selectedRowIndex = indexPath.row
            vc.selectedImage = pictures[selectedRowIndex]
            vc.totalImages = String(pictures.count)
            vc.imageIndex = String(selectedRowIndex)
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

