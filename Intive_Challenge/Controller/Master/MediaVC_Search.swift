//
//  MediaVC_Search.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 05/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

//*****************************************************************
// MARK: - Search Methods
//*****************************************************************

extension MediaListViewContoller:  UISearchResultsUpdating, UISearchBarDelegate  {
	
	func updateSearchResults(for searchController: UISearchController) {}
	
	// task: decirle al delegado que el index del botón de ´scope´ cambió
	func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
		
		// MARK: update navigation title item
		switch selectedScope {
			
		case 0:
			self.navigationItem.title = "Music"
			self.view.backgroundColor = .yellow
			
		case 1:
			self.navigationItem.title = "TV Show"
			self.view.backgroundColor = .orange

		case 2:
			self.navigationItem.title = "Movie"
			self.view.backgroundColor = .cyan
			
		default:
			print("")
		}
	}
	
	// task: le dice al controlador que el usuario cambió el texto de la barra de búsqueda
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		
		debugPrint("El texto ingresado en le barra de búsqueda es: \(searchText)")
		
		switch navigationItem.title {
			
		// si el título de la barra de navegación es "Explore", contar ´filteredMoviesArray´
		case category["Music"]:
			debugPrint("el scope está en: music")
			// almancena el texto de búsqueda actual en la propiedad ´searchTextFinal´
			searchTextFinal = searchText
	
			
		// si el título de la barra de navegación es "Popular Movies", contar ´popularMoviesArray´
		case category["TV Show"]:
			debugPrint("el scope está en: tv show")
			// almancena el texto de búsqueda actual en la propiedad ´searchTextFinal´
			searchTextFinal = searchText

		// si el título de la barra de navegación es "Top Rated Movies", contar ´topRatedMoviesArray´
		case category["Movie"]:
			debugPrint("el scope está en: movie")
			// almancena el texto de búsqueda actual en la propiedad ´searchTextFinal´
			searchTextFinal = searchText
			
		default:
			print("")
		}
	}
	
	// task: captura el 'search text' a enviar en la solicitud web cuando el usuario tapea el botón ´search´
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		
		startActivityIndicator()
		self.view.backgroundColor = .red
		
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
