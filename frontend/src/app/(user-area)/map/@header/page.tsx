import Header from "@/components/ui/header/hearder";
import NewPulverizationPopover from "@/components/ui/popovers/NewPulverizationPopover";
import SelectLocation from "@/components/ui/selects/SelectLocation";

const locations = [
  { id: "1", name: "Minha localização" },
  { id: "2", name: "Fazenda Sol Nascente" },
  { id: "3", name: "Fazenda Laranjal" },
];

export default function MapHeader() {
  return (
    <Header title="Mapa de Pulverizações">
      <SelectLocation locations={locations} />
      <NewPulverizationPopover />
    </Header>
  );
}
