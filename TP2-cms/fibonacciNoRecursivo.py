import sys

# Tras multiples implementaciones, termine haciendo la mas similar al enunciado

def fibonacciNoRecursivo(n: int) -> int:
  fibo: list = [0,1]
  if n == 0: 
      return fibo[0]
  elif n == 1:
      return fibo[1]
  else:
      while n >=2:
          fibo.append(fibo[len(fibo)-1] + fibo[len(fibo)-2])
          n -= 1
      return fibo[len(fibo)-1]


if __name__ == '__main__':
  x = int(input())
  print(fibonacciNoRecursivo(x))