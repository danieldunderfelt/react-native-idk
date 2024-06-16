import * as React from 'react'
import { useState } from 'react'

import { Button, StyleSheet, Text, TextInput, View } from 'react-native'
import { generate, loadModel } from 'react-native-idk'

export default function App() {
  const [modelName, setModelName] = useState('')
  const [inputString, setInputString] = useState('')
  const [result, setResult] = useState('')

  const runModel = async () => {
    if (!modelName) {
      return
    }

    await loadModel(modelName)

    const result1 = await generate(inputString)
    setResult(result1)
  }

  return (
    <View style={styles.container}>
      <View style={styles.inputContainer}>
        <TextInput style={styles.input} onChangeText={setModelName} value={modelName} />
        <TextInput style={styles.input} onChangeText={setInputString} value={inputString} />
      </View>
      {modelName && inputString && (
        <View>
          <Button title="Run model" onPress={runModel} />
        </View>
      )}
      {result && <Text>{result}</Text>}
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  inputContainer: {
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'space-between',
    gap: 8,
    width: '100%',
    padding: 16,
  },
  input: {
    width: '100%',
    fontSize: 16,
    color: 'black',
    padding: 8,
    borderWidth: 1,
    borderColor: 'gray',
    borderRadius: 4,
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
})
