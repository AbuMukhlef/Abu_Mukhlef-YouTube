//
//  ViewController.swift
//  Abu_Mukhlef-YouTube
//
//  Created by Abu_Mukhlef on 03/06/2020.
//  Copyright © 2020 Abu_Mukhlef.You. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
  
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sat itself as th datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as the delegate of the modle
        model.delegate = self
        
        
        model.getVideos()
        }
    // MARK: - Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
        
        // Set the returned videos to our video property
        self.videos = videos
        // Refresh the tableveiew
            tableView.reloadData()
        
    }
   
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //Configure the cell with the data
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

