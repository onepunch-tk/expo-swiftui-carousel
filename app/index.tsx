import { Text, View } from "react-native";
import { hello } from "@/modules/native-carousel";

function Home() {
  return (
    <>
      <View style={{ flex: 1, alignItems: "center", justifyContent: "center" }}>
        <Text>{hello()}</Text>
      </View>
    </>
  );
}

export default Home;
