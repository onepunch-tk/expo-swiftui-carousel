//
//  NativeCarouselView.swift
//  ImageCarousel
//
//  Created by Taekyung-Ha on 10/14/24.
//

import SwiftUI

struct ImageCarouselView: View {
  @ObservedObject var props: ImageCarouselProps

  var body: some View {
    GeometryReader {
      /// 부모 뷰의 사이즈를 가져온다
      let size = $0.size
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(spacing: props.pageSpacing) {
          ForEach(0 ..< 10, id: \.self) { _ in
            RoundedRectangle(cornerRadius: 10)
              .frame(width: props.pageWidth, height: size.height)
              .foregroundColor(.black)
          }
        }
        .background {
          SnapCarouselHelper()
        }
      } //: SCROLL VIEW
    } //: GEOMETRY READER
  }
}
