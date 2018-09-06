//
//  iTunesClient.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 04/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Networking */

import Foundation
import Alamofire

/* Abstract:
Esta clase agrupa los métodos necesarios para solicitar los datos a la API de TMDb que conformarán el Modelo.
*/

class iTunesApiClient: NSObject {
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	override init() {
		super.init()
	}
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// shared session
	var session = URLSession.shared
	
	//*****************************************************************
	// MARK: - Networking Methods
	//*****************************************************************
	
//	// MARK: Get Music
//	// task: obtener las películas máspopulares de TMDb
//	static func getMusicRequest(_ term: String, _ completionHandlerForMusic: @escaping ( _ success: Bool, _ music: [iTunesMedia]?, _ errorString: String?) -> Void) {
//		
//		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
//		Alamofire.request(configureUrlSearchText(term, <#String?#>)).responseJSON { response in
//			
//			// response status code
//			if let status = response.response?.statusCode {
//				switch(status){
//				case 200:
//					print("example success")
//				default:
//					let errorMessage = "error with response status: \(status)"
//					completionHandlerForMusic(false, nil, errorMessage)
//				}
//			}
//			
//			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'jsonObjectResult' 📦 */
//			if let jsonObjectResult: Any = response.result.value {
//				
//				let jsonObjectResultDictionary = jsonObjectResult as! [String:AnyObject]
//				
//				debugPrint("🤜JSON MUSIC: \(jsonObjectResult)") // JSON obtenido
//				
//				if let results = jsonObjectResultDictionary["results"] {
//					
//					let resultsMusic = iTunesMedia.mediaFromResults(results as! [[String : AnyObject]])
//					//debugPrint("total de páginas: \(totalPages)")
//					
//					//test
//					debugPrint("🤾🏼‍♂️ las 'music' recibidos son...\(resultsMusic)")
//					
//					// MARK: extrayendo valores de la respuesta
//					for item in resultsMusic {
//						
//						/* valores extraidos:
//						'trackName' -> 'tituloCancion'
//						'artistName' -> 'nombreArtista'
//						'artworkUrl100' -> 'imagenDelDisco' */
//						
//						debugPrint("😈 music, TITULO CANCIÓN: \(item.tituloCancion!)", terminator: "\n ")
//						debugPrint("😈 music, NOMBRE ARTISTA: \(item.nombreArtista!)", terminator: "\n ")
//						debugPrint("😈 music, IMAGEN DISCO: \(item.imagenDisco)", terminator: " \n ")
//
//					}
//					completionHandlerForMusic(true, resultsMusic, nil)
//				}
//			}
//		}
//}
	
	// MARK: Get TV Shows
	// task: obtener TV Shows, de acuerdo al término ingresado
	static func getTVShows(_ term: String, _ media: String, _ completionHandlerForTVShows: @escaping ( _ success: Bool, _ tvShows: [iTunesMedia]?, _ errorString: String?) -> Void) {
		
		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
		Alamofire.request("https://itunes.apple.com/search?term=the+simpsons&media=tvShow").responseJSON { response in
			
			debugPrint("tv shows JSON response: \(response)")
			
			// response status code
			if let status = response.response?.statusCode {
				switch(status){
				case 200:
					print("example success")
				default:
					let errorMessage = "error with response status: \(status)"
					completionHandlerForTVShows(false, nil, errorMessage)
				}
			}
			
			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'jsonObjectResult' 📦 */
			if let jsonObjectResult: Any = response.result.value {
				
				let jsonObjectResultDictionary = jsonObjectResult as! [String:AnyObject]
				
				debugPrint("🤜JSON TV SHOW: \(jsonObjectResult)") // JSON obtenido
				
				if let results = jsonObjectResultDictionary["results"] {
					
					let resultTVShows = iTunesMedia.mediaFromResults(results as! [[String : AnyObject]])
					//debugPrint("total de páginas: \(totalPages)")
					
					//test
					debugPrint("🤾🏼‍♂️ los tv shows pasados a Foundation...\(resultTVShows)")
					
					// MARK: extrayendo valores de la respuesta
					for item in resultTVShows {
						
						/* valores extraidos:
						'artistName' -> 'tituloDelPrograma'
						'trackName' -> 'nombreDelEpisodio'
						'artworkUrl100' -> 'imagenDelPrograma'
						'longDescription' -> 'descripcionEpisodio' */
						
						debugPrint("🤥tv show, título del programa: \(item.tituloDelPrograma)")
						debugPrint("🤥tv show, nombre del episodio: \(item.nombreDelEpisodio)")
						debugPrint("🤥tv show, imagen del programa: \(item.imagenDelPrograma)")
						debugPrint("🤥tv show, descripción del episodio: \(item.descripcionEpisodio)")

					}
					
					completionHandlerForTVShows(true, resultTVShows, nil)
					
				}
			}
		}
	}
	
	
	// MARK: Get Movies
	// task: obtener TV Shows, de acuerdo al término ingresado
	static func getMovies(_ term: String, _ media: String, _ completionHandlerForMovies: @escaping ( _ success: Bool, _ movies: [iTunesMedia]?, _ errorString: String?) -> Void) {
		
		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
		Alamofire.request("https://itunes.apple.com/search?term=the+goonies&media=movie").responseJSON { response in
			
			// response status code
			if let status = response.response?.statusCode {
				switch(status){
				case 200:
					print("example success")
				default:
					let errorMessage = "error with response status: \(status)"
					completionHandlerForMovies(false, nil, errorMessage)
				}
			}
			
			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'jsonObjectResult' 📦 */
			if let jsonObjectResult: Any = response.result.value {
				
				let jsonObjectResultDictionary = jsonObjectResult as! [String:AnyObject]
				
				debugPrint("🤜JSON MOVIES: \(jsonObjectResult)") // JSON obtenido
				
				if let results = jsonObjectResultDictionary["results"] {
					
					let resultMovies = iTunesMedia.mediaFromResults(results as! [[String : AnyObject]])
					//debugPrint("total de páginas: \(totalPages)")
					
					//test
					debugPrint("🤾🏼‍♂️ los tv shows pasados a Foundation...\(resultMovies)")
					
					// MARK: extrayendo valores de la respuesta
					for item in resultMovies {
						
						/* valores extraidos:
						'trackName' -> 'tituloDePelicula'
						'longDescription' -> 'descripcionPelicula'
						'artworkUrl100' -> 'imagenDePelicula' */
						
						debugPrint("☠️ movie, TITULO PELICULA: \(item.tituloDeLaPelicula)")
						debugPrint("☠️ movie, DESCRIPCION PELICULA: \(item.descripcionPelicula)")
						debugPrint("☠️ movie, IMAGEN PELICULA: \(item.imagenPelicula)")
				
						
					}
					
					// una vez obtenidos los resultados, se los pasa al completion handler
					completionHandlerForMovies(true, resultMovies, nil)
					
				}
			}
		}
	}
	
	
	// MARK: Get Search Movie
	// task: obtener las películas que se correspondan con el texto de búsqueda
	static func getMediaForSearchString(_ searchString: String, _ completionHandlerForSearchString: @escaping (_ success: Bool, _ mediaResults: [iTunesMedia]?, _ error: String?) -> Void)  {
		
//		//https://api.themoviedb.org/3/search/movie?api_key=0942529e191d0558f888245403b4dca7&query=Is
//		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
//		Alamofire.request(configureUrlSearchText(TMDbClient.Methods.SearchTextMovie, searchString: searchString)).responseJSON { response in
//
//
//			// response status code
//			if let status = response.response?.statusCode {
//				switch(status){
//				case 200:
//					print("example success")
//				default:
//					let errorMessage = "error with response status: \(status)"
//					completionHandlerForMovies(false, nil, errorMessage)
//				}
//			}
//
//			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'jsonObjectResult' 📦 */
//			if let jsonObjectResult: Any = response.result.value {
//
//				let jsonObjectResultDictionary = jsonObjectResult as! [String:AnyObject]
//
//				debugPrint("🤜JSON TEXT SEARCH MOVIES: \(jsonObjectResult)") // JSON obtenido
//
//				if let results = jsonObjectResultDictionary[TMDbClient.JSONResponseKeys.Results] {
//
//					let resultsMovieTextSearch = TMDbMovie.moviesFromResults(results as! [[String : AnyObject]])
//
//					//test
//					debugPrint("🤾🏼‍♂️ TMDBMovie...\(resultsMovieTextSearch)")
//
//					completionHandlerForMovies(true, resultsMovieTextSearch, nil)
//
//				}
//			}
//
//		}
		
	}
	
	
	
	
	// MARK: Get Images
	// task: obtener las imágenes (posters) de las películas
	static func getArtworkImage( _ completionHandlerForArtworkImage: @escaping ( _ imageData: Data?, _ error: String?) -> Void) {
		
		/* 2/3. Build the URL and configure the request */
//		let baseURL = URL(string: TMDbClient.ParameterValues.secureBaseImageURLString)!
//		let url = baseURL.appendingPathComponent(size).appendingPathComponent(filePath)
//		let request = URLRequest(url: url)
		
		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
		Alamofire.request("https://is5-ssl.mzstatic.com/image/thumb/Music/v4/10/23/6f/10236f45-754d-5310-040d-3a6bd59bbf40/source/100x100bb.jpg").responseData { response in
			
			// response status code
			if let status = response.response?.statusCode {
				switch(status){
				case 200:
					print("example success")
				default:
					let errorMessage = "error with response status: \(status)"
					completionHandlerForArtworkImage(nil, errorMessage)
				}
			}
			
			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'dataObjectResult' 📦 */
			if let dataObjectResult: Any = response.result.value {
				
				let dataObjectResult = dataObjectResult as! Data
				
				completionHandlerForArtworkImage(dataObjectResult, nil)
				
				//test
				debugPrint("Los datos de la imagen: \(dataObjectResult)")
			}
		}
	}
	
	
	// MARK: Get Media for Search
	// task: --
	static func getMediaForTermAndMediaString(_ media: String, _ term: String?, completionHandlerFor_TermAndMediaString: @escaping (_ success: Bool, _ result: [iTunesMedia]?, _ error: String?) -> Void)  {
		
		//https://api.themoviedb.org/3/search/movie?api_key=0942529e191d0558f888245403b4dca7&query=Is
		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
		Alamofire.request(configureUrlSearchText(media, term)).responseJSON { response in
			
			
			// response status code
			if let status = response.response?.statusCode {
				switch(status){
				case 200:
					print("example success")
				default:
					let errorMessage = "error with response status: \(status)"
					completionHandlerFor_TermAndMediaString(false, nil, errorMessage)
				}
			}
			
			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'jsonObjectResult' 📦 */
			if let jsonObjectResult: Any = response.result.value {
				
				let jsonObjectResultDictionary = jsonObjectResult as! [String:AnyObject]
				
				debugPrint("🤜JSON TEXT SEARCH MEDIA: \(jsonObjectResult)") // JSON obtenido
				
				if let results = jsonObjectResultDictionary["results"] {
					
					let resultsMediaTextSearch = iTunesMedia.mediaFromResults(results as! [[String : AnyObject]])
					
					//test
					debugPrint("🤾🏼‍♂️ TMDBMovie...\(resultsMediaTextSearch)")
					
					completionHandlerFor_TermAndMediaString(true, resultsMediaTextSearch, nil)
					
				}
			}
			
		}
		
	}
	
	// task: configurar las diversas URLs a enviar en las APi calls
	static func configureUrlSearchText(_ media: String, _ term: String?) -> URL {
		
		var components = URLComponents()
		components.scheme = iTunesApiClient.Constants.ApiScheme
		components.host = iTunesApiClient.Constants.ApiHost
		components.path = iTunesApiClient.Constants.ApiPath
		components.queryItems = [URLQueryItem]()
		let queryItem1 = URLQueryItem(name: iTunesApiClient.ParameterKeys.Media, value: media)
		let queryItem2 = URLQueryItem(name: iTunesApiClient.ParameterKeys.StringSearch, value: term)
		components.queryItems?.append(queryItem1) // term
		components.queryItems?.append(queryItem2) // media
		debugPrint("URL -> \(components.url)")
		return components.url!
	}
	
	


	
}
