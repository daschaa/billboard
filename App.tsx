import React from 'react';
import {NativeModules, SafeAreaView, TextInput, Text} from 'react-native';

const {AppDelegate} = NativeModules;

const App = () => {
  return (
    <SafeAreaView
      style={{
        flexGrow: 1,
        justifyContent: 'center',
        alignItems: 'center',
        flexDirection: 'row',
      }}>
      <Text
        style={{
          marginRight: 10,
        }}>
        📝
      </Text>
      <TextInput
        style={{
          width: '80%',
          borderColor: 'transparent',
          borderBottomWidth: 1,
          borderBottomColor: '#7d7d7d',
        }}
        selectionColor={'grey'}
        placeholderTextColor={'#a0a0a0'}
        placeholder={'Type your own billboard!'}
        onChangeText={AppDelegate.changeStatusBarTitle}
      />
    </SafeAreaView>
  );
};

export default App;
