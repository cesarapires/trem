import Header from "@/components/ui/header/hearder";
import SelectLocation from "@/components/ui/selects/SelectLocation";

const locations = [
  { id: "1", name: "Minha localização" },
  { id: "2", name: "Fazenda Sol Nascente" },
  { id: "3", name: "Fazenda Laranjal" },
];

export default function ScheduleHeader() {
  return (
    <Header title="Calendário de Pulverizações">
      <SelectLocation locations={locations} />
    </Header>
  );
}
