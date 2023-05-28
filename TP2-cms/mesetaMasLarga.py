from typing import List


# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def mesetaMasLarga (l: list[int]) -> int:
    max:int = 0
    while (len (l) > 0):
        if(max <= checkMeseta(l)):
            max = checkMeseta(l)
        l=l[1:]
    return max
        
def checkMeseta (l: list[int]) -> int:
    save:int = l[0]
    count:int = 0
    while(l[0] == save):
        count += 1
        l =l[1:]
        if(l == []):
            return count
    return count


if __name__ == '__main__':
  x = input()
  print(mesetaMasLarga([int(j) for j in x.split()]))