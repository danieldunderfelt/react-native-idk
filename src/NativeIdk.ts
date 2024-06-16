import type { TurboModule } from 'react-native'
import { TurboModuleRegistry } from 'react-native'

export interface Spec extends TurboModule {
  generate(inputString: string): Promise<string>
  loadModel(modelName: string): Promise<void>
}

export default TurboModuleRegistry.getEnforcing<Spec>('Idk')
