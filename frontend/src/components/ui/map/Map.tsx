import { MapContainer, Marker, Popup, TileLayer } from "react-leaflet";
import { CenterMap } from "./CenterMap";
import { usePropertyStore } from "@/store/property-store";

export default function Map() {
  const { coordinates } = usePropertyStore();

  return (
    <div className="relative h-[calc(100vh-theme(spacing.32))]">
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
