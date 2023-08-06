import { Application } from '@hotwired/stimulus'

export declare global {
  // eslint-disable-next-line @typescript-eslint/consistent-type-definitions
  interface Window {
    Stimulus: Application
  }
}
