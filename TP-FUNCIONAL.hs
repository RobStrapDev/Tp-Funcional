-- Definición de algunos datos de ejemplo
recuerdos1 = [Recuerdo "Recuerdo1" "Lugar1", Recuerdo "Recuerdo2" "Lugar2", Recuerdo "Recuerdo3" "Lugar3"]
viaje1 = Viaje "Lejano Oeste" (AlPasado recuerdos1) [] 1800
viaje2 = Viaje "Futuro1" (AlFuturo 100) [] 2200
viaje3 = Viaje "Futuro2" (AlFuturo 200) [] 2300
viaje4 = Viaje "Pasado1" (AlPasado []) [] 1600
viaje5 = Viaje "Futuro3" (AlFuturo 150) [] 2250
viajes = [viaje1, viaje2, viaje3, viaje4, viaje5]

-- Definición de algunos viajeros de ejemplo
viajero1 = Viajero "Juan" 30 [Recuerdo "RecuerdoX" "LugarX", Recuerdo "RecuerdoY" "LugarY"] [viaje1, viaje2]
viajero2 = Viajero "Ana" 25 [] [viaje3, viaje4]
viajero3 = Viajero "Pedro" 40 [Recuerdo "RecuerdoZ" "LugarZ"] [viaje5]
viajeros = [viajero1, viajero2, viajero3]

-- Definicion de tipo de datos
-- Datos del viajero
-- Nombre
-- Edad
-- Recuerdos
-- Viajes realizados
data Viajero = Viajero {
    nomViajero :: String,
    edadViajero :: Int,
    recuerdosViajero :: [Recuerdo], -- Almacena una lista de recuerdos del tipo Recuerdo
    viajesViajero :: [Viaje] -- Almacena una lista de viajes del tipo Viaje
}
-- Datos de viajes
-- Destino
-- Tipo de viajes
-- Transformaciones
-- Año
data Viaje = Viaje {
    destinoViaje :: String,
    tipoViaje :: TipoViaje,
    transformacionesViaje :: [Transformacion], -- Almcena una lista de transformaciones 
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
data TipoViaje = AlFuturo Int | AlPasado [Recuerdo] -- Almacena dos constructores - AlFuturo contiene cantidad años - AlPasado contiene lista de valores tipo Recuerdo
-- Transformaciones
-- Viaja al lejano oeste pierde todos los recuerdos que comienzan con vocal
-- Viaja al futuro, Hill Valley, su edad aumenta
data Transformacion = PerdidaRecuerdosVocales | AumentoEdad Int -- Almacena dos constructores - PerdidaRecuerdosVocales - AumentoEdad aumeto de edad experimentado por viajero

-- Obtener el nombre del viajero
nombreViajero :: Viajero -> String
nombreViajero = nomViajero

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
-- Es un viaje al FUTURO
viajeInteresante :: Viaje -> Bool
viajeInteresante viaje = case (destinoViaje viaje, tipoViaje viaje) of
    ("Lejano Oeste", _ ) -> True
    (_, AlPasado recuerdos) -> length recuerdos > 5
    (_ , AlFuturo _) -> True
    _ -> False

-- 4)    Dada una lista de viajes mostrar los nombres y los años de todos los viajes INTERESANTES
viajesInteresantes = map (\viaje -> (nombreViaje viaje, anioViaje viaje)) . filter viajeInteresante

-- 5)   Dada una lista de viajes, año inicio, año fin obtener nombre y el año de TODOS los viajes entre esos dos años pasados por parametro
interesantesPorFiltro viajes inicio fin = map (\viaje -> (nombreViaje viaje, anioViaje viaje)) $ filter enRango viajes
    where enRango viaje = anioViaje viaje >= inicio && anioViaje viaje <= fin

-- 6)   Función que permite hacer que el viajero realice una lista de viajes, se le apliquen las transformaciones necesarias y obtenga los recuerdos.


-- 7) Definir una funcion ESTADISTICA que reciba una funcion condicion, una funcion transformacion y una lista 
estadistica condicion transformacion lista = map transformacion $ filter condicion lista
-- Funcion que devuelve una LISTA segun la funcion transformacion aplicada a solo los elementos que cumplen la condicion

-- Dada una lista encontrar todos los nombres de los viajes que tienen mas de 3 transformaciones
viajesMasDe3Transformaciones = estadistica (\viaje -> length (transformacionesViaje viaje) > 3) nombreViaje

-- Dada una lista de viajes, obtener la suma de todos los años luz que suman
sumaAñosLuzViajesAlFuturo = sum . estadistica esViajeAlFuturo obtenerAñosLuz
  where
    esViajeAlFuturo viaje = case tipoViaje viaje of
                                AlFuturo _ -> True
                                _ -> False
    obtenerAñosLuz viaje = case tipoViaje viaje of
                                AlFuturo años -> años
                                _ -> 0

-- Dada una lista, obtener los nombres de todos los viajes. LOS VIAJES AL PASADO NO SUMAN AÑOS LUZ!
nombresViajes = estadistica (\_ -> True) nombreViaje





