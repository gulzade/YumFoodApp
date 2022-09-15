//
//  CartViewController.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import UIKit

class CartViewController: UIViewController {
    
    
    @IBOutlet weak var cartTotalCostLabel: UILabel!
    @IBOutlet weak var cartTableView: UITableView!
    
    var cartPresenterObject : ViewToPresenterCartProtocol?
    var foodsList = [CartFoods]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        CartRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //   cartPresenterObject?.getFoods(kullanici_adi: Auth.auth().currentUser!.uid)
        cartPresenterObject?.getFoods(kullanici_adi: "gulzade")
        totalCost()
        
        
    }
    func totalCost(){
        var totalCost = 0
        var price = 0
        for food in foodsList{
            price = Int(food.yemek_fiyat!)! * Int(food.yemek_siparis_adet!)!
            totalCost += price
        }
        self.cartTotalCostLabel.text = "₺\(String(totalCost))"
    }
}

extension CartViewController :PresenterToViewCartProtocol{
    func sendDataToView(foodList: Array<CartFoods>) {
        self.foodsList = foodList
        DispatchQueue.main.async {
            self.cartTableView.reloadData()
            self.totalCost()
        }
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foodsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.foodNameLabel.text = food.yemek_adi!
        cell.foodPieceAndCostLabel.text = "Piece: \(food.yemek_siparis_adet!)   Cost: ₺\(food.yemek_fiyat!) "
        cell.showImages(imageName: food.yemek_resim_adi!)
        
        cell.layer.borderColor = UIColor.white.cgColor
        cell.doodCartImageView.layer.borderColor = UIColor(named: "butonColor")?.cgColor
        cell.doodCartImageView.layer.borderWidth = 2.0
        cell.doodCartImageView.layer.cornerRadius = 40
       
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, bool) in
                let food = self.foodsList[indexPath.row]
                
                let alert = UIAlertController(title: "Delete", message: "\(food.yemek_adi!) should you delete ?", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                  
                }
                alert.addAction(cancelAction)

                let yesAction = UIAlertAction(title: "yes", style: .destructive) { (action) in
                        self.cartPresenterObject?.delete(sepet_yemek_id: food.sepet_yemek_id!, kullanici_adi: food.kullanici_adi!)
                        print("\(food.yemek_adi!) deleted")
                
                    
                }
                alert.addAction(yesAction)
           
              self.present(alert, animated: true)
             
        }
        deleteAction.image = UIImage(named: "deleteIcon")
        deleteAction.backgroundColor = UIColor.red
        return UISwipeActionsConfiguration(actions: [deleteAction])
 }
}
