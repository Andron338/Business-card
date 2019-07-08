//
//  ViewController.swift
//  Business Card
//
//  Created by Andrian on 7/7/19.
//  Copyright © 2019 Andrian Nebeso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    let imageUrl = URL(string: "https://i.pinimg.com/originals/43/f9/07/43f90790a622f7af320e254686f6243f.jpg")
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.load(url: imageUrl!)
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
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
