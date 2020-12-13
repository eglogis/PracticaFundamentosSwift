//
//  CharacterDetailsViewController.swift
//  PracticaFundamentosiOS
//
//  Created by Samuel Bautista Sánchez on 13/12/20.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets vista
    @IBOutlet var characterImage: UIImageView?
    @IBOutlet var characterName: UILabel?
    @IBOutlet var characterRealName: UILabel?
    @IBOutlet var characterDescription: UITextView?
    @IBOutlet var powerPercent: UIProgressView?

    
    // MARK: - Atributos
    var character: Character? = nil
    
    
    // MARK: - Metodos del Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = character {
            characterImage?.image = UIImage(named: data.image ?? "")
            characterName?.text = data.heroName
            characterRealName?.text = data.realName
            characterDescription?.text = data.longDescription
            powerPercent?.progress = data.power / 100
            navigationItem.title = data.heroName
        }
    }
}
