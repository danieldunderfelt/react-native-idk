const Idk = require('./NativeIdk').default;

export function multiply(a: number, b: number): number {
  return Idk.multiply(a, b);
}
