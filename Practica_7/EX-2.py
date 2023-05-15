from math import sqrt


def imprimir_saludo (nombre):
    print ("Hola", nombre)
    
    
def raiz_cuadrada_de (numero : float) -> float:
    return sqrt(numero)


def imprimir_dos_veces(estribillo) :
    print(estribillo *2)

def es_multiplo_de (n: int, m: int):
    if (n / m == round(n/m,0)):
        return True
    else:
        return False


def es_par (numero : int):
    if(es_multiplo_de (numero, 2)):
        return True
    else: 
        return False
    
def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int):
    return ceiling (comensales * min_cant_de_porciones)

