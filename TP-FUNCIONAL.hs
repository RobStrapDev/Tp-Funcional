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


