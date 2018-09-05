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
	
	
	var musicArray = [iTunesMusic]()
	var music: iTunesMusic?
	//var movie: TMDbMovie?
	
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
		
		// navigation item
		self.navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.title = "Media"
		
		// delegación
		configureSearchAndScopeBar()
		mediaTableView.dataSource = self
		mediaTableView.delegate = self

		getMusic()
	
	}
	
	
	//*****************************************************************
	// MARK: - Networking
	//*****************************************************************
	func getMusic() {
		// networking ⬇ : Popular Movies
		iTunesApiClient.getMusic { (success, music, error) in
			
			DispatchQueue.main.async {
				
				if success {
					// comprueba si el 'popularMovies' recibido contiene algún valor
					if let music = music {
						// si es así, se lo asigna a la propiedad ´popularMovies´
						self.musicArray = music // 🔌 👏
						//self.stopActivityIndicator()
						self.mediaTableView.reloadData()
					}
				} else {
					// si devuelve un error
					//self.displayAlertView("Error Request", error)
				}
			}
		}
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
		let categories = ["Music", "TV Show", "Movie"]
		searchController.searchBar.scopeButtonTitles = categories
	}
	
	// MARK: Status Bar
	override var prefersStatusBarHidden: Bool { return true }




	//*****************************************************************
	// MARK: - Search Bar
	//*****************************************************************
	
// task: decirle al delegado que el index del botón de ´scope´ cambió
func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
	
	// test
	debugPrint("decirle al controller que el índice del botón de ´scope´ cambió")
	debugPrint("😠 el scope seleccionado es el: \(selectedScope)")
	
	// MARK: update navigation title item
	switch selectedScope {
		
	case 0:
		self.navigationItem.title = "Music"
		debugPrint("la scope de Music actualmente")
		
	case 1:
		self.navigationItem.title = "TV Show"
		debugPrint("la scope de TV Shows actualmente")
		//getPopularMovies()
	case 2:
		self.navigationItem.title = "Movie"
		debugPrint("la scope de Movie actualmente")
		//getTopRatedMovies()
		
	default:
		print("")
	}
}

}

//*****************************************************************
// MARK: - Table View Data Source Methods
//*****************************************************************

	extension MediaListViewContoller: UITableViewDataSource {
	
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		debugPrint(musicArray.count)
		return musicArray.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	
		let cellReuseId = "cell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
		music = musicArray[(indexPath as NSIndexPath).row]
		cell.textLabel?.text = music?.tituloCancion
		cell.detailTextLabel?.text = music?.nombreArtista
		
		// poster path (image)
		if let artworkPath = music?.imagenDelDisco {
			let _ = iTunesApiClient.getArtworkImage { (imageData, error) in
				
				if let image = UIImage(data: imageData!) {
					DispatchQueue.main.async {
						cell.imageView!.image = image
						debugPrint("👈\(image)")
					}
				} else {
					print(error ?? "empty error")
				}
			}
		}
		
		// devuelve la celda ya configurada
		return cell
		
		}
	
	}

//// poster path (image)
//if let posterPath = movie?.posterPath {
//	let _ = TMDbClient.getPosterImage(TMDbClient.ParameterValues.posterSizes[0], filePath: posterPath , { (imageData, error) in
//		if let image = UIImage(data: imageData!) {
//			DispatchQueue.main.async {
//				cell.imageView!.image = image
//				debugPrint("👈\(image)")
//			}
//		} else {
//			print(error ?? "empty error")
//		}
//	})
//}
//
//// devuelve la celda ya configurada
//return cell
//
//}



//*****************************************************************
// MARK: - Table View Delegate Methods
//*****************************************************************

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

//*****************************************************************
// MARK: - Search Methods
//*****************************************************************

extension MediaListViewContoller:  UISearchResultsUpdating, UISearchBarDelegate  {

	
	
	func updateSearchResults(for searchController: UISearchController) {
		
	
	}
	
}
