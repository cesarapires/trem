import { Button } from "@/components/ui/button";
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
      {/* Sidebar */}
      <SidebarContent />

      {/* Conteúdo Principal */}
      <div className="w-3/4 p-4">
        <Header
          title="Mapa de pulverizações"
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

        {/* Mapa (Substituído por uma imagem) */}
        <div className="mt-4">
          <img
            src="/map-placeholder.jpeg"
            alt="Mapa temporário"
            className="w-full h-96 object-cover rounded-md"
          />
        </div>
      </div>
    </div>
  );
}
