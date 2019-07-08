//
//  ViewController.swift
//  Business Card
//
//  Created by Andrian on 7/7/19.
//  Copyright © 2019 Andrian Nebeso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let livesIn = tableView.dequeueReusableCell(withIdentifier: "profileInfoCell", for: indexPath)
        return livesIn
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    let imageUrl = URL(string: "https://i.pinimg.com/originals/43/f9/07/43f90790a622f7af320e254686f6243f.jpg")
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.load(url: imageUrl!)
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
