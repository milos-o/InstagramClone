//
//  IGFeedPostTableViewCell.swift
//  Instagram
//
//  Created by Amplitudo on 17.8.21..
//

import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {

    
    static let identifier = "IGFeedPostTableView"
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell(){
        // configure the cell
        
    }
    
}
