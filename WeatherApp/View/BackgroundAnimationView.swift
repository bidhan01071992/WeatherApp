//
//  BackgroundAnimationView.swift
//  WeatherApp
//
//  Created by Bidhan Chandra Roy on 21/02/24.
//

import Lottie
import SwiftUI

struct BackgroundAnimationView: View {
    @State var model: AnimationModel

    var body: some View {
        VStack{
            LottieView(animationFileName: model.weatherBackground.rawValue, loopMode: .loop)
                .frame(width: 200, height: 200)
        }
    }
}

enum WeatherBackground: String {
    case ThunderStorm
    case SnowFall
    case Cloudy
    case Sunny
    case Rain
    case Default
}

struct AnimationModel {
    var weatherBackground: WeatherBackground
}

struct LottieView: UIViewRepresentable {
    
    var animationFileName: String
    let loopMode: LottieLoopMode
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: animationFileName)
        animationView.loopMode = loopMode
        animationView.play()
        animationView.contentMode = .scaleAspectFill
        return animationView
    }
}
