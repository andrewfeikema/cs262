import React from 'react';
import { StyleSheet, View, Text, Button } from 'react-native';
import { globalStyles } from '../styles/global';

export default function ReviewDetails({ route, navigation }) {
    const pressHandler = () => {
        navigation.goBack();
    }
    
    return (
        <View style={globalStyles.container}>
            <Text>{ route.params.title }</Text>
            <Text>{ route.params.body }</Text>
            <Text>{ route.params.rating }</Text>
            <Button title="Back to Home" onPress={pressHandler}></Button>
        </View>
    );
}
