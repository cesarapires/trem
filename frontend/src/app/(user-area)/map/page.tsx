import Image from "next/image";

export default function MapaPulverizacoes() {
  return (
    <Image
      src="/map-placeholder.jpeg"
      alt="Mapa temporário"
      className="w-full h-96 object-cover rounded-md"
    />
  );
}
