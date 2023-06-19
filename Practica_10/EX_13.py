from queue import Queue as Cola

from EX_8 import generarNrosAlAzar


def generarQueueAlAzar(largo:int, start:int, end:int):
    listaRandom = generarNrosAlAzar(largo, start, end)
    q = Cola()
    for num in listaRandom:
        q.put(num)
    return q

