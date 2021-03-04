//
//  TweetCell.swift
//  TwitterLBT
//
//  Created by dev.geeyong on 2021/03/04.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    override var datasourceItem: Any? {
        didSet{
            guard let tweet = datasourceItem as? Tweet else {
                return
            }
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 16)])
            let usernameString = "  \(tweet.user.username)\n"
            attributedText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15),NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]))
            messageTextView.attributedText = attributedText
        }
    }
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "SOME SAMPLE TEXT"
        tv.backgroundColor = .clear
        return tv
    }()
    let profileImage: UIImageView = {
       let image = UIImageView()
        image.image = #imageLiteral(resourceName: "a")
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    let DMButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        
        
        backgroundColor = .white
        addSubview(profileImage)
        addSubview(messageTextView)
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageTextView.anchor(self.topAnchor, left: profileImage.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        setupBottomButtons()
    }
    private func setupBottomButtons(){
        let backview = UIView()
        let backview2 = UIView()
        let backview3 = UIView()
        let backview4 = UIView()
        let stackView = UIStackView(arrangedSubviews: [backview,backview2,backview3,backview4])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(nil, left: messageTextView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(DMButton)
        replyButton.anchor(backview.topAnchor, left: backview.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        retweetButton.anchor(backview2.topAnchor, left: backview2.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        likeButton.anchor(backview3.topAnchor, left: backview3.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        DMButton.anchor(backview4.topAnchor, left: backview4.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        
    }
}
