import Header from "@/components/ui/header/hearder";
import NewPulverizationPopover from "@/components/ui/popovers/NewPulverizationPopover";
import SelectLocation from "@/components/ui/selects/SelectLocation";

const locations = [
  { id: "399821bb-1db2-40ac-9705-7507681d47dc", name: "Minha localização" },
  { id: "b8389d16-3e43-4207-a02f-45f821b39042", name: "Fazenda Sol Nascente" },
  { id: "190cf364-9e35-4ce6-bc48-e7a0821a6db2", name: "Fazenda Laranjal" },
];

export default function MapHeader() {
  return (
    <Header title="Mapa de Pulverizações">
      <SelectLocation locations={locations} />
      <NewPulverizationPopover />
    </Header>
  );
}
