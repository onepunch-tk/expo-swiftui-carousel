import React, { useState } from "react";
import { SafeAreaView, View } from "react-native";
import { Image } from "expo-image";
import { ImageCarousel } from "@/modules/image-carousel";
import Animated, {
  Easing,
  runOnJS,
  useAnimatedStyle,
  useSharedValue,
  withTiming,
} from "react-native-reanimated";

const images = [
  "Pic1",
  "Pic2",
  "Pic3",
  "Pic4",
  "Pic5",
  "Pic6",
  "Pic7",
  "Pic8",
  "Pic9",
  "Pic10",
  "https://cdn.pixabay.com/photo/2023/06/14/23/12/sunset-8064078_1280.jpg",
  "https://cdn.pixabay.com/photo/2024/06/05/19/45/mountains-8811206_1280.jpg",
];

const AnimatedImage = Animated.createAnimatedComponent(Image);

function Home() {
  const [selectedImage, setSelectedImage] = useState(0);
  const opacity = useSharedValue(1);

  const animatedStyle = useAnimatedStyle(() => {
    return {
      opacity: opacity.value,
    };
  });

  const handleSelectedImage = (selectedIndex: number) => {
    opacity.value = withTiming(
      0,
      {
        duration: 100,
        easing: Easing.inOut(Easing.ease),
      },
      (finished) => {
        if (finished) {
          runOnJS(setSelectedImage)(selectedIndex);

          opacity.value = withTiming(1, {
            duration: 100,
            easing: Easing.inOut(Easing.ease),
          });
        }
      }
    );
  };

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View
        style={{
          flex: 1,
          justifyContent: "space-between",
          paddingVertical: 20,
        }}
      >
        <View
          style={{
            flex: 1,
            paddingVertical: 15,
            justifyContent: "flex-start",
          }}
        >
          <AnimatedImage
            style={[{ height: 300 }, animatedStyle]}
            source={images[selectedImage]}
            contentFit={"cover"}
          />
        </View>
        <View style={{ height: 120 }}>
          <ImageCarousel
            style={{ flex: 1 }}
            pageSpacing={10}
            pageWidth={100}
            images={images}
            thumbnailBoarderColor={"purple"}
            onSelectedIndexChange={handleSelectedImage}
          />
        </View>
      </View>
    </SafeAreaView>
  );
}

export default Home;
