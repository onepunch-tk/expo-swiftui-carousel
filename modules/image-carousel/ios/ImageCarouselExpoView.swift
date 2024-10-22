import ExpoModulesCore
import SwiftUI

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class ImageCarouselExpoView: ExpoView {
  let props: ImageCarouselProps
  let onEvent = EventDispatcher()
  
  required init(appContext: AppContext? = nil) {
    props = ImageCarouselProps(onEvent: onEvent)
    super.init(appContext: appContext)
           
    let hostingController = UIHostingController(rootView: ImageCarouselView(props: props))
    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    hostingController.view.backgroundColor = .clear
           
    addSubview(hostingController.view)
           
    NSLayoutConstraint.activate([
      hostingController.view.topAnchor.constraint(equalTo: topAnchor),
      hostingController.view.bottomAnchor.constraint(equalTo: bottomAnchor),
      hostingController.view.leftAnchor.constraint(equalTo: leftAnchor),
      hostingController.view.rightAnchor.constraint(equalTo: rightAnchor)
    ])
  }
}
