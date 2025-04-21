import { create } from "zustand";

type PropertyStore = {
  property: string | null;
  coordinates: [Number, Number] | null;
  setProperty: (value: string) => void;
  setCoordinates: (value: [Number, Number]) => void;
};

export const usePropertyStore = create<PropertyStore>((set) => ({
  property: null,
  coordinates: null,
  setProperty: (value) => set({ property: value }),
  setCoordinates: (value) => set({ coordinates: value }),
}));
