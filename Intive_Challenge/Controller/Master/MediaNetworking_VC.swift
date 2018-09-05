//
//  MediaNetworking_VC.swift
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
	
	func getTVShows() {
		// networking ⬇ : TV Shows (async)
		iTunesApiClient.getTVShows { (success, tvShow, error) in
			
			DispatchQueue.main.async {
				
				if success {
					// comprueba si el 'popularMovies' recibido contiene algún valor
					if let tvShow = tvShow {
						// si es así, se lo asigna a la propiedad ´popularMovies´
						self.tvShowArray = tvShow  // 🔌 👏
						//self.stopActivityIndicator()
						self.mediaTableView.reloadData()
					}
				} else {
					// si devuelve un error
					self.displayAlertView("Error Request", error)
				}
			}
		}
	}
	
	
	
	func getMusic() {
		// networking ⬇ : Music (async)
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
					self.displayAlertView("Error Request", error)
				}
			}
		}
	}
	
	func getMovies() {
		// networking ⬇ : Movies (async)
		iTunesApiClient.getMovies { (success, movies, error) in
			
			DispatchQueue.main.async {
				
				if success {
					// comprueba si el 'popularMovies' recibido contiene algún valor
					if let movies = movies {
						// si es así, se lo asigna a la propiedad ´popularMovies´
						self.movieArray = movies // 🔌 👏
						//self.stopActivityIndicator()
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
