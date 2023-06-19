from queue import LifoQueue as Pila


def pilaRandom(largo:int, desde:int, hasta:int):
    p = Pila()
    for i in generarNrosAlAzar(largo,desde,hasta):
        p.put(i)
    
    return p

#for testing
def printQueue(p):
    save = []
    while (not(p.empty())):
        save.append(p.get())
    return save
    
    




########################################################################
import random


def generarNrosAlAzar( n:int, desde:int, hasta:int) -> list[int]:
    res = []
    while n > 0:
        res.append(random.randrange(desde, hasta))
        n -= 1
    return res