/**
 * addToWallet method parameters
 */
export interface IAddToWalletOptions {
  base64PassesContent: string[];
}


/**
 * Capacitor plugin for adding passes to Google & Apple wallets
 */
export interface CapacitorPassToWalletPlugin {
  /**
   * Adds one or more passes to the wallet
   * @param options
   */
  addToWallet(options: IAddToWalletOptions): Promise<void>;
}

