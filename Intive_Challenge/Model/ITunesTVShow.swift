//
//  iTunesTVShow
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 04/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Model */

import Foundation

/* Abstract:
Un objeto preparado para recibir los valores necesarios para construir la lógica de la aplicación.
El objeto representa una serie de TV.
*/

struct iTunesTVShow {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	let tituloDelPrograma: String? // 'artistName'
	let nombreDelEpisodio: String? // 'trackName'
	let imagenDelPrograma: String? // 'artworkUrl100'
	let descripcionEpisodio: String? // 'longDescription'

	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
		// construye el objeto 'iTunesTVShow' desde un diccionario  👈
		init(dictionary: [String:AnyObject]) {
			tituloDelPrograma = dictionary["artistName"] as? String
			nombreDelEpisodio = dictionary["trackName"] as? String
			imagenDelPrograma = dictionary["artworkUrl100"] as? String
			descripcionEpisodio = dictionary["longDescription"] as? String
		}
	
		//*****************************************************************
		// MARK: - Methods
		//*****************************************************************
	
		// task:
		static func tvShowsFromResults(_ tvResults: [[String:AnyObject]]) -> [iTunesTVShow] {
	
			var tvShows = [iTunesTVShow]()
	
			// itera a través del array de diccionarios, cada ´iTunesTVShow´ es un diccionario
			for result in tvResults {
				tvShows.append(iTunesTVShow(dictionary: result))
			}
	
			return tvShows
		}
	
	
	
} // end class

