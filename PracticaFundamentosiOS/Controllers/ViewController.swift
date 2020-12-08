//
//  ViewController.swift
//  PracticaFundamentosiOS
//
//  Created by Samuel Bautista Sánchez on 8/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets de las vista
    @IBOutlet var loading: UIActivityIndicatorView?
    
    
    // MARK: - Metodos del Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        loading?.startAnimating()
        navigateToHomeView()
    }
    
    // MARK: - Metodos privados
    private func navigateToHomeView() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            self?.loading?.stopAnimating()
        }
    }
}

