//
//  DetailMedia_VC.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 04/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

class DetailMediaViewController: UIViewController {
	
	
		override var prefersStatusBarHidden: Bool { return true }
	

    override func viewDidLoad() {
        super.viewDidLoad()

			self.navigationController?.navigationBar.prefersLargeTitles = true
			navigationItem.title = "Media"
			
    }
    

	

}
