//
//	iTunesConstants.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 04/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Networking */

import Foundation

/* Abstract:
Almacena valores a usar en las api calls.
*/

extension iTunesApiClient {
	
	//*****************************************************************
	// MARK: - Constants
	//*****************************************************************
	
	//https://itunes.apple.com/search?term=the+goonies&media=movie

	struct Constants {
		
		// MARK: URLs
		static let ApiScheme = "https"
		static let ApiHost = "itunes.apple.com"
		static let ApiPath = "/search"
		
		// MARK: YouTube
		static let YouTubeBaseURL = "https://www.youtube.com/watch?v="
	}
	
	//*****************************************************************
	// MARK: - Parameter Keys
	//*****************************************************************
	
	struct ParameterKeys {
		static let StringSearch = "term"
		static let Media = "media"
	}
	
	//*****************************************************************
	// MARK: - Parameter Values
	//*****************************************************************
	
	struct ParameterValues {
		
		static let Music = "music"
		static let Movie = "movie"
		static let TVShow = "tvShow"
	}
	
	//*****************************************************************
	// MARK: - JSON Body Keys
	//*****************************************************************
	
	// claves para extraer los valores deseados
	struct JSONBodyKeys {

	}
	
	//*****************************************************************
	// MARK: - JSON Response Keys
	//*****************************************************************
	
	struct JSONResponseKeys {
		
		static let TrackName = "trackName"
		static let LongDescription = "longDescription"
		static let ArtworkUrl = "artworkUrl100"
		static let ArtistName = "artistName"
		
	}
}

