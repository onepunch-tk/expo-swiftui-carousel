import { ComponentType } from "react";
import { requireNativeViewManager } from "expo-modules-core";
import { NativeImageCarouselProps } from "@/modules/image-carousel/src/types";

const NativeImageCarousel: ComponentType<NativeImageCarouselProps> =
  requireNativeViewManager("ImageCarousel");

export function ImageCarousel({
  pageWidth,
  pageSpacing,
  style,
}: NativeImageCarouselProps) {
  return (
    <NativeImageCarousel
      style={{ ...(style as object) }}
      pageWidth={pageWidth}
      pageSpacing={pageSpacing}
    />
  );
}
