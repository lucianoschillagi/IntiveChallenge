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
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		switch navigationItem.title {
			
		// si el título de la barra de navegación es "Explore", contar ´filteredMoviesArray´
		case category["Music"]:
			return mediaArray.count
			
		// si el título de la barra de navegación es "Popular Movies", contar ´popularMoviesArray´
		case category["TV Show"]:
			return mediaArray.count
			
		// si el título de la barra de navegación es "Top Rated Movies", contar ´topRatedMoviesArray´
		case category["Movie"]:
			return mediaArray.count
			
		default:
			print("")
		}
		
		return 0
	}
	
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cellReuseId = "cell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
		
		// get image (closure)
		let getImage:() = iTunesApiClient.getArtworkImage { (imageData, error) in
			if let image = UIImage(data: imageData!) {
				DispatchQueue.main.async {
					cell.imageView!.image = image
					debugPrint("👈\(image)")
				}
			} else {
				print(error ?? "empty error")
			}
		}
		
		switch navigationItem.title {
			
		// si el título de la barra de navegación es "Music", mostrar ese grupo en las celdas de la tabla
		case category["Music"]:
			media = mediaArray[(indexPath as NSIndexPath).row]
			cell.textLabel?.text = media?.tituloCancion
			cell.detailTextLabel?.text = media?.nombreArtista
			// imagen del disco
			if (media?.imagenDisco) != nil { getImage }
			
			
		// si el título de la barra de navegación es "TV Show", mostrar ese grupo en las celdas de la tabla
		case category["TV Show"]:
			media = mediaArray[(indexPath as NSIndexPath).row]
			cell.textLabel?.text = media?.tituloDelPrograma
			cell.detailTextLabel?.text = media?.nombreDelEpisodio
			// imagen de la serie
			if (media?.imagenDelPrograma) != nil { getImage }
			
		// si el título de la barra de navegación es "Movie", mostrar ese grupo en las celdas de la tabla
		case category["Movie"]:
			media = mediaArray[(indexPath as NSIndexPath).row]
			cell.textLabel?.text = media?.tituloDeLaPelicula
			cell.detailTextLabel?.text = media?.descripcionPelicula
			// imagen de la película
			if (media?.imagenPelicula) != nil { getImage }
			
		default:
			print("")
		}
		
		// devuelve la celda ya configurada
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
	
	
}
