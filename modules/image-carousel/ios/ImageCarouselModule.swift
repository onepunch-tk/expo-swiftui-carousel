import ExpoModulesCore

public class ImageCarouselModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ImageCarousel")

    View(ImageCarouselExpoView.self) {
      Events("onEvent")

      Prop("pageWidth") { (view: ImageCarouselExpoView, pageWidth: CGFloat) in
        view.props.pageWidth = pageWidth
      }

      Prop("pageSpacing") { (view: ImageCarouselExpoView, pageSpacing: CGFloat) in
        view.props.pageSpacing = pageSpacing
      }

      Prop("images") { (view: ImageCarouselExpoView, images: [String]) in
        view.props.images = images
      }

      Prop("thumbnailBoarderColor") { (view: ImageCarouselExpoView, thumbnailBoarderColor: String) in
        view.props.thumbnailBoarderColor = thumbnailBoarderColor
      }
    }
  }
}
