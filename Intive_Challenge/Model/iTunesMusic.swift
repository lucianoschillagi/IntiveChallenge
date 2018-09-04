//
//  iTunesMusic.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 04/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Model */

import Foundation

/* Abstract:
Un objeto preparado para recibir los valores necesarios para construir la lógica de la aplicación.
El objeto representa una canción.
*/

struct iTunesMusic {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	let tituloCancion: String? // 'trackName'
	let nombreArtista: String? // 'artistName'
	let imagenDelDisco: String? // 'artworkUrl100'
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	// construye el objeto 'iTunesTVShow' desde un diccionario  👈
	init(dictionary: [String:AnyObject]) {
		tituloCancion = dictionary["'trackName'"] as? String
		nombreArtista = dictionary["artistName"] as? String
		imagenDelDisco = dictionary["artworkUrl100"] as? String
	}
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	// task:
	static func musicFromResults(_ musicResults: [[String:AnyObject]]) -> [iTunesMusic] {
		
		var music = [iTunesMusic]()
		
		// itera a través del array de diccionarios, cada ´iTunesTVShow´ es un diccionario
		for result in musicResults {
			music.append(iTunesMusic(dictionary: result))
		}
		
		return music
	}
	
	
	
} // end class
