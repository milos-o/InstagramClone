//
//  ProfileTabsCollectionReusableView.swift
//  Instagram
//
//  Created by Amplitudo on 17.8.21..
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject {
    func didTapGridTabButton()
    func didTapTaggedTabButton()
}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"
    
    public weak var delegate: ProfileTabsCollectionReusableViewDelegate?
    
    
    private let gridButton: UIButton = {
       let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemBlue
        button.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        return button
    }()
    
    private let taggedButton: UIButton = {
       let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .lightGray
        button.setBackgroundImage(UIImage(systemName: "tag"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(gridButton)
        addSubview(taggedButton)
        
        gridButton.addTarget(self, action: #selector(didTapGridTabButton), for: .touchUpInside)
        taggedButton.addTarget(self, action: #selector(didTapTaggedTabButton), for: .touchUpInside)
    }
    
    @objc private func didTapGridTabButton(){
        gridButton.tintColor = .systemBlue
        taggedButton.tintColor = .lightGray
        delegate?.didTapGridTabButton()
    }
    
    @objc private func didTapTaggedTabButton(){
        taggedButton.tintColor = .systemBlue
        gridButton.tintColor = .lightGray
        delegate?.didTapTaggedTabButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = height-16
        let halfWidth = ((width/2)-size)/2
        gridButton.frame = CGRect(x: halfWidth, y: 2, width: size, height: size)
        taggedButton.frame = CGRect(x: halfWidth + (width/2), y: 2, width: size, height: size)

    }
}
