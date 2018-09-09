//
//  MediaVC_Table.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 05/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

//*****************************************************************
// MARK: - Table View Data Source Methods
//*****************************************************************

extension MediaListViewContoller: UITableViewDataSource {
	
	// task: determinar cuantas filas tendrá la tabla
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return filteredMediaArray.count }
	
	// task: configurar las celdas a mostrar
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let preImageMusicTV = UIImage(named: "preImageMusicTV")
		let preImageMovie = UIImage(named: "preImageMovie")
		let cellReuseId = "cell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
		
	  var artwork = String()
		
		switch navigationItem.title {
			
		// si el título de la barra de navegación es "Music", mostrar ese grupo en las celdas de la tabla
		case category["Music"]:
			media = filteredMediaArray[(indexPath as NSIndexPath).row]
			cell.textLabel?.text = media?.tituloCancion
			cell.detailTextLabel?.text = media?.nombreArtista
			cell.imageView?.image = preImageMusicTV
			
			// imagen del disco
			if let artworkUrl = media?.imagenDisco {
				
				artwork = artworkUrl
				
				if (media?.imagenDisco) != nil {
					
					iTunesApiClient.getArtworkImage (artworkUrl) { (imageData, error) in
						
						if let image = UIImage(data: imageData!) {
							DispatchQueue.main.async {
								cell.imageView!.image = image
							}
						} else {
							print(error ?? "empty error")
						}
					}
					
				}
			}
			
		// si el título de la barra de navegación es "TV Show", mostrar ese grupo en las celdas de la tabla
		case category["TV Show"]:
			media = filteredMediaArray[(indexPath as NSIndexPath).row]
			cell.textLabel?.text = media?.tituloDelPrograma
			cell.detailTextLabel?.text = media?.nombreDelEpisodio
			cell.imageView?.image = preImageMusicTV
	
			// imagen de la serie
			if let artworkUrl = media?.imagenDelPrograma {
				
				artwork = artworkUrl
				
				if (media?.imagenDelPrograma) != nil {
					
					iTunesApiClient.getArtworkImage (artworkUrl) { (imageData, error) in
						
						if let image = UIImage(data: imageData!) {
							DispatchQueue.main.async {
								cell.imageView!.image = image
							}
						} else {
							print(error ?? "empty error")
						}
					}
					
				}
			}
			
		// si el título de la barra de navegación es "Movie", mostrar ese grupo en las celdas de la tabla
		case category["Movie"]:
			media = filteredMediaArray[(indexPath as NSIndexPath).row]
			cell.textLabel?.text = media?.tituloDeLaPelicula
			cell.detailTextLabel?.text = media?.descripcionPelicula
			cell.imageView?.image = preImageMovie
			// imagen de la película
			if let artworkUrl = media?.imagenPelicula {
				
				artwork = artworkUrl
				
				if (media?.imagenPelicula) != nil {
					
					iTunesApiClient.getArtworkImage (artwork) { (imageData, error) in
						
						if let image = UIImage(data: imageData!) {
							DispatchQueue.main.async {
								cell.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
								cell.imageView!.image = image
							}
						} else {
							print(error ?? "empty error")
						}
					}
					
				}
			}
			
		default:
			print("")
		}
		
		// devuelve las celdas adecuadas ya configuradas
		return cell
	}
	
}


//*****************************************************************
// MARK: - Table View Delegate Methods
//*****************************************************************

extension MediaListViewContoller: UITableViewDelegate {
	
	// task: navegar hacia el detalle de la película (de acuerdo al listado de películas actual)
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		switch navigationItem.title {
		
			case category["Music"]:
				selectedMedia = filteredMediaArray[(indexPath as NSIndexPath).row]
				playSong()
			
			case category["TV Show"]:
				selectedMedia = filteredMediaArray[(indexPath as NSIndexPath).row]
				showTrailer()

			case category["Movie"]:
				selectedMedia = filteredMediaArray[(indexPath as NSIndexPath).row]
				showTrailer()
		
			default:
				print("")
			}
	}
	

} // end ext


