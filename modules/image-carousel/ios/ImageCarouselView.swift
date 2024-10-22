//
//  NativeCarouselView.swift
//  ImageCarousel
//
//  Created by Taekyung-Ha on 10/14/24.
//

import SwiftUI

struct ImageCarouselView: View {
  @ObservedObject var props: ImageCarouselProps
  @State var images: [ImageFile] = []

  var body: some View {
    GeometryReader {
      /// 부모 뷰의 사이즈를 가져온다
      let size = $0.size
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(spacing: props.pageSpacing) {
          ForEach($images) { $imageFile in
            if let thumbnail = imageFile.thumbnail {
              Image(uiImage: thumbnail)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: props.pageWidth, height: size.height)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
          }
        }
        /// Page Item이 화면의 절반에서 시작
        .padding(.horizontal, (size.width - props.pageWidth) / 2)
        .background {
          SnapCarouselHelper(
            pageWidth: props.pageWidth,
            pageSpacing: props.pageSpacing,
            onEvent: props.onEvent,
            pageCount: Binding<Int>(
              get: {
                self.images.count
              }, set: { _ in
              }
            )
          )
        }
      } //: SCROLL VIEW
      /// 현재 선택된 page(thumbnail) 테두리
      .overlay {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
          .stroke(props.overlayBoarderColor, lineWidth: 3.5)
          .frame(width: props.pageWidth, height: size.height)
          .allowsHitTesting(false)
      }
    } //: GEOMETRY READER
    // task 수정자는 props.images가 변경될 때마다 실행된다.
    // props.images를 의존성으로 사용하여, 이미지 목록이 변경될 때마다 loadImages() 함수를 비동기적으로 호출한다.
    .task(id: props.images) {
      await loadImages()
    }
  }

  // 각 이미지의 썸네일을 생성하여 메모리 사용을 최적화한다
  func loadImages() async {
    // 이미지 로딩을 시작하기 전에 기존의 모든 이미지를 제거한다.
    // 새로운 이미지 세트로 완전히 교체하기 위함.
    images.removeAll()

    for imageSource in props.images {
      if let uiImage = await loadUIImage(from: imageSource) {
        if let thumbnail = await createThumbnail(from: uiImage) {
          images.append(.init(thumbnail: thumbnail))
        }
      }
    }
  }

  // UIImage를 로드하는 함수
  private func loadUIImage(from source: String) async -> UIImage? {
    // 각 이미지 소스가 유효한 URL인지 확인한다. url.scheme이 nil이 아니면 웹 URL로 간주한다.
    if let url = URL(string: source), url.scheme != nil {
      // URL 이미지
      if let (data, _) = try? await URLSession.shared.data(from: url) {
        return UIImage(data: data)
      }
    } else {
      // 로컬 이미지
      return UIImage(named: source)
    }
    return nil
  }

  // 썸네일을 생성하는 함수
  private func createThumbnail(from image: UIImage) async -> UIImage? {
    return await image.byPreparingThumbnail(ofSize: CGSize(width: 300, height: 300))
  }
}
