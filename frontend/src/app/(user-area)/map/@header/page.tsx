import { Button } from "@/components/ui/button";
import Header from "@/components/ui/header/hearder";
import SelectLocation from "@/components/ui/selects/SelectLocation";
import { Plus } from "@mynaui/icons-react";

const locations = [
  "Minha localização",
  "Fazenda Sol Nascente",
  "Fazenda Laranjal",
];

export default function MapHeader() {
  return (
    <Header title="Mapa de Pulverizações">
      <SelectLocation locations={locations} />
      <Button variant="secondary" className="inline-flex items-center gap-2">
        <Plus /> Nova pulverização
      </Button>
    </Header>
  );
}
