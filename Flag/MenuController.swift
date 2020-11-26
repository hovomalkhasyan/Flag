//
//  MenuController.swift
//  Flag
//
//  Created by Hovo on 9/30/20.
//  Copyright © 2020 Hovo. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wall")!)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func gameRulesBtn(_ sender: UIButton) {
        let rulesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RulesController") as? RulesController
        navigationController?.pushViewController(rulesVC!, animated: true)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func playGame(_ sender: UIButton) {
        let gameVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as? ViewController
        UIApplication.shared.windows.first?.rootViewController = gameVC
    }
}
