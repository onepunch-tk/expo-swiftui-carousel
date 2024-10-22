import { ComponentType } from "react";
import { requireNativeViewManager } from "expo-modules-core";
import { NativeImageCarouselProps } from "@/modules/image-carousel/src/types";

const NativeImageCarousel: ComponentType<NativeImageCarouselProps> =
  requireNativeViewManager("ImageCarousel");

export function ImageCarousel({
  pageWidth,
  pageSpacing,
  style,
  images,
  thumbnailBoarderColor,
  onSelectedIndexChange,
}: Omit<NativeImageCarouselProps, "onEvent">) {
  return (
    <NativeImageCarousel
      style={{ ...(style as object) }}
      pageWidth={pageWidth}
      pageSpacing={pageSpacing}
      images={images}
      thumbnailBoarderColor={thumbnailBoarderColor}
      onEvent={({ nativeEvent }) => {
        const selectedIndex = nativeEvent.onSelectedIndexChange;
        if (selectedIndex !== undefined && onSelectedIndexChange) {
          onSelectedIndexChange(selectedIndex);
        }
      }}
    />
  );
}
