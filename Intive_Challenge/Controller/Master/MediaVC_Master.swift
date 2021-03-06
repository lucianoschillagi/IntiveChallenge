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
Una pantalla que permite buscar por distintos tipo de contenido en iTunes: music, tv show y movie.
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
		activityIndicator.alpha = 0.5
		activityIndicator.startAnimating()
		self.view.alpha = 0.7
	}
	
	func stopActivityIndicator() {
		activityIndicator.isHidden = true
		self.activityIndicator.stopAnimating()
		self.view.alpha = 1.0
	}
	
	//*****************************************************************
	// MARK: - Alert View
	//*****************************************************************
	
	// task: mostrar un mensaje al usuario indicándole un error
	func displayAlertView(title: String?, message: String?) {
		
		if message != nil {
			let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
			let OKAction = UIAlertAction(title: "OK", style: .default) { action in }
			alertController.addAction(OKAction)
			self.present(alertController, animated: true) {}
		}
	}
	
	//*****************************************************************
	// MARK: - Segue -> Trailer or Song
	//*****************************************************************
	
	// task: mostrar el trailer seleccionado
	func showTrailer() {
		guard let videoString = selectedMedia?.movieTrailer else { return }
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
		guard let songString = selectedMedia?.songPlay else { return }
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



