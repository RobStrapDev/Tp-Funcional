-- Definicion de tipo de datos

-- Datos del viajero
-- Nombre
-- Edad
-- Recuerdos
-- Viajes realizados

data Viajero = Viajero {
    nombreViajero :: String,
    edadViajero :: Int,
    recuerdosViajero :: [Recuerdo],
    viajesViajero :: [Viaje]
}

-- Datos de viajes
-- Destino
-- Tipo de viajes
-- Transformaciones
-- Año

data Viaje = Viaje {
    destinoViaje :: String,
    tipoViaje :: TipoViaje,
    transformacionesViaje :: [Transformaciones],
    anioViaje :: Int
}
