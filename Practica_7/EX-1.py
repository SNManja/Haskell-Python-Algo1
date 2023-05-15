
from math import sqrt


def raizDe2 ():
    # print (raizDe2())
    return round ((math.sqrt(2)),4)

def imprimir_hola():
    print("hola")
    
def imprimir_un_verso():
    print("Yo quiero tener un millon de amigos :)")
    
def factorial_2(x:int) -> int:
    x = 0
    x = fact(2)
    return x

#funcion auxiliar
def fact (x:int) -> int:
    count : int= 1
    for i in range(x):
        print (i +1)
        count = count * (i+1)
    return count

def factorial_3(x:int) -> int:
    x = 0
    x = fact(3)
    return x

def factorial_4(x:int) -> int:
    del x
    x : int= fact(4)
    return x

def factorial_4(x:int) -> int:
    del x
    x : int= fact(4)
    return x


