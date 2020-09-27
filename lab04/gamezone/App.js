import React, { useState } from 'react';
import { AppLoading } from 'expo';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import * as font from 'expo-font'

import Navigator from './routes/homeStack'

const getFonts = () => 
  font.loadAsync({
    'nunito-regular': require('./assets/fonts/Nunito-Regular.ttf'),
    'nunito-bold': require('./assets/fonts/Nunito-Bold.ttf')})


export default function App() {
  const [fontsloaded, setFontsLoaded] = useState(false);
  if (fontsloaded){
  return (
      <NavigationContainer>
          <Navigator />
      </NavigationContainer>
  );} else {
    return <AppLoading startAsync = {getFonts} onFinish={()=>setFontsLoaded(true)}/>
  }
}
