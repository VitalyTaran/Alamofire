//
//  ViewController.swift
//  AlamofireHW
//
//  Created by Виталий Таран on 07.08.2022.
//

import UIKit

final class CharactersViewController: UIViewController {
    
    let manager = NetworkManager()
    var results: [Character] = []
    var selectedItem: Character?
    
    private var charactersView: CharactersView? {
        guard isViewLoaded else { return nil }
        return view as? CharactersView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view = CharactersView()
        charactersView?.loader.startAnimating()
        charactersView!.tableView.dataSource = self
        charactersView!.tableView.delegate = self
        manager.delegate = self
        manager.performRequest()
    }
}

// MARK: - UITableViewDataSource

extension CharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier, for: indexPath) as! CharacterCell
        DispatchQueue.main.async {
            cell.configure(with: self.results[indexPath.row])
            tableView.beginUpdates()
            cell.layoutIfNeeded()
            tableView.setNeedsDisplay()
            tableView.endUpdates()
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CharactersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedItem = results[indexPath.row]
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsController = CharacterDetailsController()
        detailsController.data = selectedItem
        present(detailsController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let lastVisiblePath = tableView.indexPathsForVisibleRows?.last {
            if indexPath == lastVisiblePath {
                self.charactersView?.loader.stopAnimating()
            }
        }
    }
}

// MARK: - NetworkDelegate

extension CharactersViewController: NetworkDelegate {
    func updateUI(with chars: [Character]) {
        self.results = chars
        charactersView?.reloadTableView()
    }
}

