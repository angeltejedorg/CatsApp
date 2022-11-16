//
//  CatsViewController.swift
//  CatsApp
//
//  Created by angel.tejedore on 9/11/22.
//

import UIKit

class CatsViewController: UITableViewController {

    let api = ApiCats()
    let viewModel = CatViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
        viewModel.getCats()
        tableView.register(UINib(nibName: "CatCell", bundle: nil), forCellReuseIdentifier: "CatCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func setupBinders() {
        viewModel.cats.bind { cats in
            if let cats = cats {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: - Table view data source

extension CatsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return viewModel.cats.value?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cat = viewModel.cats.value?[indexPath.row]
        let breedName = cat?.breedName
        let url = cat?.imageUrl
        let origin = cat?.origin
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath) as! CatCell
        cell.setupCell(name: breedName, origin: origin, imageUrl: url)
        
        return cell
    }
}
