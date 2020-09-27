import React from 'react';
import {createStackNavigator} from '@react-navigation/stack';

import Home from '../screens/home';
import ReviewDetails from '../screens/reviewDetails';
import About from '../screens/about';

const Stack = createStackNavigator();
export default function HomeStack() {
    return (
        <Stack.Navigator screenOptions={{headerStyle:{backgroundColor:'#ddd'}}}>
            <Stack.Screen
                name="Home"
                component={Home}
                options={{title: 'GameZone'}}
            />
            <Stack.Screen
                name="ReviewDetails"
                component={ReviewDetails}
                options={{title: 'Review Details'}}
            />
            <Stack.Screen
                name="About"
                component={About}
                options={{title: 'About GameZone'}}
            />
        </Stack.Navigator>
    );
}
