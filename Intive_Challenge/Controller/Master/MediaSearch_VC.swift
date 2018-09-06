//
//  MediaSearch_VC.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 05/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

//*****************************************************************
// MARK: - Search Methods
//*****************************************************************

extension MediaListViewContoller:  UISearchResultsUpdating, UISearchBarDelegate  {
	
	// task: actualizar los resultados según la búsqueda actual
	func updateSearchResults(for searchController: UISearchController) {}
	
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

		case 2:
			self.navigationItem.title = "Movie"
			debugPrint("la scope de Movie actualmente")
			
		default:
			print("")
		}
	}
	
	// task: comprobar si la barra de búsqueda está vacía o no
	func searchBarIsEmpty() -> Bool {
		// Returns true if the text is empty or nil
		debugPrint("LA BARRA DE BÚSQUEDA TIENE TEXTO")
		return searchController.searchBar.text?.isEmpty ?? true
	}
	
	// task: le dice al controlador que el usuario cambió el texto de la barra de búsqueda
	// cada vez que el texto de búsqueda cambia se cancela la descarga actual y empieza una nueva 👈
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		
		debugPrint("El texto ingresado en le barra de búsqueda es: \(searchText)")
		
		switch navigationItem.title {
			
		// si el título de la barra de navegación es "Explore", contar ´filteredMoviesArray´
		case category["Music"]:
			debugPrint("el scope está en: music")
			// almancena el texto de búsqueda actual en la propiedad ´searchTextFinal´
			searchTextFinal = searchText
			//getSearchTextMedia("music", searchText)
	
			
		// si el título de la barra de navegación es "Popular Movies", contar ´popularMoviesArray´
		case category["TV Show"]:
			debugPrint("el scope está en: tv show")
			// almancena el texto de búsqueda actual en la propiedad ´searchTextFinal´
			searchTextFinal = searchText
			//getSearchTextMedia("tvShow", searchText)
			
		// si el título de la barra de navegación es "Top Rated Movies", contar ´topRatedMoviesArray´
		case category["Movie"]:
			debugPrint("el scope está en: movie")
			// almancena el texto de búsqueda actual en la propiedad ´searchTextFinal´
			searchTextFinal = searchText
			//getSearchTextMedia("movie", searchText)
			
		default:
			print("")
		}


	}
	
	
	// task: captura el 'search text' a enviar en la solicitud web cuando el usuario tapea el botón ´search´
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		
		var actualMedia = String()
		
		switch searchBar.selectedScopeButtonIndex {
		case 0:
			actualMedia = "music"
		case 1:
			actualMedia = "tvShow"
		case 2:
			actualMedia = "movie"
		default:
			actualMedia = ""
		}
		getSearchTextMedia(actualMedia, searchTextFinal)
	}
	

	
	
} // end ext
