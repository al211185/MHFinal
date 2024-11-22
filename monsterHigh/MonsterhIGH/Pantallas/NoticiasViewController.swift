//
//  NoticiasViewController.swift
//  MonsterhIGH
//
//  Created by alumno on 11/13/24.
//

import UIKit

class NoticiasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var noticias: [Noticia] = [
        Noticia(titulo: "Mattel y Universal se alían para llevar a las 'Monster High' al cine", descripcion: "La fiebre por las películas basadas en juguetes no tiene freno. Un fenómeno que nunca ha desaparecido pero que el estreno de 'Barbie' en 2023 ha potenciado de forma evidente. Ahora, Mattel Films y Universal Pictures unen fuerzas para llevar a la gran pantalla a las 'Monster High', que ya cuentan con una serie y varias películas para la televisión.", imagenURL: "https://kinotico.es/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fgfy7vknl%2Fproduction%2Ff06d996810536126ca9a571aa19cddde5b4c0242-1080x1080.jpg%3Frect%3D0%2C117%2C1077%2C736%26w%3D1024%26h%3D700%26dpr%3D3&w=2048&q=75",
            url: "https://kinotico.es/actualidad/2024-06-06/mattel-films-y-universal-se-alian-para-llevar-monster-high-gran-pantalla"),
        Noticia(titulo: "¡Todo lo que sabemos sobre el live-action de Monster High!", descripcion: "Según Deadline, Nickelodeon se ha asociado con Mattel para su próxima película espeluznante, ya que anunciaron la producción de un proyecto musical de televisión de live action basada en la franquicia Monster High sobre los hijos de monstruos y criaturas famosos.", imagenURL: "https://stateless-fueradefoco.storage.googleapis.com/wp-content/uploads/2021/11/30055844/Monster-High-Movie-Cast-Nickelodeon.jpg",
            url: "https://fueradefoco.com.mx/noticias/monster-high-tendra-su-live-action/"),
        Noticia(titulo: "Mattel y Nickelodeon confirman la segunda temporada de Monster High", descripcion: "Mattel Television y Nickelodeon han anunciado la renovación de la serie de animación sobre las Monster High para una segunda temporada, con 20 nuevos episodios. La primera temporada de la serie se estrenó el pasado 28 de octubre en Estados Unidos, también se ha estrenado ya en Reino Unido y llegará a Australia a finales de noviembre, y se espera que llegue a otros territorios internacionales a lo largo de 2023.", imagenURL: "https://img.interempresas.net/A/A875/3450411.webp",
            url: "https://www.interempresas.net/Licencias/Articulos/410733-Mattel-y-Nickelodeon-confirman-la-segunda-temporada-de-Monster-High.html"),
        Noticia(titulo: "Monster High™ Skulltimate Secrets™ para Nintendo Switch", descripcion: "Es tu primer día en Monster High™, donde se reciben a todos los monstruos... pero ocurren sucesos extraños.Crea tu propio personaje e investiga el terrorífico misterio de las habitaciones ocultas. Con el Escuadrón de monstruos podrás desvelar los secretos más espeluznantes de Monster High™ Skulltimate Secrets.", imagenURL: "https://assets.nintendo.com/image/upload/ar_16:9,c_lpad,w_1240/b_white/f_auto/q_auto/ncom/software/switch/70010000078595/a7039c0638124af9b7dcea59ed3045eacb9bc6dcc7ad1457e61b3a6951f80c14",
            url: "https://www.nintendo.com/es-mx/store/products/monster-high-skulltimate-secrets-switch/"),
        Noticia(titulo: "Muñeca Monster High de Merlina Adams, ¿cuánto cuesta en Amazon?", descripcion: "El éxito arrollador de la serie Wednesday, protagonizada por Jenna Ortega, ha dado lugar a una colaboración entre la franquicia de Monster High y la serie. La exitosa serie de Netflix “Wednesday” no solo ha conquistado las pantallas, sino que ahora también invade el mundo de los juguetes de colección con una nueva muñeca Monster High inspirada en Merlina Adams.", imagenURL: "https://files.merca20.com/uploads/2024/08/monster-high-merlina-.jpg",
            url: "https://www.merca20.com/muneca-monster-high-de-merlina-adams-cuanto-cuesta-en-amazon/")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NoticiaTableViewCell.self, forCellReuseIdentifier: "NoticiaCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticias.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noticia = noticias[indexPath.row]
        if let url = URL(string: noticia.url) {
            UIApplication.shared.open(url)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoticiaCell", for: indexPath) as? NoticiaTableViewCell else {
            return UITableViewCell()
        }
        
        let noticia = noticias[indexPath.row]
        cell.configurarCon(noticia)
        
        return cell
    }
}




