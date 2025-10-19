import React from 'react';

import L from 'leaflet';
import ReactDOMServer from 'react-dom/server';
import { PiTractorFill } from "react-icons/pi";

const TractorIcon: L.DivIcon = new L.DivIcon({
  html: ReactDOMServer.renderToString(
    <div style={{
      backgroundColor: '#ff4d4d',
      border: '2px solid white',
      borderRadius: '50%',
      width: '40px',
      height: '40px',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      boxShadow: '0 0 5px rgba(0,0,0,0.5)'
    }}>
      <PiTractorFill color="white" size={20} />
    </div>
  ),
  className: '', // remove a classe padrão do DivIcon
  iconSize: [40, 40],
  iconAnchor: [20, 20] // centraliza o ícone no ponto
});

export default TractorIcon;
