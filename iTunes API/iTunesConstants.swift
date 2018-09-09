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
Almacena valores constantes a usar en las solicitudes web.
*/

extension iTunesApiClient {
	
	//*****************************************************************
	// MARK: - Constants
	//*****************************************************************

	struct Constants {
		static let ApiScheme = "https"
		static let ApiHost = "itunes.apple.com"
		static let ApiPath = "/search"
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
	// MARK: - JSON Response Keys
	//*****************************************************************
	
	struct JSONResponseKeys {
		
		static let TrackName = "trackName"
		static let LongDescription = "longDescription"
		static let ArtworkUrl = "artworkUrl100"
		static let ArtistName = "artistName"
		
	}
}

