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
El objeto representa un media (puede ser tanto un 'tv show', como una 'película' o una 'música')
*/

struct iTunesMedia {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// tv show
	let tvShowTitle: String? // 'artistName'
	let tvShowEpisodeName: String? // 'trackName'
	let tvShowArtwork: String? // 'artworkUrl100'
	let tvShowEpisodeDescription: String? // 'longDescription'
	let tvShowEpisodeTrailer: String? // 'previewUrl'
	// movie
	let movieTitle: String? // 'trackName'
	let movieDescription: String? // 'longDescription'
	let movieArtwork: String? // 'artworkUrl100'
	let movieTrailer: String? // 'previewUrl'
	// music
	let songTitle: String? // 'trackName'
	let songArtistName: String? // 'artistName'
	let songArtwork: String? // 'artworkUrl100'
	let songPlay: String? // 'previewUrl'
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	// construye el objeto 'iTunesMedia' desde un diccionario  👈
	init(dictionary: [String:AnyObject]) {
		// tv show
		tvShowTitle = dictionary[iTunesApiClient.JSONResponseKeys.ArtistName] as? String
		tvShowEpisodeName = dictionary[iTunesApiClient.JSONResponseKeys.TrackName] as? String
		tvShowArtwork = dictionary[iTunesApiClient.JSONResponseKeys.ArtworkUrl] as? String
		tvShowEpisodeDescription = dictionary[iTunesApiClient.JSONResponseKeys.LongDescription] as? String
		tvShowEpisodeTrailer = dictionary[iTunesApiClient.JSONResponseKeys.PreviewUrl] as? String
		
		// movie
		movieTitle = dictionary[iTunesApiClient.JSONResponseKeys.TrackName] as? String
		movieDescription = dictionary[iTunesApiClient.JSONResponseKeys.LongDescription] as? String
		movieArtwork = dictionary[iTunesApiClient.JSONResponseKeys.ArtworkUrl] as? String
		movieTrailer = dictionary[iTunesApiClient.JSONResponseKeys.PreviewUrl] as? String

		// music
		songTitle = dictionary[iTunesApiClient.JSONResponseKeys.TrackName] as? String
		songArtistName = dictionary[iTunesApiClient.JSONResponseKeys.ArtistName] as? String
		songArtwork = dictionary[iTunesApiClient.JSONResponseKeys.ArtworkUrl] as? String
		songPlay = dictionary[iTunesApiClient.JSONResponseKeys.PreviewUrl] as? String
	}
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	static func mediaFromResults(_ mediaResults: [[String:AnyObject]]) -> [iTunesMedia] {
		
		var mediaArray = [iTunesMedia]()
		
		// itera a través del array de diccionarios, cada ´iTunesMedia´ es un diccionario
		for result in mediaResults {
			mediaArray.append(iTunesMedia(dictionary: result))
		}
		
		return mediaArray
	}
	
} // end class
