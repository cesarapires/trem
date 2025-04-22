import { MapContainer, Marker, Popup, TileLayer } from "react-leaflet";
import { CenterMap } from "./CenterMap";
import { usePropertyStore } from "@/store/property-store";

import L from 'leaflet';
import iconRetinaUrl from 'leaflet/dist/images/marker-icon-2x.png';
import iconUrl from 'leaflet/dist/images/marker-icon.png';
import shadowUrl from 'leaflet/dist/images/marker-shadow.png';

interface IconDefaultWithPrivate extends L.Icon.Default {
  _getIconUrl?: () => string;
}

delete (L.Icon.Default.prototype as IconDefaultWithPrivate)._getIconUrl;

L.Icon.Default.mergeOptions({
  iconRetinaUrl,
  iconUrl,
  shadowUrl
});

export default function Map() {
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
