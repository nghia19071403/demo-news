//
//  ViewController.swift
//  API news
//
//  Created by hoàng trọng nghĩa on 15/06/2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import CoreAudio
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tapToScroll: UIButton!
    var ListDateItems = [dataAPIModel]()
    var filteredData: [String]!
    @IBOutlet weak var leftMenuButton: NSLayoutConstraint!
    
    let refreshControl = UIRefreshControl()
    let findBar = UISearchController()
    
    var isSearch = false {
        didSet {
            tableView.reloadData()
        }
    }
    
    var selectedItem = 0
    
    var dataSearch: [dataAPIModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
                tableView.dataSource = self
        tableView.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        //findBar.delegate = self
        tableView.separatorColor = .clear
        sendGetRequest()
        tableView.register(UINib(nibName: "APITableViewCell", bundle: nil), forCellReuseIdentifier: "APITableViewCell")
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
       
        
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        addNavBarImage()
        
        findBar.searchResultsUpdater = self
        navigationItem.searchController = findBar
        navigationItem.hidesSearchBarWhenScrolling = false
        findBar.delegate = self
        leftMenuButton.constant = collectionView.contentOffset.x - 50.0
//        tapToScroll.isHidden = true
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
    
    @IBAction func scrollToTop(_ sender: Any) {
        collectionView.scrollToItem(at: IndexPath(row: 0,section: 0), at: .left, animated: true)
    }
    
    
    @objc func refresh(_ sender: AnyObject) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.sendGetRequest()
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }

    private func sendGetRequest(){
        guard let url = URL(string:"https://newsapi.org/v2/everything?q=tesla&from=2022-06-12&sortBy=publishedAt&apiKey=bd5d88c8396a491bbe0b4ac86e471936")
        else {
            return
        }
        Alamofire.request(url).responseJSON{ [weak self] (articles) in
            guard let self = self else { return }
            self.handleParseData(articles)
        }
    }
    
     private func handleParseData(_ articles : DataResponse<Any> ){
        switch articles.result{
        case.success:
            let json = JSON(articles.data!)
            ListDateItems = json["articles"].arrayValue.map{dataAPIModel($0)}
            
            
            tableView.reloadData()
            
        case .failure(_):
            print ("ERROR")
        }
      }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearch ? dataSearch.count : ListDateItems.count
    }
    func tableView(_ collectionView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = collectionView.dequeueReusableCell(withIdentifier: "APITableViewCell", for: indexPath) as? APITableViewCell else{
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        let data = isSearch ? dataSearch[indexPath.row] : ListDateItems[indexPath.row]
        cell.dataNews(data)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let url = ListDateItems[indexPath.row].url
        let vc = WedViewController()
        guard let url1 = URL(string: url) else { return }
//        UIApplication.shared.open(URL(string: url)!)
        vc.url = url1
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
extension ViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    

    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 0 {
            dataSearch = ListDateItems.filter({ $0.titleTop.contains(text)})
            isSearch = true
        } else {
            isSearch = false
        }
        
    }
}
extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listNews.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else {
            return HomeCollectionViewCell()
        }
        cell.setShowBottom(indexPath.row == selectedItem)
        let item = listNews.allCases[indexPath.row]
        cell.listNews.text = item.listText
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        selectedItem = indexPath.row
        collectionView.reloadData()
        self.collectionView.scrollToItem(at: IndexPath(item: self.selectedItem, section: 0), at: .centeredHorizontally, animated: true)
        switch listNews.allCases[indexPath.row] {
        case .news:
            print("niu")
        case .podcasts:
            print("Pót cát")
        case .homePage:
            print("Home")
        case .latest:
            print("latest")
        case .view:
            print("view")
        case .world:
            print("world")
        case .video:
            print("video")
        case .business:
            print("business")
        }
    }
   


}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height)
    }
}
                       
extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        if scrollView == collectionView {
            if scrollView.contentOffset.x < 0 || scrollView.contentOffset.x < 50 {
                tapToScroll.isHidden = false //scrollView.contentOffset.x < 50
                let itemScroll = scrollView.contentOffset.x
                leftMenuButton.constant = itemScroll - 50.0
            }
        }
    }
}
