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
	
	// MARK: Search Controller 🔎
	let searchController = UISearchController(searchResultsController: nil)
	
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet var mediaTableView: UITableView!
	
	
	
	

	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************

	override func viewDidLoad() {
		
		// delegación
		configureSearchAndScopeBar()
		mediaTableView.dataSource = self
		mediaTableView.delegate = self

		
	
	}
	
	
	//*****************************************************************
	// MARK: - Helpers
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
		let categories = ["Explore", "Popular", "Top Rated", "Upcoming"]
		searchController.searchBar.scopeButtonTitles = categories
	}
	
	// MARK: Status Bar
	override var prefersStatusBarHidden: Bool { return true }
	
	
}
	
	extension MediaListViewContoller: UITableViewDataSource {
	
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	
		let cellReuseId = "cell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
		cell.backgroundColor = .yellow
		
		return cell
	}
	
	}
	
	
	extension MediaListViewContoller: UITableViewDelegate {
	
	// task: navegar hacia el detalle de la película (de acuerdo al listado de películas actual)
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		// test
		debugPrint("la fila \(indexPath) ha sido seleccionada")
		
		let storyboardId = "media detail"
		let controller = storyboard!.instantiateViewController(withIdentifier: storyboardId) as! DetailMediaViewController
		navigationController!.pushViewController(controller, animated: true)
	}
	

}

extension MediaListViewContoller:  UISearchResultsUpdating, UISearchBarDelegate  {

	
	
	func updateSearchResults(for searchController: UISearchController) {
	
	}
	
	
	
	
	
	
	
	
	
	
}
