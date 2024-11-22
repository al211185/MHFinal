//
//  NoticiaTableViewCell.swift
//  MonsterhIGH
//
//  Created by alumno on 11/13/24.
//

import UIKit

class NoticiaTableViewCell: UITableViewCell {
    
    let tituloLabel = UILabel()
    let descripcionLabel = UILabel()
    let imagenView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configurarElementos()
        configurarLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configurarElementos()
        configurarLayout()
    }
    
    // Configura el contenido de la celda con la noticia
    func configurarCon(_ noticia: Noticia) {
        tituloLabel.text = noticia.titulo
        descripcionLabel.text = noticia.descripcion
        cargarImagenDesdeURL(urlString: noticia.imagenURL)
    }
    
    private func cargarImagenDesdeURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    self.imagenView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
    
    private func configurarElementos() {
        tituloLabel.font = UIFont.boldSystemFont(ofSize: 16)
        descripcionLabel.font = UIFont.systemFont(ofSize: 14)
        descripcionLabel.numberOfLines = 0
        imagenView.contentMode = .scaleAspectFill
        imagenView.clipsToBounds = true

        contentView.addSubview(imagenView)
        contentView.addSubview(tituloLabel)
        contentView.addSubview(descripcionLabel)
    }
    
    private func configurarLayout() {
        imagenView.translatesAutoresizingMaskIntoConstraints = false
        tituloLabel.translatesAutoresizingMaskIntoConstraints = false
        descripcionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imagenView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imagenView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imagenView.widthAnchor.constraint(equalToConstant: 60),
            imagenView.heightAnchor.constraint(equalToConstant: 60),

            tituloLabel.leadingAnchor.constraint(equalTo: imagenView.trailingAnchor, constant: 10),
            tituloLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            tituloLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),

            descripcionLabel.leadingAnchor.constraint(equalTo: tituloLabel.leadingAnchor),
            descripcionLabel.trailingAnchor.constraint(equalTo: tituloLabel.trailingAnchor),
            descripcionLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 5),
            descripcionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}

