from typing import List, Tuple


# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista y Tupla, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# t: Tuple[str,str]  <--Este es un ejemplo para una tupla de strings.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def sePuedeLlegar(origen: str, destino: str, vuelos: List[Tuple[str, str]]) -> int :
  
  def indexViaje(vuelos: List[Tuple[str, str]], origen:str) -> int:
    for i in range(len(vuelos)):
      if vuelos[i][0] == origen:
        return i
    return -1
  
  count:int = 0
  while (origen != destino):
    iv = indexViaje(vuelos, origen)
    if (iv == -1):
      return -1
    elif (iv >= 0):
      count += 1
      origen = vuelos[iv][1]
  return count



if __name__ == '__main__':
  origen = input()
  destino = input()
  vuelos = input()
  
  print(sePuedeLlegar(origen, destino, [tuple(vuelo.split(',')) for vuelo in vuelos.split()]))