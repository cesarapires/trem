"use client";

import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { usePropertyStore } from "@/store/property-store";

interface SelectLocationProps {
  locations: {
    id: string;
    name: string;
    coordinates: { latitude: number; longitude: number };
  }[];
}

const SelectLocation: React.FC<SelectLocationProps> = ({ locations }) => {
  const { setProperty, setCoordinates } = usePropertyStore();

  const handleChange = (value: string) => {
    const selectedLocation = locations.find((location) => location.id === value);

    const latitude = selectedLocation?.coordinates.latitude ?? 0;
    const longitude = selectedLocation?.coordinates.longitude ?? 0;

    if (selectedLocation) {
      setProperty(selectedLocation.id);
      setCoordinates([latitude, longitude]);
    }
  };

  return (
    <Select onValueChange={handleChange}>
      <SelectTrigger className="w-full sm:w-[180px] md:w-[300px] lg:w-[350px] bg-white text-black border border-gray-300">
        <SelectValue placeholder={"Escolha uma localização"} />
      </SelectTrigger>
      <SelectContent>
        {locations.map((location, index) => (
          <SelectItem
            key={index}
            data-coordinates={location.coordinates}
            value={location.id}
          >
            {location.name}
          </SelectItem>
        ))}
      </SelectContent>
    </Select>
  );
};

export default SelectLocation;
