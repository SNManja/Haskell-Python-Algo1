import Text.XHtml (red)
import qualified GHC.TypeLits as True
-- Completar con los datos del grupo
--
-- Nombre de Grupo: xx
-- Integrante: Santiago M

type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

-- Funciones basicas

usuarios :: RedSocial -> [Usuario]
usuarios (us, _, _) = us

relaciones :: RedSocial -> [Relacion]
relaciones (_, rs, _) = rs

publicaciones :: RedSocial -> [Publicacion]
publicaciones (_, _, ps) = ps

idDeUsuario :: Usuario -> Integer
idDeUsuario (id, _) = id 

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us

-- Ejercicios


{- 
    -- Ej-1 --
    Uso para separar los usuarios de la red la funcion auxiliar
    y asi trabajar comodamente con la lista de usuarioss 
-}
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios r = nombresDeUsuariosAux (usuarios r)

nombresDeUsuariosAux :: [Usuario] -> [String]
nombresDeUsuarioAux [] = []
nombresDeUsuariosAux (x:xs) = [nombreDeUsuario x] ++ nombresDeUsuariosAux xs


{-
    -- Ej-2 --
    AmigosDeAux separa las relaciones para trabajar mas facil con ellas
    luego checkea uno por uno en la lista de relaciones si aparece u en uno de los dos lados de cada tupla
    en caso de que si, almacena el usuario en la lista de Strings. En caso que no, sigue testeando relaciones una por una hasta llegar a [] (lista vacia)

-}
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe r u = amigosDeAux (relaciones r) u 

amigosDeAux :: [Relacion] -> Usuario -> [Usuario]
amigosDeAux [] _ = []
amigosDeAux (rh:rt) u | fst rh == u = (snd rh:amigosDeAux rt u)
                      | snd rh == u = (fst rh:amigosDeAux rt u)
                      | otherwise = amigosDeAux rt u 


{-
    -- Ej-3 --
    Da uso de cantidadDeAmigos y toma la longitud de la lista (amigosDe r u),
    dandonos la cantidad de amigos que tiene el usuario u
-}
cantidadDeAmigos :: RedSocial -> Usuario -> Integer
cantidadDeAmigos r u = longitudLista (amigosDe r u)

longitudLista :: [t] -> Integer
longitudLista [] = 0
longitudLista (x:xs) = 1 + longitudLista xs 

{-
    -- Ej-4 --
    Para facilitar el trabajo en la auxiliar separe los usuarios y agregue una tupla para almacenar el usuario con mas amigos 
    Podria haberlo hecho en una funcion sola seguramente pero priorice la legibilidad
    utilizo las funciones de los anteriores ejercicios, cantidad de usuarios para checkear si supera la cantidad de amigos del usuario almacenado como el (maxUser,maxCount)
    En caso que sea cierto reemplaza a este y sigue revisando toda la lista de usuarios. 
    En un principio mi idea era que usuarioConMasAmigosAux solo tome los usuarios y el max, pero pero requiero la red entera (r) como para poder usar con facilidad las funciones ya desarrolladas
-}
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos r = usuarioConMasAmigosAux r (usuarios r) ((0, "aaa"),(-1)) 

usuarioConMasAmigosAux :: RedSocial -> [Usuario] -> (Usuario, Integer) -> Usuario 
usuarioConMasAmigosAux r [] max = fst max
usuarioConMasAmigosAux r (lh:lt) (maxUser,maxCount) | cantidadDeAmigos r lh > maxCount = usuarioConMasAmigosAux r lt (lh, cantidadDeAmigos r lh)
                                                    | otherwise = usuarioConMasAmigosAux r lt (maxUser,maxCount)

{-
    -- Ej-5 --
    Este ejercicio se resuelve simplemente con el uso de la funcion usuarioConMasAmigos recien desarrollada y viendo al cantidadDeAmigos del mismo, lo podemos comparar con el valor numerico 1000000
-}
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos r = cantidadDeAmigos r (usuarioConMasAmigos r) > 1000000 

 
{-
    -- Ej-6 --
    Como en los otro ejercicios, volvi a dar uso de una funcion auxiliar para facilitar la legibilidad
    EN esta funcion separe las publicaciones, para luego con firstTerna, revisar el primer elemento de la terna de cada publicacion. Este elemento representa el usuario hizo la publicacion
    De esta manera checkea si coincide el usuario que hizo la publicacion con el usuario que estamos analizando. En caso de que sea el mismo se agrega la publicacion a la lista que finalmente returnea 
-}
firstTerna (a,_,_) = a

publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe r u = publicacionesDeAux (publicaciones r) u 

publicacionesDeAux :: [Publicacion] -> Usuario -> [Publicacion]
publicacionesDeAux [] u = []
publicacionesDeAux (ph:pt) u | firstTerna ph == u = [ph] ++ publicacionesDeAux pt u
                             | otherwise = publicacionesDeAux pt u


{-
    -- Ej-7 --

    Con el Aux separo las publicaciones para trabajar con mas comodidad
    Hice el predicado publicacionLikeada para verificar si una publicacion fuer likeada por el usuario
    En caso que el usuario haya dado like a la publicacion, se agrega la publi a la lista y se siguen checkeado las de mas adelante
    En caso que el usuario NO haya dado like, simplemente se sigue checkeando publi una por una, ignorando la misma

-}
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA r u = publicacionesQueLeGustanAAux (publicaciones r) u

publicacionesQueLeGustanAAux :: [Publicacion] -> Usuario -> [Publicacion]
publicacionesQueLeGustanAAux [] u = []
publicacionesQueLeGustanAAux (ph:pt) u | publicacionLikeada (likesDePublicacion ph) u = [ph] ++ publicacionesQueLeGustanAAux pt u
                                       | otherwise = publicacionesQueLeGustanAAux pt u

publicacionLikeada :: [Usuario] -> Usuario -> Bool
publicacionLikeada [] u = False
publicacionLikeada (x:xs) u | x == u = True
                            | otherwise = publicacionLikeada xs u

{-
    -- Ej-8 --

    Utiliza la funcion del ej 7 y compara, me preocupaba en caso que no esten igual sorteadas
    pero como las publicaciones las va procesando y agregando en orden. Si son las mismas, no tendria que haber problema con el orden de las mismas
    ya que si a ambos usuarios les gustan las mismas publicaciones publicacionesQueLeGustanA las va agregando a la lista en mismo orden
-}
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones r u1 u2 = publicacionesQueLeGustanA r u1 == publicacionesQueLeGustanA r u2 


{-
    -- Ej-9 --
    Tiene un seguidor fiel checkea si el usuario tiene un fan (Osea, alguien que le likea todas las publicaciones)

    Primero hago un auxiliar que me haga mas facil trabajar con la lista de usuarios totales y de publicaciones de nuestro usuario estrella (Llamemoslo u* para la explicacion)
    La Auxiliar en este caso pasa por cada uno de los usuarios de la red y con ayuda de likeoTodas checkeando si hay uno de estos que dio like a todas las publicaciones

    LikeoTodas tiene la lista de publicaciones y el usuario que queremos ver. Para que quede claro, el usuario que entra aca es el que vamos a revisar si es fan o no y las publicaciones son las de u*
    Una vez encuentra un usuario que likeoTodas devuelve True, devolviendo True en la auxiliar y por ende tambien en la funcion principal.

    En caso que ningun likeoTodas se cumpla, directamente cuando se acaban los usuarios la auxiliar me devuelve False

-}
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel r u = tieneUnSeguidorFielAux (usuarios r) (publicacionesDe r u) 


-- Aca entraria           todos user -> publis del q analisamos -> true/false
tieneUnSeguidorFielAux :: [Usuario] -> [Publicacion] -> Bool
tieneUnSeguidorFielAux [] p = False
tieneUnSeguidorFielAux (uh:ut) p | likeoTodas p uh = True
                                 | otherwise = tieneUnSeguidorFielAux ut p

likeoTodas :: [Publicacion] -> Usuario -> Bool
likeoTodas [] _ = True
likeoTodas (ph:pt) u | publicacionLikeada (likesDePublicacion ph) u = likeoTodas pt u
                     | otherwise = False


{-
    -- Ej-10 --

    la res es true si una secuencia de usuarios US tamano 2 o mayor, empieza con u1, termina con u2, son de la red y cumplem con cadenaDeAmigos (us,red)

    cadenaDeAmigos (us:seq[Usuario], red:RedSocial) {
        todo x -> (0 <= x < us.length -1 -> RelacionadosDirecto(us[x],us[x+1],red))
    }

    RelacionadosDirecto (u1: Usuario, u2: Usuario, red: RedSocial){
        Pertenece ((u1,u2),Relaciones(Red)) U Pertenece ((u2,u1), Relaciones(Red))
    }

    Como lo puedo pensar?
    Puedo checkear la lista de amigos de u1 y u2, de ahi ver quienes son amigos de los de esa lista hasta encontrar 
-}
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos r u1 u2 =  buscoPor r u1 (amigosDe r u2) [u2] || buscoPor r u2 (amigosDe r u1) [u1]

buscoPor :: RedSocial -> Usuario -> [Usuario] -> [Usuario] -> Bool
buscoPor r u amigos vistos | listaASinB amigos vistos == [] = False
                           | pertenece u amigos = True
                           | otherwise = buscoPorCadaAmigo r u amigos (vistos)

buscoPorCadaAmigo :: RedSocial ->  Usuario -> [Usuario] -> [Usuario] -> Bool
buscoPorCadaAmigo r u [] vistos = False
buscoPorCadaAmigo r u (ah:at) vistos = buscoPor r u (amigosDe r ah) (vistos ++ [ah]) || buscoPorCadaAmigo r u at (vistos++[ah])

listaASinB :: [Usuario] -> [Usuario] -> [Usuario]
listaASInB [] _ = []
listaASinB _ [] = []
listaASinB (ah:at) b = if pertenece ah b then listaASinB at b else [ah] ++ listaASinB at b


pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece t (x:xs) | x == t = True
                   | otherwise = pertenece t xs


-- Estos son predicados de la definicion del TP no se si van a servir 
cadenaDeAmigos :: RedSocial -> [Usuario] -> Bool
cadenaDeAmigos r (uh:ut) | null ut  || null (uh:ut)= True
                         | relacionadosDirecto r uh (head ut) = cadenaDeAmigos r ut
                         | otherwise = False

relacionadosDirecto :: RedSocial -> Usuario -> Usuario ->  Bool
relacionadosDirecto r u1 u2 = pertenece u1 (amigosDe r u2)
