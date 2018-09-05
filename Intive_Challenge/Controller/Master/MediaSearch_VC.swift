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
	
	
	
	func updateSearchResults(for searchController: UISearchController) {
		
		
	}
	
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
			getMusic()
			
		case 1:
			self.navigationItem.title = "TV Show"
			debugPrint("la scope de TV Shows actualmente")
			getTVShows()
		case 2:
			self.navigationItem.title = "Movie"
			debugPrint("la scope de Movie actualmente")
			getMovies()
			
		default:
			print("")
		}
	}
	
}
