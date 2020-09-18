/**
 * Author: Andrew Feikema
 * Date: Sept. 9, 2020
 */

import { StatusBar } from 'expo-status-bar';
import React, { useState } from 'react';
import { Button, FlatList, StyleSheet, Text, TextInput, View, TouchableOpacity } from 'react-native';

export default function App() {
  const [name, setName] = useState('Andrew');
  const [birthdays, setBirthdays] = useState([]);
  const [NewAge, setNewAge] = useState(0);

  return (
    <View style={styles.container}>
      <Text>Enter Name:</Text>
      <TextInput style={styles.input} placeholder= 'Name' onChangeText={(val)=>setName(val)}></TextInput>
      <Text>{name} is {NewAge} years old.</Text>
      <View style={styles.buttonContainer}>
        <TouchableOpacity onPress={()=>{
          setNewAge(NewAge + 1);
          setBirthdays(birthdays.concat({key: (NewAge + 1).toString()})); 
          }}>
          <Text style={styles.buttontext}>Birthday</Text>
        </TouchableOpacity>
      </View>
      <FlatList data={birthdays}  keyExtractor={(item) => item.key } renderItem={({ item }) => (<Text>{item.key}</Text>)}>

      </FlatList>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: 300
  },
  buttonContainer: {
    margin: 20,
    padding: 5,
    backgroundColor: '#24d',
    borderRadius: 5,
    shadowOpacity: 1,
    shadowOffset: {width: 3, height: 1 },
    color: '#fff'
  },

  input: {
    borderWidth: 1,
    borderColor: '#777',
    padding: 8,
    margin: 10,
    width: 200
  },
  buttontext: {
    color: 'white'
  }
});
