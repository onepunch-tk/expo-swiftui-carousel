import ExpoModulesCore
import SwiftUI

struct SnapCarouselHelper: UIViewRepresentable {
  var pageWidth: CGFloat
  var pageSpacing: CGFloat
  var onEvent: EventDispatcher
  /// page count 동기화용 바인딩 변수
  @Binding var pageCount: Int

  func makeUIView(context: Context) -> UIView {
    UIView()
  }

  func updateUIView(_ uiView: UIView, context: Context) {
    DispatchQueue.main.async {
      if let scrollView = uiView.superview?.superview?.superview as? UIScrollView {
        scrollView.decelerationRate = .fast
        scrollView.delegate = context.coordinator

//        context.coordinator.pageCount = pageCount
//        context.coordinator.pageWidth = pageWidth
//        context.coordinator.pageSpacing = pageSpacing

      } else {
        print("scrollView Not Found")
      }
    }
  }

  func makeCoordinator() -> Coordinator {
    return Coordinator(parent: self)
  }

  class Coordinator: NSObject, UIScrollViewDelegate {
    var parent: SnapCarouselHelper
//    var pageCount: Int = 0
//    var pageWidth: CGFloat = 0
//    var pageSpacing: CGFloat = 0
//    var onEvent: EventDispatcher

    init(parent: SnapCarouselHelper) {
      self.parent = parent
      // self.onEvent = parent.onEvent
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {}

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
      /// Adding velocity too, for making perfect scroll animation
      // 이미지 너비와 간격을 합친 전체 아이템 너비 계산
      let totalItemWidth = parent.pageWidth + parent.pageSpacing

      // 현재 콘텐츠 오프셋에 속도를 고려한 예상 이동 거리를 더해 목표 지점을 계산
      // velocity.x * 60은 대략적으로 스크롤이 자연스럽게 감속되는 거리를 추정
      let targetEnd = scrollView.contentOffset.x + (velocity.x * 60)

      // 목표 지점을 페이지 너비로 나누어 가장 가까운 페이지 인덱스를 계산
      // rounded()를 사용하여 가장 가까운 정수로 반올림
      let targetIndex = (targetEnd / totalItemWidth).rounded()

      // 선택된 이미지 Index update
      let index = min(max(Int(targetIndex), 0), parent.pageCount - 1)
      // parent.selectedIndex = index
      parent.onEvent(["onSelectedIndexChange": index])

      // 최종 목표 위치 계산 (간격 고려)
      let finalOffset = targetIndex * totalItemWidth

      // 계산된 targetIndex를 사용하여 실제 스크롤 위치 조정
      targetContentOffset.pointee.x = finalOffset
      print(parent.pageCount)
      print(parent.pageWidth)
      print(parent.pageSpacing)
      print(parent.onEvent)
    }
  }
}
