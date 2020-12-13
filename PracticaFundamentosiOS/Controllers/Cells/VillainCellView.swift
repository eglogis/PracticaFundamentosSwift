//
//  VillainCellView.swift
//  PracticaFundamentosiOS
//
//  Created by Samuel Bautista Sánchez on 13/12/20.
//

import UIKit

class VillainCellView: UITableViewCell {
    
    @IBOutlet var villainImage: UIImageView?
    @IBOutlet var villainName: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        villainImage?.image = nil
        villainName?.text = nil
    }
    
    func configureViews(villain: Character) {
        villainImage?.image = UIImage(named: villain.image ?? "")
        villainName?.text = villain.name
    }
}
