//
//  TableViewCell.swift
//  AlamofireHW
//
//  Created by Виталий Таран on 07.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: "cell")
    }

    func configureWith(_ comic: Comic, image: UIImage?) {
        var content = self.defaultContentConfiguration()
        content.text = "\(comic.title)"
        content.image = image
        self.accessoryType = .disclosureIndicator
        self.contentConfiguration = content
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
