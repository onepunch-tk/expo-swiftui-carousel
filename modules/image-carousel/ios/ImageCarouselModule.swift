import ExpoModulesCore

public class ImageCarouselModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ImageCarousel")

    View(ImageCarouselExpoView.self) {
      Prop("pageWidth") { (view: ImageCarouselExpoView, pageWidth: CGFloat) in
        view.props.pageWidth = pageWidth
      }

      Prop("pageSpacing") { (view: ImageCarouselExpoView, pageSpacing: CGFloat) in
        view.props.pageSpacing = pageSpacing
      }
    }
  }
}
