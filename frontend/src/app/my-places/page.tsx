import Header from "@/components/ui/header/hearder";
import SideBarOption from "@/components/ui/sidebar/button";

const locations = [
  "Minha localização",
  "Fazenda Sol Nascente",
  "Fazenda Laranjal",
];

const options = [
  { name: "🔍 Mapa de pulverizações", link: "/map" },
  { name: "📅 Calendário de pulverizações", link: "/schedule" },
  { name: "⚙️ Meus locais", link: "/my-places" },
];

export default function MapaPulverizacoes() {
  return (
    <div className="bg-green-100 min-h-screen flex">
      {/* Sidebar */}
      <div className="w-1/4 bg-white shadow-md p-4">
        <div className="bg-orange-400 text-white font-bold text-lg p-3 rounded-md flex items-center">
          <div className="w-8 h-8 bg-gray-200 rounded-full flex items-center justify-center mr-2 text-lg">
            T
          </div>
          T.R.E.M.
        </div>
        <nav className="mt-4 space-y-2">
          <SideBarOption options={options} />
        </nav>
      </div>

      {/* Conteúdo Principal */}
      <div className="w-3/4 p-4">
        <Header title="Meus locais" />

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
