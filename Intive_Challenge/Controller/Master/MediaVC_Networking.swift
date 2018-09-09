//
//  MediaVC_Networking.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 05/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

extension MediaListViewContoller {
	
	//*****************************************************************
	// MARK: - Networking
	//*****************************************************************
	
	// MARK: Get Search Text Movies
	// task: obtener, mediante una solicitud web a la API de TMDb, el array de películas filtradas por texto
	func getSearchTextMedia(_ media: String, _ term: String) {
		
		// networking ⬇ : Media Content
		iTunesApiClient.getMediaForTermAndMediaString(media, term) { (success, resultMedia, error) in
			
			DispatchQueue.main.async {
				
				if success {
					// comprueba si el 'resultMedia' recibido contiene algún valor
					if let resultMedia = resultMedia {
						// si es así, se lo asigna a la propiedad ´resultMedia´
						debugPrint("🧙🏽‍♀️\(resultMedia)")
						if resultMedia.count == 0 {
							self.displayAlertView("No se encontró ningún contenido", "Por favor pruebe con otras palabras de búsqueda")
						}
						
						self.filteredMediaArray = resultMedia // 🔌 👏
						self.stopActivityIndicator()
						self.mediaTableView.reloadData()
					}
					
				} else {
					// si devuelve un error
					self.displayAlertView("Error Request", error)
				}
			}
		}
	}
	
}
