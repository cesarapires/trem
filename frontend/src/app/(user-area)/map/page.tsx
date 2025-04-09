import { Button } from "@/components/ui/button";
import MainContent from "@/components/ui/content/main-content";
import Header from "@/components/ui/header/hearder";
import SelectLocation from "@/components/ui/selects/SelectLocation";
import SidebarContent from "@/components/ui/sidebar/sidebar-content";
import { Plus } from "@mynaui/icons-react";

const locations = [
  "Minha localização",
  "Fazenda Sol Nascente",
  "Fazenda Laranjal",
];

export default function MapaPulverizacoes() {
  return (
    <div className="bg-green-100 min-h-screen flex">
      <SidebarContent />

      <div className="w-3/4 p-4">
        <Header
          title="Mapa de Pulverizações"
          children={
            <>
              <SelectLocation locations={locations} />
              <Button
                variant="secondary"
                className="inline-flex items-center gap-2"
              >
                <Plus /> Nova pulverização
              </Button>
            </>
          }
        />

        <MainContent
          children={
            <img
              src="/map-placeholder.jpeg"
              alt="Mapa temporário"
              className="w-full h-96 object-cover rounded-md"
            />
          }
        />
      </div>
    </div>
  );
}
