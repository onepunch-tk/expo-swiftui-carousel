// NativeCarouselModule 을 선언하는 코드. src 디렉터리에는 아무런 ts 파일이 없음. 여기서 선언해야함.
import { requireNativeModule } from "expo-modules-core";

// NativeCarouselModule 선언
const NativeCarouselModule = requireNativeModule("NativeCarousel");

// hello 함수 export
export function hello(): string {
  return NativeCarouselModule.hello();
}

// 전체 모듈을 default export로 내보내기
export default NativeCarouselModule;
