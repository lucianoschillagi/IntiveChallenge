//
//  MediaVC_Networking.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 05/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

extension MediaListViewContoller {
	
	//*****************************************************************
	// MARK: - Networking
	//*****************************************************************
	
	// MARK: Get Search Text Movies
	func getSearchTextMedia(_ media: String, _ term: String) {
		
		// networking ⬇ : Media Content
		iTunesApiClient.getMediaForTermAndMediaString(media, term) { (success, resultMedia, error) in
			
			DispatchQueue.main.async {
				
				if success {
					// comprueba si el 'resultMedia' recibido contiene algún valor
					if let resultMedia = resultMedia {
						// si es así, se lo asigna a la propiedad ´resultMedia´
						if resultMedia.count == 0 {
							self.displayAlertView(title: "No se encontró ningún contenido", message: "Por favor pruebe con otras palabras de búsqueda")
						}
						
						self.filteredMediaArray = resultMedia // 🔌 👏
						self.stopActivityIndicator()
						self.mediaTableView.reloadData()
					}
					
				} else {
					// si devuelve un error
					self.displayAlertView(title: "Error Request", message: error)
				}
			}
		}
	}
	
}
