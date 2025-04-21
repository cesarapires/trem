"use client";

import { CenterMap } from "@/components/ui/map/CenterMap";
import { usePropertyStore } from "@/store/property-store";
import "leaflet/dist/leaflet.css";
import { MapContainer, TileLayer, Popup, Marker } from "react-leaflet";

export default function MapaPulverizacoes() {
  const { coordinates } = usePropertyStore();

  return (
    <div className="relative h-[500px] w-full z-0">
      <MapContainer
        center={coordinates ?? [0, 0]}
        zoom={13}
        scrollWheelZoom={false}
        style={{ height: "100%", width: "100%" }}
      >
        <TileLayer
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        {coordinates && (
          <>
            <Marker position={coordinates}>
              <Popup>Local selecionado</Popup>
            </Marker>
            <CenterMap coordinates={coordinates} />
          </>
        )}
      </MapContainer>
    </div>
  );
}
