import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";


interface SelectLocationProps {
  locations: string[];
}

const SelectLocation: React.FC<SelectLocationProps> = ({ locations }) => {
  return (
    <Select>
      <SelectTrigger className="w-full sm:w-[180px] md:w-[300px] lg:w-[350px] bg-white text-black border border-gray-300">
        <SelectValue placeholder={"Escolha uma localização"} />
      </SelectTrigger>
      <SelectContent>
        {locations.map((location, index) => (
          <SelectItem key={index} value={location}>
            {location}
          </SelectItem>
        ))}
      </SelectContent>
    </Select>
  );
};

export default SelectLocation;
