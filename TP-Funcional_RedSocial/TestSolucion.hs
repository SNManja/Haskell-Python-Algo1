module TestSolucion where

import Test.HUnit
import SolucionHS





main = runTestTT tests

tests = test [
    -- Los casos que me interesan testear son 2: Cuando tengo Usuarios en mi Red y cuando no
    " nombresDeUsuarios Default" ~: (nombresDeUsuarios redA) ~?= ["Solin solito","Juan","Natalia","Pedro","Mariela"],
    " nombresDeUsuarios RedVacia" ~: (nombresDeUsuarios redSinUsuarios) ~?= [],

    -- Los casos que me interesan testear son 2:
    -- Cuando el usuario no tiene amigos
    -- Cuando el usuario tiene uno o mas amigos
    " amigosDe Default" ~: (amigosDe redA usuario1) ~?= [usuario2, usuario4],
    " amigosDe RedVacia" ~: (amigosDe redA usuario0) ~?= [],

    -- Los casos que me interesan son 2:
    -- Cuando el usuario no tiene amigos,
    -- Cuando el usuario tiene uno o mas amigos
    " cantidadDeAmigos ninguno" ~: (cantidadDeAmigos redA usuario0) ~?= 0,
    " cantidadDeAmigos alguno" ~: (cantidadDeAmigos redA usuario1) ~?= 2,


    --En este caso me interesa que el test me devuelva:
    -- Un u, siendo que este para este u (todo i en [usuarios])(cantAmigos u >= cantAmigos i)
    " usuarioConMasAmigos 1" ~: expectAny (usuarioConMasAmigos redA) [usuario2, usuario4],


    -- Cambio el tp a 10 amigos nada mas tristemente
    -- Los casos que vamos a testear son:
    -- Que no haya ningun roberto carlos (todo i)(cantAmigos i < 10)-> False
    -- Que haya un roberto carlos (existe i)(cantAmigos i >= 10)-> True
    " NOestaRobertoCarlos" ~: (estaRobertoCarlos redA) ~?= False,
    " estaRobertoCArlos" ~: (estaRobertoCarlos redB) ~?= True, 

    -- Me interesa testear cuando el usuario tiene o no tiene publicaciones
    -- Cuando tiene -> [Publicaciones]
    -- Cuando no tiene -> []
    " publicacionesDe Con1OMasPublis" ~: (publicacionesDe redA usuario2) ~?= [publicacion2_1, publicacion2_2],
    " publicacionesDe SinPublis" ~: (publicacionesDe redA usuario0) ~?= [],

    -- Cuando tiene publicaciones que le gustan -> [Publicaciones]
    -- Cuando no le gusto ninguna publicacion -> []
    " publicacionesQueLeGustanA 1oMas" ~: (publicacionesQueLeGustanA redA usuario1) ~?= [publicacion2_2, publicacion4_1],
    " publicacionesQueLeGustanA ninguna" ~: (publicacionesQueLeGustanA redA usuario0) ~?= [],


    -- En este caso tengo dos usuarios ademas de la red.
    -- A ambos les gustan alguna publicacion en comun
    -- A ninguno le gusta alguna publicacion en comun
    -- BONUS: 
        -- A U1 le gustan publis, a U2 no le gusta ninguna
        -- A U2 le gustan publis, a U1 no le gsuta ninguna
    " lesGustanLasMismasPublicaciones True" ~: (lesGustanLasMismasPublicaciones redB usuario1 usuario3) ~?= True,
    " lesGustanLasMismasPublicaciones False" ~: (lesGustanLasMismasPublicaciones redA usuario1 usuario2) ~?= False,


    -- Usuario NO tiene un seguidor fiel
    -- Casos principales
     -- tiene un seguidor fiel
     -- no lo tiene
    -- Luego me surgen de ahi casos como:
    -- Usuario no tiene publis -> Tiene que dar False?
    
    " tieneUnSeguidorFiel 1" ~: (tieneUnSeguidorFiel redA usuario1) ~?= True,
    " tieneUnSeguidorFiel 2" ~: (tieneUnSeguidorFiel redA usuario3) ~?= False,
    " tieneUnSeguidorFiel 3" ~: (tieneUnSeguidorFiel redA usuario0) ~?= False,

    -- Hay una secuencia -> True
    -- Son directamente amigos -> True
    -- Son amigos de amigos de amigos ... -> True
    -- Cada uno con una cadena de amistades extensa pero no chocan -> False
    -- U1 sin amigos -> False
    -- U2 sin amigos -> False
    " existeSecuenciaDeAmigos 1" ~: (existeSecuenciaDeAmigos redA usuario1 usuario3) ~?= True
 ]

expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)

-- Ejemplos

usuario0 = (0, "Solin solito")
usuario1 = (1, "Juan")
usuario2 = (2, "Natalia")
usuario3 = (3, "Pedro")
usuario4 = (4, "Mariela")
usuario5 = (5, "Natalia")


relacion1_2 = (usuario1, usuario2)
relacion1_3 = (usuario1, usuario3)
relacion1_4 = (usuario4, usuario1) -- Notar que el orden en el que aparecen los usuarios es indistinto
relacion2_3 = (usuario3, usuario2)
relacion2_4 = (usuario2, usuario4)
relacion3_4 = (usuario4, usuario3)

publicacion1_1 = (usuario1, "Este es mi primer post", [usuario2, usuario4])
publicacion1_2 = (usuario1, "Este es mi segundo post", [usuario4])
publicacion1_3 = (usuario1, "Este es mi tercer post", [usuario2, usuario5])
publicacion1_4 = (usuario1, "Este es mi cuarto post", [])
publicacion1_5 = (usuario1, "Este es como mi quinto post", [usuario5])

publicacion2_1 = (usuario2, "Hello World", [usuario4])
publicacion2_2 = (usuario2, "Good Bye World", [usuario1, usuario4])

publicacion3_1 = (usuario3, "Lorem Ipsum", [])
publicacion3_2 = (usuario3, "dolor sit amet", [usuario2])
publicacion3_3 = (usuario3, "consectetur adipiscing elit", [usuario2, usuario5])

publicacion4_1 = (usuario4, "I am Alice. Not", [usuario1, usuario2])
publicacion4_2 = (usuario4, "I am Bob", [])
publicacion4_3 = (usuario4, "Just kidding, i am Mariela", [usuario1, usuario3])


usuariosA = [usuario0, usuario1, usuario2, usuario3, usuario4]
relacionesA = [relacion1_2, relacion1_4, relacion2_3, relacion2_4, relacion3_4]
publicacionesA = [publicacion1_1, publicacion1_2, publicacion2_1, publicacion2_2, publicacion3_1, publicacion3_2, publicacion4_1, publicacion4_2]
redA = (usuariosA, relacionesA, publicacionesA)

usuariosB = [usuario1, usuario2, usuario3, usuario5]
relacionesB = [relacion1_2, relacion2_3]
publicacionesB = [publicacion1_3, publicacion1_4, publicacion1_5, publicacion3_1, publicacion3_2, publicacion3_3]
redB = (usuariosB, relacionesB, publicacionesB)

redSinUsuarios = ([],[],[])