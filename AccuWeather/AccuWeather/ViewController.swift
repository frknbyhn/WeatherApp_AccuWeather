//
//  ViewController.swift
//  AccuWeather
//
//  Created by Furkan Beyhan on 6.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var dataList = [DailyForecasts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callData()
        
        weatherImageView.image = #imageLiteral(resourceName: "mostly sunny")
        degreeLabel.text = "Bursa"
        descriptionLabel.text = "5 Günlük Hava Durumu"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
    }
    func callData(){
        Alamofire.request("http://dataservice.accuweather.com/forecasts/v1/daily/5day/317350?apikey=XWGnIsVQgVO9FOZPf8cgsRdGvQG4rGHF", method: .get).responseJSON { (responseData) in
            if((responseData.result.value) != nil ){
                let decoder = JSONDecoder()
                let response = try! decoder.decode(AccuWeather.self, from: responseData.data!)
                self.dataList = response.DailyForecasts
                self.collectionView.reloadData()
            }
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        let degree = ((dataList[indexPath.row].Temperature.Minimum.Value)-32)/1.8
        
        let roundedDegree = String(format: "%.f", degree)
        
        cell.descriptionLabel.text = dataList[indexPath.row].Day.IconPhrase
        
        cell.dateLabel.text = String("\(roundedDegree)°")
        
        
        if dataList[indexPath.row].Day.IconPhrase == "Intermittent clouds"{
            cell.collectionImageView.image = #imageLiteral(resourceName: "cloudy")
        }else if dataList[indexPath.row].Day.IconPhrase == "Partly cloudy"{
            cell.collectionImageView.image = #imageLiteral(resourceName: "partly cloudy")
        }else if dataList[indexPath.row].Day.IconPhrase == "Partly sunny"{
            cell.collectionImageView.image = #imageLiteral(resourceName: "partly cloudy")
        }else if dataList[indexPath.row].Day.IconPhrase == "Clear"{
            cell.collectionImageView.image = #imageLiteral(resourceName: "mostly sunny")
        }else if dataList[indexPath.row].Day.IconPhrase == "Mostly sunny"{
            cell.collectionImageView.image = #imageLiteral(resourceName: "mostly sunny")
        }else if dataList[indexPath.row].Day.IconPhrase == "Mostly cloudy"{
            cell.collectionImageView.image = #imageLiteral(resourceName: "cloudywithshower")
        }else if dataList[indexPath.row].Day.IconPhrase == "Mostly cloudy"{
            cell.collectionImageView.image = #imageLiteral(resourceName: "cloudy")
        }else if dataList[indexPath.row].Day.IconPhrase == "Sunny"{
            cell.collectionImageView.image = #imageLiteral(resourceName: "mostly sunny")
        }else if dataList[indexPath.row].Day.IconPhrase == "Showers"{
            cell.collectionImageView.image = #imageLiteral(resourceName: "cloudywithshower.png")
        }
        
//        cell.contentView.layer.cornerRadius = 10
//        cell.contentView.layer.borderWidth = 1.0
//        cell.contentView.layer.borderColor = UIColor.black.cgColor
//        cell.contentView.layer.masksToBounds = true
//        cell.layer.shadowColor = UIColor.cyan.cgColor
//        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        cell.layer.shadowRadius = 2.0
//        cell.layer.shadowOpacity = 1.0
//        cell.layer.masksToBounds = false
//        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = dataList[indexPath.row]
    
        if dataList[indexPath.row].Day.IconPhrase == "Intermittent clouds"{
            weatherImageView.image = #imageLiteral(resourceName: "cloudy")
        }else if dataList[indexPath.row].Day.IconPhrase == "Partly cloudy"{
            weatherImageView.image = #imageLiteral(resourceName: "partly cloudy")
        }else if dataList[indexPath.row].Day.IconPhrase == "Partly sunny"{
            weatherImageView.image = #imageLiteral(resourceName: "partly cloudy")
        }else if dataList[indexPath.row].Day.IconPhrase == "Clear"{
            weatherImageView.image = #imageLiteral(resourceName: "mostly sunny")
        }else if dataList[indexPath.row].Day.IconPhrase == "Mostly sunny"{
            weatherImageView.image = #imageLiteral(resourceName: "mostly sunny")
        }else if dataList[indexPath.row].Day.IconPhrase == "Mostly cloudy"{
            weatherImageView.image = #imageLiteral(resourceName: "cloudywithshower")
        }else if dataList[indexPath.row].Day.IconPhrase == "Mostly cloudy"{
            weatherImageView.image = #imageLiteral(resourceName: "cloudy")
        }else if dataList[indexPath.row].Day.IconPhrase == "Sunny"{
            weatherImageView.image = #imageLiteral(resourceName: "mostly sunny")
        }else if dataList[indexPath.row].Day.IconPhrase == "Showers"{
            weatherImageView.image = #imageLiteral(resourceName: "cloudywithshower.png")
        }
        
        let degree = ((dataList[indexPath.row].Temperature.Minimum.Value)-32)/1.8
        
        let roundedDegree = String(format: "%.f", degree)

        degreeLabel.text = String("\(roundedDegree)°")
        descriptionLabel.text = data.Day.IconPhrase
    
    }

}
