import random


def generarNrosAlAzar( n:int, desde:int, hasta:int) -> list[int]:
    res = []
    while n > 0:
        randomnum = random.randrange(desde, hasta)
        res.append(randomnum)
        n -= 1
    return res

