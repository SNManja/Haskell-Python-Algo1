from array import *
from math import sqrt


def raizDe2 ():
    # print (raizDe2())
    return round ((math.sqrt(2)),2)

def imprimir_hola():
    print("hola")
    
def imprimir_un_verso():
    print("Yo quiero tener un millon de amigos :)")
    
def factorial_de_dos(x:int) -> int:
    x = 0
    x = fact(4)
    return x

def fact (x:int) -> int:
    if(x==1 or x == 0):
        return 1 
    else:
        return x * fact (x-1)

print(factorial_de_dos(1))
    