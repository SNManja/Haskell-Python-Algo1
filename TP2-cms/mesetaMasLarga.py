from typing import List


# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def mesetaMasLarga(l: List[int]) -> int :
  max:int = 0;
  if(l == []):
    return 0
  count = 1
  for i in range(1,len(l)):
    if(l[i] == l[i-1]):
      count += 1
    else:
      if(count >= max):
        max = count
      count = 1
      
  if(count >= max):
    max = count
  return max


if __name__ == '__main__':
  x = input()
  print(mesetaMasLarga([int(j) for j in x.split()]))