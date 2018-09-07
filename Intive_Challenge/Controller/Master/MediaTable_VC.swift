//
//  MediaTable_VC.swift
//  Intive_Challenge
//
//  Created by Luciano Schillagi on 05/09/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit


//*****************************************************************
// MARK: - Table View Data Source Methods
//*****************************************************************


extension MediaListViewContoller: UITableViewDataSource {
	
	// task: determinar cuantas filas tendrá la tabla
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return filteredMediaArray.count }
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cellReuseId = "cell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
		
	  var artwork = String()
		
		switch navigationItem.title {
			
		// si el título de la barra de navegación es "Music", mostrar ese grupo en las celdas de la tabla
		case category["Music"]:
			media = filteredMediaArray[(indexPath as NSIndexPath).row]
			cell.textLabel?.text = media?.tituloCancion
			cell.detailTextLabel?.text = media?.nombreArtista
			// imagen del disco
			if let artworkUrl = media?.imagenDisco {
				
				artwork = artworkUrl
				
				if (media?.imagenDelPrograma) != nil {
					
					iTunesApiClient.getArtworkImage (artworkUrl) { (imageData, error) in
						
						if let image = UIImage(data: imageData!) {
							DispatchQueue.main.async {
								cell.imageView!.image = image
								debugPrint("👈\(image)")
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
			// imagen de la serie
			if let artworkUrl = media?.imagenDisco {
				
				artwork = artworkUrl
				
				if (media?.imagenDelPrograma) != nil {
					
					iTunesApiClient.getArtworkImage (artworkUrl) { (imageData, error) in
						
						if let image = UIImage(data: imageData!) {
							DispatchQueue.main.async {
								cell.imageView!.image = image
								debugPrint("👈\(image)")
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
			// imagen de la película
			if let artworkUrl = media?.imagenDisco {
				
				artwork = artworkUrl
				
				if (media?.imagenDelPrograma) != nil {
					
					iTunesApiClient.getArtworkImage (artwork) { (imageData, error) in
						
						if let image = UIImage(data: imageData!) {
							DispatchQueue.main.async {
								cell.imageView!.image = image
								debugPrint("👈\(image)")
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
		
		// test
		debugPrint("la fila \(indexPath) ha sido seleccionada")
		
		let storyboardId = "media detail"
		let controller = storyboard!.instantiateViewController(withIdentifier: storyboardId) as! DetailMediaViewController
		navigationController!.pushViewController(controller, animated: true)
	}
	
	
} // end ext
