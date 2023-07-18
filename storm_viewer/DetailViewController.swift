//
//  DetailViewController.swift
//  Storm Viewer2
//
//  Created by Gaurav Sara on 16/07/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    var totalImages: String?
    var imageIndex: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize the title color
                let titleAttributes = [
                    NSAttributedString.Key.foregroundColor: UIColor.orange
                ]
        
        title = "Picture \(imageIndex ?? "0") of \(totalImages ?? "0")"
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }
}
