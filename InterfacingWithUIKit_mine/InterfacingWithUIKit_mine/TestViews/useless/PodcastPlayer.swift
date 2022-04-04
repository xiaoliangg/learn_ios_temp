//
//  PodcastPlayer.swift
//  InterfacingWithUIKit_mine
//
//  Created by yl on 2022/4/4.
//

import Foundation

final class PodcastPlayer: ObservableObject {
    @Published private(set) var isPlaying: Bool = false

    func play() {
        isPlaying = true
    }

    func pause() {
        isPlaying = false
    }
}
