//
//  CategoryViewController.swift
//  Chroma Notes
//
//  Created by Himanshu Soni on 12/06/18.
//  Copyright © 2018 Himanshu Soni. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {

    let realm = try! Realm()
    
    var categories : Results<Category>?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

       loadCategories()
    }

    //MARK - TableView Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")
        
        cell?.textLabel?.text = categories?[indexPath.row].name ?? "NO Categories Added Yet"
        
        return cell!
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ChromaViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
    //MARK - TableView Manupulation Methods
    
    func save(category: Category) {
        
        do {
            try realm.write {
                realm.add(category)                          // here we had Category and i replaced it with category
            }
            
        }catch{
            print("Error saving context \(error)")
        }
        
       
    }
    
    func loadCategories() {
        
         categories = realm.objects(Category.self)
    
        
        tableView.reloadData()
        
    }
    
    //MARK - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Item", message: "Add new Category", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            
            self.save(category: newCategory)
            
            
        }
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Create New Category"
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
}















