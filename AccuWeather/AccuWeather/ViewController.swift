//
//  ViewController.swift
//  AccuWeather
//
//  Created by Furkan Beyhan on 6.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: Private Properties
    private let networkManager = NetworkManager.shared
    private var dailyForecastsArray: [DailyForecasts] = []
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getFiveDaysForecasts()
        self.configureCollectionView()
        self.configureView()
    }
    
    private func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func configureView(){
        weatherImageView.image = #imageLiteral(resourceName: "mostly sunny")
        degreeLabel.text = "Bursa"
        descriptionLabel.text = "5 Günlük Hava Durumu"
    }
    
    func getFiveDaysForecasts(with locationId: String = "317350"){
        
        networkManager.request(target: .forecasts(locationId), responseType: AccuWeather.self, successCompletion: { (responseObject) in
            self.dailyForecastsArray = responseObject.DailyForecasts
            self.collectionView.reloadData()
        }) { (error) in
            // TODO: Show error message on UI
            print(error.localizedDescription)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dailyForecastsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        let dailyForecast = self.dailyForecastsArray[indexPath.row]
        cell.data = dailyForecast
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dailyForecast = dailyForecastsArray[indexPath.row]
        
        weatherImageView.image = dailyForecast.Day.IconPhrase.icon
        degreeLabel.text = dailyForecast.Temperature.Minimum.celciusValue + ""
        descriptionLabel.text = dailyForecast.Day.IconPhrase.description
    }
}
