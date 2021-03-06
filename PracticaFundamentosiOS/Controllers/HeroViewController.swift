//
//  HeroViewController.swift
//  PracticaFundamentosiOS
//
//  Created by Samuel Bautista Sánchez on 10/12/20.
//

import UIKit

class HeroViewController: UIViewController {
    
    // MARK: - IBOutlets vista
    @IBOutlet var heroList: UITableView?
    
    
    // MARK: - Propiedades privadas
    private let HERO_CELL_VIEW_NAME = "HeroCellView"
    private let SEGUE_FROM_HERO_TO_DETAILS = "SEGUE_FROM_HERO_TO_DETAIL"
    private let heroRepository = HeroRepository()
    private var heros: Characters = []
    var herosCount: Int {
        return heros.count
    }
    
    // MARK: - Metodos del Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHeroData()
        heroList?.dataSource = self
        heroList?.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? CharacterDetailsViewController,
              let data = sender as? Character else {
            return
        }
        destination.character = data
    }
    
    // MARK: - Private functions
    private func loadHeroData() {
        heros = heroRepository.heros
    }
}

// MARK: - Extension
extension HeroViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return herosCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 248.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let heroCell = tableView.dequeueReusableCell(withIdentifier: HERO_CELL_VIEW_NAME, for: indexPath) as? HeroCellView
        
        if(indexPath.row < herosCount) {
            heroCell?.configureViews(hero: heros[indexPath.row])
        }
        return heroCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row < herosCount) {
            performSegue(withIdentifier: SEGUE_FROM_HERO_TO_DETAILS, sender: heros[indexPath.row])
        }
    }
}
