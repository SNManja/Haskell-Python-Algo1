from typing import List, Tuple


# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista y Tupla, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# t: Tuple[str,str]  <--Este es un ejemplo para una tupla de strings.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def sePuedeLlegar(origen: str, destino: str, vuelos: List[Tuple[str, str]]) -> int :
  count:int = 0
  while(origen != destino and vuelos != []):
    for i in range(len(vuelos)):
      print(vuelos)
      if(vuelos[i][0] == origen):
        count += 1
        origen = vuelos[i][1]
        vuelos = vuelos[:i] + vuelos[i+1:]
        break
      elif(i == len(vuelos)-1):
        return -1
  if(origen == destino): return count
  else: return -1
        
        

if __name__ == '__main__':
  origen = input()
  destino = input()
  vuelos = input()
  
  print(sePuedeLlegar(origen, destino, [tuple(vuelo.split(',')) for vuelo in vuelos.split()]))