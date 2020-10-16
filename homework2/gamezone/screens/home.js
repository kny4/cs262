import React, { useState, useEffect } from 'react';
import { ActivityIndicator, StyleSheet, View, Text, TouchableOpacity, FlatList } from 'react-native';
import { globalStyles } from '../styles/global';
import Card from '../shared/card';

//modified from Lab05 to fetch data from Monopoly Service hosted on Heroku
export default function Home({ navigation }) {
    const [isLoading, setLoading] = useState(true);
    const [data, setData] = useState([]);
  
    useEffect(() => {
      fetch('https://cs262-monopoly-service.herokuapp.com/players/')
          .then((response) => response.json())
          .then((json) => setData(json))
          .catch((error) => console.error(error))
          .finally(() => setLoading(false));
    }, []);

    return (
        <View style={globalStyles.container}>
                <FlatList 
                    data={data} 
                    keyExtractor={({ id }, index) => id.toString()}
                    renderItem={({ item }) => (
                    <TouchableOpacity onPress={() => navigation.navigate('ReviewDetails', {id: item.id, email: item.email, name: item.name})}>
                        <Card>
                            <Text style={globalStyles.titleText}>{ item.email }</Text>
                        </Card>
                    </TouchableOpacity>
                    )} 
                />
        </View>
    );
}