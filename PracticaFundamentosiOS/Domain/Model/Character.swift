//
//  Personaje.swift
//  PracticaFundamentosiOS
//
//  Created by Samuel Bautista Sánchez on 12/12/20.
//

import Foundation

typealias Characters = [Character]

struct Character {
    var image: String? = nil
    var name: String = ""
    var realName: String = ""
    var longDescription: String = ""
    var shortDescription: String = ""
    var power: Float = 0.0
}
