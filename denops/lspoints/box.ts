import { deepMerge, DeepMergeOptions } from "./deps/std.ts";

export class PatchableObjectBox<T extends Record<PropertyKey, unknown>> {
  #store: T;
  constructor(defaultValue: T) {
    this.#store = defaultValue;
  }

  get(): T {
    return this.#store;
  }

  set(value: T) {
    this.#store = value;
  }

  patch(value: Partial<T>, options: DeepMergeOptions = {
    arrays: "replace",
  }) {
    this.#store = deepMerge<T>(this.#store, value, options);
  }
}
