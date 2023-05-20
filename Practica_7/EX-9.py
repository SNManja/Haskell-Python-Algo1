def rt (x: int, g: int) -> int: # Esta NO modifica la var global g
    g = g+1
    return x+g

g:int = 0

def ro(x:int) -> int: # Esta modifica la var global g
    global g
    g = g + 1
    return x + g

# Al ejecutar 3 veces ro, como llamamos  a la var global, modifica a la g de afuera de la funcion
# Esto hace que nos de x + 3 siendo x el parametro in/out de la funcion.


