import { StyleProp, ViewProps, ViewStyle } from "react-native";

const availableColors = [
  "red",
  "orange",
  "yellow",
  "green",
  "mint",
  "teal",
  "cyan",
  "blue",
  "indigo",
  "purple",
  "pink",
  "brown",
  "white",
  "gray",
  "black",
] as const;

export type AvailableColor = (typeof availableColors)[number];

export type SelectedIndexChangeEvent = {
  onSelectedIndexChange: number;
};

export type NativeImageCarouselProps = ViewProps & {
  pageWidth?: number;
  pageSpacing?: number;
  style?: StyleProp<ViewStyle>;
  images: string[];
  thumbnailBoarderColor?: AvailableColor;
  onSelectedIndexChange?: (selectedIndex: number) => void;
  onEvent: (event: { nativeEvent: Partial<SelectedIndexChangeEvent> }) => void;
};
