//
//  DataSource+ViewController.swift
//  URLSessionTest
//
//  Created by Tim Acosta on 3/1/21.
//

import UIKit

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserViewCell", for: indexPath)
        
        cell.textLabel?.text = posts[indexPath.row].title
        print("\(posts)")
        return cell
        
    }
    
    
    
    
}
