import Header from "@/components/ui/header/hearder";
import SelectLocation from "@/components/ui/selects/SelectLocation";

const locations = [
  "Minha localização",
  "Fazenda Sol Nascente",
  "Fazenda Laranjal",
];

export default function ScheduleHeader() {
  return (
    <Header title="Calendário de Pulverizações">
      <SelectLocation locations={locations} />
    </Header>
  );
}
