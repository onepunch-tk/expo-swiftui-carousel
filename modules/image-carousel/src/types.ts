import { StyleProp, ViewProps, ViewStyle } from "react-native";

export type NativeImageCarouselProps = ViewProps & {
  pageWidth?: number;
  pageSpacing?: number;
  style?: StyleProp<ViewStyle>;
};
