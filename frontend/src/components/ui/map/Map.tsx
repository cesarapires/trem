import { MapContainer, Marker, Popup, TileLayer } from "react-leaflet";
import { CenterMap } from "./CenterMap";
import { usePropertyStore } from "@/store/property-store";
import TractorIcon from "./TractorIcon";
import { FrameIcon } from "lucide-react";
import FarmIcon from "./FarmIcon";

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
        <Marker key={1} position={[-21.20, -44.90]} icon={TractorIcon({type: "safe"})}>
          <Popup>Local selecionado</Popup>
        </Marker>
        {coordinates && (
          <>
            <Marker key={0} position={coordinates} icon={FarmIcon}>
              <Popup>Local selecionado</Popup>
            </Marker>
            <CenterMap coordinates={coordinates} />
          </>
        )}
      </MapContainer>
    </div>
  );
}
