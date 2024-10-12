import ExpoModulesCore

public class NativeCarouselModule: Module {
  public func definition() -> ModuleDefinition {
    Name("NativeCarousel")
    // "hello" 를 리턴하는 swift 함수.
    Function("hello") { () -> String in
      "hello"
    }
  }
}
