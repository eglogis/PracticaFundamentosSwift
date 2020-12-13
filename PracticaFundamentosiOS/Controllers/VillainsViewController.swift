//
//  VillainsViewController.swift
//  PracticaFundamentosiOS
//
//  Created by Samuel Bautista Sánchez on 10/12/20.
//

import UIKit

class VillainsViewController: UIViewController {
    
    // MARK: - IBOutlets vista
    @IBOutlet var villainList: UITableView?
    
    
    // MARK: - Propiedades privadas
    private let VILLAIN_CELL_VIEW_NAME = "VillainCellView"
    private let villainRepository = VillainRepository()
    private var villains: Characters = []
    var villainsCount: Int {
        return villains.count
    }
    
    // MARK: - Metodos del Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVillainData()
        villainList?.dataSource = self
        villainList?.delegate = self
    }
    
    // MARK: - Private functions
    private func loadVillainData() {
        villains = villainRepository.villains
    }
}

// MARK: - Extension
extension VillainsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return villainsCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 248.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let villainCell = tableView.dequeueReusableCell(withIdentifier: VILLAIN_CELL_VIEW_NAME, for: indexPath) as? VillainCellView
        
        if(indexPath.row < villainsCount) {
            villainCell?.configureViews(villain: villains[indexPath.row])
        }
        return villainCell ?? UITableViewCell()
    }
}
