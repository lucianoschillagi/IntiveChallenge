//
//  MediaVC_Master.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 04/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit
import AVFoundation
import AVKit

/* Abstract:

*/

class MediaListViewContoller: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	/// Categories
	let category = ["Music": "Music", "TV Show": "TV Show", "Movie": "Movie"]
	
	///  Search
	let searchController = UISearchController(searchResultsController: nil)
	var searchTextFinal = String()
	
	/// Media
	var media: iTunesMedia?
	var filteredMediaArray = [iTunesMedia]()
	var selectedMedia: iTunesMedia?
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet var mediaTableView: UITableView!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************

	override func viewDidLoad() {
		setNavigation()
		configureSearchAndScopeBar()
		activityIndicator.isHidden = true
	}
	
	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************

	func setNavigation() {
		self.navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.title = "Music"
	}
	
	// task: configurar la barra de búsqueda y la barra de alcance (search & scope bar)
	func configureSearchAndScopeBar() {
		
		self.view.backgroundColor = .yellow
		
		// MARK: Configurando el 'Search Controller'
		// conforma el search controller con el protocolo 'UISearchResultsUpdating'
		searchController.searchResultsUpdater = self
		// oscurecer el fondo cuando se presentan los resultados
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
	
	//*****************************************************************
	// MARK: - Activity Indicator
	//*****************************************************************
	
	func startActivityIndicator() {
		activityIndicator.isHidden = false
		activityIndicator.alpha = 1.0
		activityIndicator.startAnimating()
	}
	
	func stopActivityIndicator() {
		activityIndicator.isHidden = true
		activityIndicator.alpha = 0.0
		self.activityIndicator.stopAnimating()
	}
	
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
			let OKAction = UIAlertAction(title: "OK", style: .default) { action in }
			alertController.addAction(OKAction)
			self.present(alertController, animated: true) {}
		}
	}
	
	//*****************************************************************
	// MARK: - Segue -> Trailer or Song
	//*****************************************************************
	
	// task: ---
	func showTrailer() {
		guard let videoString = selectedMedia?.trailerPelicula else { return }
		guard let videoURL = URL(string: videoString) else { return }
		let player = AVPlayer(url: videoURL)
		let playerViewController = AVPlayerViewController()
		playerViewController.player = player
		// presentar el vc siguiente 🔜
		self.present(playerViewController, animated: true) {
			playerViewController.player?.play()
		}
	}
	
	
	// task: reproducir la canción seleccionada
	func playSong() {
		guard let songString = selectedMedia?.reproducirCancion else { return }
		guard let songUrl = URL(string: songString) else { return }
		let player = AVPlayer(url: songUrl)
		let playerViewController = AVPlayerViewController()
		playerViewController.player = player
		// presentar el vc siguiente 🔜
		self.present(playerViewController, animated: true) {
			playerViewController.player?.play()
		}
	
	}
	

} // end class



