//
//  ViewController.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 04/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:

*/

class MediaListViewContoller: UIViewController {
	

	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	var mediaArray = [iTunesMedia]()
	var media: iTunesMedia?

	
	// MARK: Search Controller 🔎
	let searchController = UISearchController(searchResultsController: nil)
	
	var filteredMediaArray = [iTunesMedia]() 
	
	// search text
	var searchTextFinal = String()

	
	// MARK: Las categorías disponibles
	let category = ["Music": "Music", "TV Show": "TV Show", "Movie": "Movie"]
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet var mediaTableView: UITableView!
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************

	override func viewDidLoad() {
		
		// navigation item
		self.navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.title = "Music"

		
		// delegación
		configureSearchAndScopeBar()

		//getMusic()
	
	}
	
	
	//*****************************************************************
	// MARK: - Configure UI Elements
	//*****************************************************************
	
	
	// task: configurar la barra de búsqueda y la barra de alcance (search & scope bar)
	func configureSearchAndScopeBar() {
		
		// MARK: Configurando el 'Search Controller'
		// conforma el search controller con el protocolo 'UISearchResultsUpdating'
		searchController.searchResultsUpdater = self
		// no oscurecer el fondo cuando se presentan los resultados
		searchController.obscuresBackgroundDuringPresentation = false
		
		
		// agrega la barra de búsqueda dentro de la barra de navegación
		navigationItem.searchController = searchController
		// para que no permanezca la barra de búsqueda si el usuario navega hacia otro vc
		definesPresentationContext = true
		
		// MARK: Configurando el 'Scope Bar'
		searchController.searchBar.delegate = self
		let categories = ["Music", "TV Show", "Movie"]
		searchController.searchBar.scopeButtonTitles = categories
	}
	
	// MARK: Status Bar
	//override var prefersStatusBarHidden: Bool { return true }
	
	//*****************************************************************
	// MARK: - Alert View
	//*****************************************************************
	
	/**
	Muestra al usuario un mensaje acerca de porqué la solicitud falló.
	
	- Parameter title: El título del error.
	- Parameter message: El mensaje acerca del error.
	
	*/
	func displayAlertView(_ title: String?, _ error: String?) {
		
		// si ocurre un error en la solicitud, mostrar una vista de alerta!
		if error != nil {
			
			let alertController = UIAlertController(title: title, message: error, preferredStyle: .alert)
			
			let OKAction = UIAlertAction(title: "OK", style: .default) { action in
				
			}
			
			alertController.addAction(OKAction)
			self.present(alertController, animated: true) {}
		}
	}
	

} // end class



