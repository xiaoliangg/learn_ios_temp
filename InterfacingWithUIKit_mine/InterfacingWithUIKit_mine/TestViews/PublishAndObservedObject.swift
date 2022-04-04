//
//  PublishAndObservedObject.swift
//  @Published,@ObservedObject,ObservedObject协议 示例

import SwiftUI

struct PublishAndObservedObject: View {
    @ObservedObject var player: PodcastPlayer

    var body: some View {
        List {
            Button(
                action: {
                    if self.player.isPlaying {
                        self.player.pause()
                    } else {
                        self.player.play()
                    }
            }, label: {
                    Text(player.isPlaying ? "Pause": "Play")
                }
            )
        }
    }
}

struct PublishAndObservedObject_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        PublishAndObservedObject(player:PodcastPlayer())
    }
}

