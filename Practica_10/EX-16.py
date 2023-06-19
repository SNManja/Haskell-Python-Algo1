import random
from queue import Queue as Cola


def armarSecuenciaDeBingo() -> Cola[int]:
    q = Cola()
    lista = range(0,99,1)
    random.shuffle(lista)
    for elem in lista:
        q.put(elem)
    return q

def jugarCartonDeBingo(carton:list[int], bolillero:Cola[int])->int:
    #como se juega al bingo ? ... me olvide :(
    print("comojuego")