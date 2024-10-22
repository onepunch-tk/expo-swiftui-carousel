//
//  ImageCarouselProps.swift
//  ImageCarousel
//
//  Created by Taekyung-Ha on 10/15/24.
//

import ExpoModulesCore
import SwiftUI

class ImageCarouselProps: ObservableObject {
  @Published var pageWidth: CGFloat = 100
  @Published var pageSpacing: CGFloat = 10
  @Published var images: [String] = []
  @Published var thumbnailBoarderColor: String = "black"
  @Published var onEvent: EventDispatcher

  var overlayBoarderColor: Color {
    switch thumbnailBoarderColor {
    case "red":
      return .red
    case "orange":
      return .orange
    case "yellow":
      return .yellow
    case "green":
      return .green
    case "mint":
      if #available(iOS 15.0, *) {
        return .mint
      } else {
        return .green // iOS 15 미만에서는 대체 색상 사용
      }
    case "teal":
      if #available(iOS 15.0, *) {
        return .teal
      } else {
        return .blue // iOS 15 미만에서는 대체 색상 사용
      }
    case "cyan":
      if #available(iOS 15.0, *) {
        return .cyan
      } else {
        return .blue // iOS 15 미만에서는 대체 색상 사용
      }
    case "blue":
      return .blue
    case "indigo":
      if #available(iOS 15.0, *) {
        return .indigo
      } else {
        return .blue // iOS 15 미만에서는 대체 색상 사용
      }
    case "purple":
      return .purple
    case "pink":
      return .pink
    case "brown":
      if #available(iOS 15.0, *) {
        return .brown
      } else {
        return .gray // iOS 15 미만에서는 대체 색상 사용
      }
    case "white":
      return .white
    case "gray":
      return .gray
    case "black":
      return .black
    default:
      return .black // 기본값
    }
  }

  init(onEvent: EventDispatcher) {
    self.onEvent = onEvent
  }
}
