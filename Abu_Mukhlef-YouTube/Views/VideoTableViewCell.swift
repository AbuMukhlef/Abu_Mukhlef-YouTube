//
//  VideoTableViewCell.swift
//  Abu_Mukhlef-YouTube
//
//  Created by Abu_Mukhlef on 18/06/2020.
//  Copyright © 2020 Abu_Mukhlef.You. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thummbnailimageView: UIImageView!
  
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        self.video = v
        
        //Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        // Set the title
        self.titleLabel.text = video?.title
        // Set the Date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        
        
        // Set the Thumbanil
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cachedData =  CacheManager.getVideoCache(self.video!.thumbnail) {
            // Set the thumbnail imageview
            self.thummbnailimageView.image = UIImage(data: cachedData)
            
            return
        }
        // Download the thumbanail data
        let url = URL(string: self.video!.thumbnail)
        // Get the shared URL Session object
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, respnse, error) in
            
            if error == nil && data != nil {
                // Save the data in the cache
                CacheManager.setVideo(url!.absoluteString, data)
                
                // Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail {
                    
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was donload
                    return
                    
                }
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.async {
                    self.thummbnailimageView.image = image
                }
            }
            
            
        }
        
        // Start data task
        dataTask.resume()
        
        
    }

}
