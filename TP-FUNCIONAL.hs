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
    transformacionesViaje :: [Transformacion],
    anioViaje :: Int
}

-- Datos del recuerdo
-- Nombre
-- Proveniencia
data Recuerdo = Recuerdo {
    nombreRecuerdo :: String,
    lugarProvenienciaRecuerdo :: String
}

-- Tipo de viajes
-- Al pasado - Conocemos recuerdos
-- Al futuro - Cantidad años que viajo
data TipoViaje = AlFuturo Int | AlPasado [Recuerdo]

-- Transformaciones
-- Viaja al lejano oeste pierde todos los recuerdos que comienzan con vocal
-- Viaja al futuro, Hill Valley, su edad aumenta
data Transformacion = PerdidaRecuerdosVocales | AumentoEdad Int

-- Obtener el nombre del viajero
nombreViajero :: Viajero -> String
nombreViajero = nombreViajero

-- Obtener nombre del viaje
nombreViaje :: Viaje -> String
nombreViaje = destinoViaje

-- Dado un recuerdo
-- Nombre
-- Lugar donde proviene
nombreYOrigenRecuerdo :: Recuerdo -> (String,String)
nombreYOrigenRecuerdo recuerdo = (nombreRecuerdo recuerdo, lugarProvenienciaRecuerdo recuerdo)

-- Obtener recuerdos y los viajes de un viajero
recuerdosYViajesViajero viajero = (recuerdosViajero viajero, viajesViajero viajero)

-- Determinar si un viaje es o no interesante
-- Es interesante si : 
-- Es al LEJANO OESTE
-- Es un viaje al pasado Y hay mas de 5 recuerdos
viajeInteresante :: Viaje -> Bool
viajeInteresante viaje = case (destinoViaje viaje, tipoViaje viaje) of
    ("Lejano Oeste", _ ) -> True
    (_, AlPasado recuerdos) -> length recuerdos > 5
    (_ , AlFuturo _) -> True
    _ -> False
