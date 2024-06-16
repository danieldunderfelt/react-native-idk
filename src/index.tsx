import { NativeModules, Platform } from 'react-native'

const LINKING_ERROR =
  `The package 'react-native-idk' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n'

// @ts-expect-error
const isTurboModuleEnabled = global.__turboModuleProxy != null

const IdkModule = isTurboModuleEnabled ? require('./NativeIdk').default : NativeModules.Idk

const Idk = IdkModule
  ? IdkModule
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR)
        },
      },
    )

export function generate(input: string): Promise<string> {
  return Idk.generate(input)
}

export function loadModel(modelName: string): Promise<void> {
  return Idk.loadModel(modelName)
}
