//
//  CharacterDetailsView.swift
//  AlamofireHW
//
//  Created by Виталий Таран on 15.08.2022.
//

import UIKit

final class CharacterDetailsController: UIViewController {
    
    var data: Character?
    let manager = NetworkManager()
    
    // MARK: - CharacterDetailsView
    
    private var characterDetailsView: CharacterDetailsView? {
        guard isViewLoaded else { return nil }
        return view as? CharacterDetailsView
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        guard let data = data else { return }
        
        self.characterDetailsView?.configureView(with: data)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = CharacterDetailsView()
        characterDetailsView?.tableView.dataSource = self
    }
}

extension CharacterDetailsController: NetworkDelegate {
    func updateUI(with chars: [Character]) {
        characterDetailsView?.configureView(with: chars[0])
    }
}

extension CharacterDetailsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data!.comics.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data!.comics.items[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Comics"
    }
}
