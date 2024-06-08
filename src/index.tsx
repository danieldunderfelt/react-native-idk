const Idk = require('./NativeIdk').default

export function generate(input: string): string {
  return Idk.generate(input)
}
