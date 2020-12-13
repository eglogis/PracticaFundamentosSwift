//
//  HeroCellView.swift
//  PracticaFundamentosiOS
//
//  Created by Samuel Bautista Sánchez on 13/12/20.
//

import UIKit

class HeroCellView: UITableViewCell {
    
    @IBOutlet var heroImage: UIImageView?
    @IBOutlet var heroName: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        heroImage?.image = nil
        heroName?.text = nil
    }
    
    func configureViews(hero: Character) {
        heroImage?.image = UIImage(named: hero.image ?? "")
        heroName?.text = hero.name
    }
}
