//
//  ViewController.swift
//  youtube-feed-ios
//
//  Created by Zoran Todorovic on 07/10/2016.
//  Copyright © 2016 Zoran Todorovic. All rights reserved.
//

import UIKit
import PureLayout

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = UIColor.white
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
//        cell.backgroundColor = UIColor.red
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
}

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "taylor")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.image = UIImage(named: "taylor")
        view.layer.cornerRadius = 22
        view.layer.masksToBounds = true
        return view
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift - Blank Space"
        return label
    }()
    
    let subTitleLabel: UITextView = {
        let label = UITextView()
        label.text = "TaylorSwiftVEVO * 1,604,684,607 views * 2 years"
        label.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separator)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        thumbnailImageView.autoSetDimension(.height, toSize: 120)
        thumbnailImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 16)
        thumbnailImageView.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        thumbnailImageView.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        
        separator.autoSetDimension(.height, toSize: 1)
        separator.autoPinEdge(toSuperviewEdge: .left)
        separator.autoPinEdge(toSuperviewEdge: .right)
        separator.autoPinEdge(toSuperviewEdge: .bottom)
        
        userProfileImageView.autoSetDimensions(to: CGSize(width: 44, height: 44))
        userProfileImageView.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        userProfileImageView.autoPinEdge(.top, to: .bottom, of: thumbnailImageView, withOffset: 8)
        
        titleLabel.autoPinEdge(.top, to: .bottom, of: thumbnailImageView, withOffset: 8)
        titleLabel.autoPinEdge(.left, to: .right, of: userProfileImageView, withOffset: 8)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        titleLabel.autoSetDimension(.height, toSize: 18)
        
        subTitleLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 8)
        subTitleLabel.autoPinEdge(.left, to: .right, of: userProfileImageView, withOffset: 4)
        subTitleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        subTitleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

