import React, { useState } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, FlatList, Button } from 'react-native';
import { globalStyles } from '../styles/global';

export default function Home({ navigation }) {
    const [reviews, setReviews] = useState([
        {title: 'Book A', rating: 4, body: "This is a book", key: '1'},
        {title: 'Book B', rating: 3, body: "This is a book", key: '2'},
        {title: 'Book C', rating: 5, body: "This is a book", key: '3'}
    ]);

    const toAbout = () => { navigation.navigate("About")}

    return ( 
        <View style={globalStyles.container}>
            <Button title="Go to About" onPress={toAbout}></Button>
            <FlatList data={reviews} renderItem={({ item }) => (
                <TouchableOpacity onPress={() => navigation.navigate('ReviewDetails', item)}>
                    <Text style={globalStyles.titleText}>{ item.title }</Text>
                </TouchableOpacity>
            )} />
            
        </View>
    );
}
