
from EX_1 import ordenados


def perteneceACadaUno(s: list[list[int]], n: int) -> bool:
    for i in s:
        if not(n in i):
            return False
    return True

def esMatriz (s:list[list[int]]) -> bool:
    if(len(s) == 0):
        return False
    for i in s:
        if(i != s[0]):
            return False
    return True


def filasOrdenadas(m: list[list[int]]) -> bool:
    for i in m:
        if not(ordenados(i)):
            return False
    return True


#Consultar 4