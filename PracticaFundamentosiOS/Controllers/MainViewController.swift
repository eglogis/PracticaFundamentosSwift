//
//  ViewController.swift
//  PracticaFundamentosiOS
//
//  Created by Samuel Bautista Sánchez on 8/12/20.
//

import UIKit
import Lottie

class MainViewController: UIViewController {
    
    // MARK: - Atributos
    private var animationView: AnimationView?
    
    
    // MARK: - Metodos del Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        createLoadingAnimation()
        playLoadingAnimation()
        navigateToHomeView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Metodos privados
    private func navigateToHomeView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) { [weak self] in
            self?.animationView?.isHidden = true
            self?.animationView?.stop()
            let homeStoryBoard = UIStoryboard(name: "Home", bundle: nil)
            if let destination = homeStoryBoard.instantiateInitialViewController() {
                self?.navigationController?.setViewControllers([destination], animated: true)
            }
        }
    }
    
    private func createLoadingAnimation() {
        animationView = .init(name: "loading")
        view.addSubview(animationView!)
        animationView?.translatesAutoresizingMaskIntoConstraints = false
        animationView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animationView?.widthAnchor.constraint(equalToConstant: 50).isActive = true
        animationView?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        animationView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    private func playLoadingAnimation() {
        animationView?.loopMode = .loop
        animationView?.play()
    }
}

