//
//  ViewController.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import UIKit

class HompageViewController: UIViewController {
   
    @IBOutlet weak var foodsCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var foodsList = [Foods]()
    var filteredFoods = [Foods]()
    var homepagePresenterObject:ViewToPresenterHomepageProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        searchBar.tintColor = UIColor(named: "butonColor")
        let appearance = UINavigationBarAppearance()
       // appearance.backgroundColor = UIColor(named: "butonColor")

        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        foodsCollectionView.delegate = self
        foodsCollectionView.dataSource = self
        searchBar.delegate = self
        homepagePresenterObject?.getTheFoods()
        HomePageRouter.createModule(ref:self)
       
    
        
        let width = foodsCollectionView.frame.size.width
        let designCollectionview = UICollectionViewFlowLayout()
        designCollectionview.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        designCollectionview.minimumInteritemSpacing = 10
        designCollectionview.minimumLineSpacing = 10
        
        let itemWidth = (width - 30) / 2
        designCollectionview.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.15)
        foodsCollectionView.collectionViewLayout = designCollectionview
        
        
        self.foodsCollectionView.reloadData()
        print(foodsList)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homepagePresenterObject?.getTheFoods()
    }
    
}


extension HompageViewController:PresenterToViewHomepageProtocol{
    func sendDataToView(foodsList: Array<Foods>) {
        self.foodsList = foodsList
        self.filteredFoods = foodsList
        DispatchQueue.main.async {
            self.foodsCollectionView.reloadData()
          //  print(foodsList)
        }
    }
}

extension HompageViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredFoods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let food = filteredFoods[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! FoodsCollectionViewCell
        
       
        print(food.yemek_adi!)
        cell.showImages(imageName: food.yemek_resim_adi!)
        cell.foodName.text = food.yemek_adi!
        cell.foodCost.text = "₺\(food.yemek_fiyat!)"
        cell.setupView()
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.systemGray4.cgColor
        cell.layer.borderColor = UIColor(named: "butonColor")?.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = self.filteredFoods[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: food)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            let food = sender as? Foods
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.getFood = food
        }
    }
}
extension HompageViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredFoods = self.foodsList.filter { food in
            print(searchText)
            if food.yemek_adi!.lowercased().contains(searchText.lowercased()) {
                return true
            }
            if searchText.isEmpty {
                return true
            }
            return false
        }
        self.foodsCollectionView.reloadData()
    }
}

