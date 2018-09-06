//
//  iTunesMedia.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 05/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Model */

import Foundation

/* Abstract:
Un objeto preparado para recibir los valores necesarios para construir la lógica de la aplicación.
El objeto representa un media (puede ser tanto un 'tv show', como una 'película' o una 'música'
*/

struct iTunesMedia {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// tv show
	let tituloDelPrograma: String? // 'artistName'
	let nombreDelEpisodio: String? // 'trackName'
	let imagenDelPrograma: String? // 'artworkUrl100'
	let descripcionEpisodio: String? // 'longDescription'
	// movie
	let tituloDeLaPelicula: String? // 'trackName'
	let descripcionPelicula: String? // 'longDescription'
	let imagenPelicula: String? // 'artworkUrl100'
	// music
	let tituloCancion: String? // 'trackName'
	let nombreArtista: String? // 'artistName'
	let imagenDisco: String? // 'artworkUrl100'
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	// construye el objeto 'iTunesMedia' desde un diccionario  👈
	init(dictionary: [String:AnyObject]) {
		// tv show
		tituloDelPrograma = dictionary["artistName"] as? String
		nombreDelEpisodio = dictionary["trackName"] as? String
		imagenDelPrograma = dictionary["artworkUrl100"] as? String
		descripcionEpisodio = dictionary["longDescription"] as? String
		// movie
		tituloDeLaPelicula = dictionary["trackName"] as? String
		descripcionPelicula = dictionary["longDescription"] as? String
		imagenPelicula = dictionary["artworkUrl100"] as? String
		// music
		tituloCancion = dictionary["trackName"] as? String
		nombreArtista = dictionary["artistName"] as? String
		imagenDisco = dictionary["artworkUrl100"] as? String
	}
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	// task:
	static func mediaFromResults(_ mediaResults: [[String:AnyObject]]) -> [iTunesMedia] {
		
		var mediaArray = [iTunesMedia]()
		
		// itera a través del array de diccionarios, cada ´iTunesMedia´ es un diccionario
		for result in mediaResults {
			mediaArray.append(iTunesMedia(dictionary: result))
		}
		
		return mediaArray
	}
	
	
	
} // end class
