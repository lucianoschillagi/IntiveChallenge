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
	
	// MARK: Popular Movies
	// task: obtener las películas máspopulares de TMDb
	static func getMusic(_ completionHandlerForMusic: @escaping ( _ success: Bool, _ music: [iTunesMusic]?, _ errorString: String?) -> Void) {
		
		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
		Alamofire.request("https://itunes.apple.com/search?term=caetano+veloso&media=music").responseJSON { response in
			
			debugPrint("LCD \(response)")
			
			// response status code
			if let status = response.response?.statusCode {
				switch(status){
				case 200:
					print("example success")
				default:
					let errorMessage = "error with response status: \(status)"
					completionHandlerForMusic(false, nil, errorMessage)
				}
			}
			
			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'jsonObjectResult' 📦 */
			if let jsonObjectResult: Any = response.result.value {
				
				let jsonObjectResultDictionary = jsonObjectResult as! [String:AnyObject]
				
				debugPrint("🤜JSON MUSIC: \(jsonObjectResult)") // JSON obtenido
				
				if let results = jsonObjectResultDictionary["results"] {
					
					let resultsMusic = iTunesMusic.musicFromResults(results as! [[String : AnyObject]])
					//debugPrint("total de páginas: \(totalPages)")
					
					//test
					debugPrint("🤾🏼‍♂️ los tv shows recibidos son...\(resultsMusic)")
					
					completionHandlerForMusic(true, resultsMusic, nil)
					
				}
			}
		}
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
	
	
	
	
	
	
	
	
	
	
	
	
}
