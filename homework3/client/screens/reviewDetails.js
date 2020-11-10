import React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import { globalStyles } from '../styles/global';
import Card from '../shared/card';

export default function ReviewDetails({ route, navigation }) {
    return (
        <View style={globalStyles.container}>
            <Card>
                <Text><strong>{ route.params.id }</strong></Text>
                <Text>{ route.params.building } Package { route.params.deskid }</Text>
                <Text>Recipient: { route.params.firstname + " " + route.params.lastname }</Text>
                <Text>{ route.params.status }</Text>
            </Card>
        </View>
    );
}
