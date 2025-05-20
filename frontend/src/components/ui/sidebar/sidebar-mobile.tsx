// Exemplo simples com state para abrir
import { useState } from "react";
import SidebarOption from "./sidebar-button";

const options = [
  { name: "🔍 Mapa de Pulverizações", link: "/map" },
  { name: "📅 Calendário de Pulverizações", link: "/schedule" },
  { name: "⚙️ Meus Locais", link: "/my-places" },
];

const MobileMenu: React.FC = () => {
  const [open, setOpen] = useState(false);

  return (
    <>
      <button
        className="md:hidden p-4"
        onClick={() => setOpen(!open)}
      >
        ☰
      </button>

      {open && (
        <div className="fixed top-0 left-0 h-full w-64 bg-white shadow-lg z-50 p-4">
          <div className="flex justify-between items-center">
            <span className="font-bold text-lg text-orange-500">T.R.E.M.</span>
            <button onClick={() => setOpen(false)}>✕</button>
          </div>
          <nav className="mt-4 space-y-2">
            <SidebarOption options={options} />
          </nav>
        </div>
      )}
    </>
  );
};
