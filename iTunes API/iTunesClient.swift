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
	
	override init() { super.init() }
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// shared session
	var session = URLSession.shared
	
	//*****************************************************************
	// MARK: - Networking Methods
	//*****************************************************************
	
	// MARK: Get Media for Search
	// task: --
	static func getMediaForTermAndMediaString(_ media: String, _ term: String?, completionHandlerFor_TermAndMediaString: @escaping (_ success: Bool, _ result: [iTunesMedia]?, _ error: String?) -> Void)  {
		
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
	
	// MARK: Get Images
	// task: obtener las imágenes (posters) de las películas
	static func getArtworkImage(_ artworkUrl: String, _ completionHandlerForArtworkImage: @escaping ( _ imageData: Data?, _ error: String?) -> Void) {
		
		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
		Alamofire.request(artworkUrl).responseData { response in
			
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

		return components.url!
	}
	
}
