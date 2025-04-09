import MainContent from "@/components/ui/content/main-content";
import Header from "@/components/ui/header/hearder";
import SidebarContent from "@/components/ui/sidebar/sidebar-content";

const locations = [
  "Minha localização",
  "Fazenda Sol Nascente",
  "Fazenda Laranjal",
];

export default function MapaPulverizacoes() {
  return (
    <div className="bg-green-100 min-h-screen flex">
      <SidebarContent />

      {/* Conteúdo Principal */}
      <div className="w-3/4 p-4">
        <Header title="Meus Locais" />

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
