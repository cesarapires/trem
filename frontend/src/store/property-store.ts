import { create } from 'zustand';

type PropertyStore = {
  property: string | null;
  setProperty: (value: string) => void;
};

export const usePropertyStore = create<PropertyStore>((set) => ({
  property: null,
  setProperty: (value) => set({ property: value }),
}));
