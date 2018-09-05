//
//  ITunesMovie.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 04/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Model */

import Foundation

/* Abstract:
Un objeto preparado para recibir los valores necesarios para construir la lógica de la aplicación.
El objeto representa una película.
*/

struct iTunesMovie {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	let tituloDePelicula: String? // 'trackName'
	let imagenDePelicula: String? // 'artworkUrl100'
	let descripcionPelicula: String? // 'longDescription'
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	// construye el objeto 'iTunesTVShow' desde un diccionario  👈
	init(dictionary: [String:AnyObject]) {
		tituloDePelicula = dictionary["trackName"] as? String
		descripcionPelicula = dictionary["longDescription"] as? String
		imagenDePelicula = dictionary["artworkUrl100"] as? String
		
	}
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	// task:
	static func moviesFromResults(_ moviesResult: [[String:AnyObject]]) -> [iTunesMovie] {
		
		var movies = [iTunesMovie]()
		
		// itera a través del array de diccionarios, cada ´iTunesMovie´ es un diccionario
		for result in moviesResult {
			movies.append(iTunesMovie(dictionary: result))
		}
		
		return movies
	}
	
	
	
} // end class
