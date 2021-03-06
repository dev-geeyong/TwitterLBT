//
//  UserCells.swift
//  TwitterLBT
//
//  Created by dev.geeyong on 2021/03/03.
//
import LBTAComponents
class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else {return}
            nameLabel.text = user.name
            nicknameLabel.text = user.username
            bioTextView.text = user.bioText
            profileImage.image = user.profileImage
        }
    }
    let profileImage: UIImageView = {
       let image = UIImageView()
        image.image = #imageLiteral(resourceName: "a")
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "dev.geeyong"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "@gxxyxxg"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        return label
    }()
    let bioTextView: UITextView = {
        let textview = UITextView()
        textview.text = "iphone, ipad, ios programming community. join us to learn Swift, Objctive-C and build IOS apps!"
        textview.font = UIFont.systemFont(ofSize: 15)
        textview.backgroundColor = .clear
        return textview
    }()
    let followButton: UIButton = {
        
       let button = UIButton()
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(UIImage(systemName: "person.fill.badge.plus"), for: .normal)
        button.tintColor = twitterBlue
        button.layer.cornerRadius = 5
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(twitterBlue, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        return button
    }()
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        separatorLineView.isHidden = false
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(nicknameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImage.topAnchor, left: profileImage.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        nicknameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        bioTextView.anchor(nicknameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        followButton.anchor(topAnchor, left: nil, bottom: bioTextView.topAnchor, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 12, rightConstant: 8, widthConstant: 120, heightConstant: 34)
    }
}
