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
  locations: {id: string, name: string}[];
}

const SelectLocation: React.FC<SelectLocationProps> = ({ locations }) => {
  const { setProperty } = usePropertyStore();

  return (
    <Select onValueChange={(value) => setProperty(value)}>
      <SelectTrigger className="w-full sm:w-[180px] md:w-[300px] lg:w-[350px] bg-white text-black border border-gray-300">
        <SelectValue placeholder={"Escolha uma localização"} />
      </SelectTrigger>
      <SelectContent>
        {locations.map((location, index) => (
          <SelectItem key={index} value={location.id}>
            {location.name}
          </SelectItem>
        ))}
      </SelectContent>
    </Select>
  );
};

export default SelectLocation;
