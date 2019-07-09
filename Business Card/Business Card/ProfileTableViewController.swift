//
//  ProfileTableViewController.swift
//  Business Card
//
//  Created by Magnise-2 on 7/8/19.
//  Copyright © 2019 Andrian Nebeso. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    @IBOutlet weak var LivesInLabel: UILabel!
    @IBOutlet weak var BornOnLabel: UILabel!
    @IBOutlet weak var FromLabel: UILabel!
    @IBOutlet weak var StudiedAtLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    var profileUser = User(currentLocation: "Magnise", birthdayDate: "February 7, 1999", originalLocation: "Ternopil", phoneNumber: "+380961234567", userBiography: "Some body once told me the world is gonna roll me ...", studiedAt: "Home")
    let imageUrl = URL(string: "https://i.pinimg.com/originals/43/f9/07/43f90790a622f7af320e254686f6243f.jpg")
    override func viewDidLoad() {
        
        super.viewDidLoad()
        profileImageView.load(url: imageUrl!)
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        displayInfoOnTable(userInfo: profileUser)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editProfile" {
            let nextScene =  segue.destination as! EditProfileTableViewController
            
            // Pass the selected object to the new view controller.
            nextScene.editableUserProfile = profileUser
        }
    }
    func displayInfoOnTable(userInfo: User){
        LivesInLabel.text = "Lives in "+userInfo.currentLocation
        BornOnLabel.text = "Born on "+userInfo.birthdayDate
        FromLabel.text = "From "+userInfo.originalLocation
        StudiedAtLabel.text = "Studied at "+userInfo.studiedAt
        phoneNumberLabel.text = userInfo.phoneNumber
        biographyLabel.text = userInfo.userBiography
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
