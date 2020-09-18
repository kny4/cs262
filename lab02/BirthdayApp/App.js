import { StatusBar } from 'expo-status-bar';
import React, { useState } from 'react';
import { StyleSheet, Text, View, TextInput, Button, FlatList} from 'react-native';

export default function App() {
  const [name, setName] = useState('John Doe');
  const [age, setAge] = useState(0);
  const [newAge, setNewAge] = useState(1);
  const [birthdays, setBirthdays] = useState([]);
  
  const clickHandler = () => {
    setAge(age + 1)
    setNewAge(newAge + 1)
    setBirthdays(
      birthdays.concat({key: newAge.toString()})
  )
  }

  return (
    <View style={styles.container}>
      
      <Text>Enter name:</Text>
      <TextInput 
        style={styles.input}
        placeholder='e.g. John Doe'
        onChangeText={(val) => setName(val)}
      />
      <Text>{name} is {age} years old.</Text>
      <Button 
        title='Birthday' onPress={clickHandler} 
      />        
      <FlatList 
        data={birthdays}
        renderItem={({ item }) => (
        <Text style={styles.item}>{item.key}</Text>
        )}
      />
      <StatusBar style="auto"/>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    paddingTop: 40,
    paddingHorizontal: 20,
    alignItems: 'center',
    justifyContent: 'center',
  },

  input: {
    borderWidth: 1,
    borderColor: '#777',
    padding: 8,
    margin: 10,
    width: 200,
  },

  item: {
    marginTop: 5,
    marginHorizontal: 100,
    fontSize: 12,
  }
 
});
