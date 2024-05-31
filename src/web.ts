import { WebPlugin } from '@capacitor/core';

import type {CapacitorPassToWalletPlugin, IAddToWalletOptions} from './definitions';

export class CapacitorPassToWalletWeb
  extends WebPlugin
  implements CapacitorPassToWalletPlugin {

  async addToWallet(options: IAddToWalletOptions): Promise<void> {
    console.log(options);
    throw new Error('Not supported');
  }
}
