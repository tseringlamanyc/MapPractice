//
//  ViewController.swift
//  MapPractice
//
//  Created by Tsering Lama on 1/3/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var usersData = [Result1]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func loadData () {
        RandomAPI.getUsers { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let userArr):
                self?.usersData = userArr
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mapVC = segue.destination as? MapVC, let indexpath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        mapVC.persons = usersData[indexpath.row]
    }
}

extension PeopleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let aUser = usersData[indexPath.row]
        cell.textLabel?.text = aUser.name.first
        cell.detailTextLabel?.text = aUser.email
        cell.imageView?.getImage(with: aUser.picture.medium, completion: { (result) in
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(named: "person.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    cell.imageView?.image = image
                }
            }
        })
        return cell
    }
}

