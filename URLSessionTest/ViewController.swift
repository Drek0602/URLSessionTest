//
//  ViewController.swift
//  URLSessionTest
//
//  Created by Tim Acosta on 3/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    //var users = [User]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.register(UINib(nibName: "UserViewCell", bundle: nil), forCellReuseIdentifier: "UserViewCell")
        
        fetchPosts(completion: { [weak self] posts in
            guard let self = self else {return}
            
            self.posts = posts
            self.tableView.reloadData()

        
        })
        
        
    }
        
    }
    
    
    //MARK: - Fetch function
    func fetchPosts(completion: @escaping (([Post]) -> Void)) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        let task = session.dataTask(with: url) {(data, response, error) in
            guard let data = data else {return}
            
            do{
                guard let posts = try? JSONDecoder().decode(Posts.self, from: data) else {return}
                DispatchQueue.main.async {
                    completion(posts)
                }
                
            }catch{
                print(error)
            }
            
        }
        
        task.resume()
        
    }
    
    




