//
//  MenuViewController.swift
//  API news
//
//  Created by hoàng trọng nghĩa on 17/06/2022.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    let Utilities = UINavigationController()
   
    
    @IBOutlet weak var MenuTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuTableView.dataSource = self
        MenuTableView.delegate = self
        MenuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        MenuTableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodTableViewCell")
        // Do any additional setup after loading the view.
        addNavBarImage()
    }
    
    
    func addNavBarImage() {
        let navController = navigationController!

        let image = UIImage(named: "2") // Your logo URL here
        let imageView = UIImageView(image: image)

        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height

        let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
        let bannerY = bannerHeight / 2 - (image?.size.height)! / 2

        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit

        navigationItem.titleView = imageView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ListDataSection.allCases.count + 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section > ListDataSection.allCases.count - 1 {
            return 1
        }
        return ListDataSection.allCases[section].items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section > ListDataSection.allCases.count - 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell") else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        let item =  ListDataSection.allCases[indexPath.section].items[indexPath.row]
        cell.testTitble.text = item.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            tabBarController?.selectedIndex = 0
        }else if indexPath.section == 0 && indexPath.row == 1 {
            tabBarController?.selectedIndex = 1
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
       return nil
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section > ListDataSection.allCases.count - 1 {
            return "nilpresent"
        }
        return ListDataSection.allCases[section].title
    }
    
}
