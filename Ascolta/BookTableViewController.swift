//
//  BookTableViewController.swift
//  Ascolta
//
//  Created by Christopher Paterson on 29/10/2016.
//  Copyright © 2016 Christopher Paterson. All rights reserved.
//

import UIKit

class BookTableViewController: UITableViewController {
    var selectedBook: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindToPlayer", sender: sender)
    }
    
}

extension BookTableViewController {
    
    var books: [Book] {
        return DocumentManager.getBookList()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DocumentManager.getNumberOfBooks()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = books[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        cell.textLabel?.text = book.name
        return cell
    }
        
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        selectedBook = book
        self.performSegue(withIdentifier: "unwindToPlayer", sender: self)
    }
}
