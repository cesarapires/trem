import { Button } from "@/components/ui/button";
import SelectLocation from "@/components/ui/selects/SelectLocation";
import { Plus } from "@mynaui/icons-react";
import Link from "next/link";

const locations = [
  "Minha localização",
  "Fazenda Sol Nascente",
  "Fazenda Laranjal",
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
          <button className="flex items-center w-full p-3 bg-gray-200 font-bold rounded-md">
            🔍 Mapa de pulverizações
          </button>
          <button className="flex items-center w-full p-3 rounded-md hover:bg-gray-100">
            📅 Calendário de pulverizações
          </button>
          <button className="flex items-center w-full p-3 rounded-md hover:bg-gray-100">
            ⚙️ Meus locais
          </button>
        </nav>
      </div>

      {/* Conteúdo Principal */}
      <div className="w-3/4 p-4">
        <div className="bg-orange-400 p-3 rounded-md flex justify-between items-center text-white">
          <h2 className="scroll-m-20 text-xl font-semibold tracking-tight">Mapa de pulverizações</h2>
          <div className="flex space-x-2">
            <SelectLocation locations={locations} />

            <Button variant="secondary" className="inline-flex items-center gap-2">
              <Plus /> Nova pulverização
            </Button>
          </div>
        </div>

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
