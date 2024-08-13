//
//  VideoPlayerHelper.swift
//  IndoWilderness
//
//  Created by Farih Muhammad on 13/08/2024.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    if let file = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: file)
        videoPlayer?.play()
    }
    return videoPlayer!
}
