//
//  DetailVC_Trailer.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 04/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit
import YouTubePlayer_Swift
import AVFoundation

//TODO: luego removern 'YouTubePlayer_Swift'

/* Abstract:
Una pantalla que muestra el trailer de la película seleccionada.
*/

class DetailTrailerViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************

	var selectedMedia: iTunesMedia?

	var mediaTrailersArray: [iTunesMedia]?
	//var firstTrailerArray: [iTunesMedia] = []

	// esconde la barra de estado
	override var prefersStatusBarHidden: Bool { return true }

	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************

	@IBOutlet weak var movieTrailerVideo: YouTubePlayerView!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!

	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************

	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "hola"
		startActivityIndicator()
		
		//test
		debugPrint("el media seleccionado es: \(selectedMedia?.trailerPelicula)")
		showTrailer()
	}

	//*****************************************************************
	// MARK: - Networking
	//*****************************************************************

		// task: mostrar el trailer de la película en youtube
		func showTrailer() {
//			for trailer in movieTrailersArray! { firstTrailerArray.append(trailer)}
//			let firstTrailer = firstTrailerArray.first
//			let oficialVideoKey = firstTrailer?.videoKey
			stopActivityIndicator()
			//self.movieTrailerVideo.loadVideoID((selectedMedia?.trailerPelicula!)!) // OJO!
			let url = URL(string: (selectedMedia?.trailerPelicula)!)
			debugPrint("7777: \(url!)")
			
			
			//self.movieTrailerVideo.loadVideoURL(url!)
//			self.movieTrailerVideo.loadVideoID("http://video.itunes.apple.com/apple-assets-us-std-000001/Video127/v4/fe/cf/31/fecf31a6-f445-baed-691a-82a6053cba64/mzvf_6478119053186103420.640x354.h264lc.U.p.m4v")
			//debugPrint("7777\(self.movieTrailerVideo.loadVideoURL(url!))")
		}

		//*****************************************************************
		// MARK: - Activity Indicator
		//*****************************************************************

		func startActivityIndicator() {
			activityIndicator.alpha = 1.0
			activityIndicator.startAnimating()
		}

		func stopActivityIndicator() {
			activityIndicator.alpha = 0.0
			self.activityIndicator.stopAnimating()
		}

//	//*****************************************************************
//	// MARK: - Alert View
//	//*****************************************************************
//
//	/**
//	Muestra al usuario un mensaje acerca de porqué la solicitud falló.
//
//	- Parameter title: El título del error.
//	- Parameter message: El mensaje acerca del error.
//
//	*/
//	func displayAlertView(_ title: String?, _ error: String?) {
//
//		// si ocurre un error en la solicitud, mostrar una vista de alerta!
//		if error != nil {
//			let alertController = UIAlertController(title: title, message: error, preferredStyle: .alert)
//			let OKAction = UIAlertAction(title: "OK", style: .default) { action in
//			}
//
//			alertController.addAction(OKAction)
//			self.present(alertController, animated: true) {}
//		}
//	}
//
	
} // end class
