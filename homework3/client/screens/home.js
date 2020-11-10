import React, { useState, useEffect } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, FlatList, ActivityIndicator } from 'react-native';
import { globalStyles } from '../styles/global';
import Card from '../shared/card';

export default function Home({ navigation }) {
    const [reviews, setPlayers] = useState([]);
    const [isLoading, setLoading] = useState(true);

    useEffect(() => {
        fetch('https://desolate-springs-94651.herokuapp.com')
            .then((response) => response.json())
            .then((json) => {setPlayers(json); console.log(json);})
            .catch((error) => console.error(error))
            .finally(() => setLoading(false));
      }, []);

    return (
        <View style={globalStyles.container}>
            {isLoading ? <ActivityIndicator/> : (
            <FlatList data={reviews} renderItem={({ item }) => (
                <TouchableOpacity onPress={() => navigation.navigate('ReviewDetails', item)}>
                    <Card>
                        <Text style={globalStyles.titleText}>{ "Package " + item.id }</Text>
                    </Card>
                </TouchableOpacity>
            )} />
            )}
        </View>
    );
}
