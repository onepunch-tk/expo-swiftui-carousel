import { SafeAreaView, Text, View } from "react-native";
import { ImageCarousel } from "@/modules/image-carousel";

function Home() {
  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View
        style={{
          flex: 1,
          justifyContent: "space-between",
          paddingVertical: 20,
        }}
      >
        <View style={{ height: 200 }}>
          <Text>Hello</Text>
        </View>
        <View style={{ height: 120 }}>
          <ImageCarousel style={{ flex: 1 }} pageSpacing={10} pageWidth={100} />
        </View>
      </View>
    </SafeAreaView>
  );
}

export default Home;
