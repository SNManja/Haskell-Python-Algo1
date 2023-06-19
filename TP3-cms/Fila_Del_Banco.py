from queue import Queue

# El tipo de fila debería ser Queue[int], pero la versión de python del CMS no lo soporta. Usaremos en su lugar simplemente "Queue"
def avanzarFila(fila: Queue, min: int):
  #Cuenta el ID maximo
  if not fila.empty():
    queueID = max(fila.queue)
  else:
    queueID = 0
  #Esta lista es la que va a tener a los que mandarona la fila de la caja 3
  espera = []
  for minuto in range(0,min+1,1):
    #Ingreso cada 4 mins
    if(minuto % 4 == 0):
      queueID += 1
      fila.put(queueID)
    #Ingreso cada 10 mins (comienza desde 10:01)
    if (minuto-1) % 10 == 0 and not fila.empty():
      fila.get()
    #Ingreso cada 4 mins (comienza desde 10:03)
    if (minuto-3) % 4 == 0 and not fila.empty():
      fila.get()
    #Ingreso cada 4 mins (comienza desde 10:02) 
    #Esta caja devuelve a la fila en 3 mins
    if (minuto-2) % 4 == 0 and not fila.empty():
      paraespera = fila.get()
      espera.append([paraespera,4]) #Comienza con 4 porque ahora le saca 1 antes de la sig iteracion del loop
    for i in range(0,len(espera)): #Baja 1 a cada contador
      espera[i][1] -= 1
      if espera[i][1] == 0: #Checkea si hay q insertar alguno
        fila.put(espera[i][0])
        del espera[i]
  return fila
  #implementar función


#Funciones utilizadas para testing

#def construirFila(fila:list):
#  q = Queue()
#  for e in fila:
#    q.put(e)
#  return q

#def test(l:list,m:int): 
#  queue = construirFila(l)
#
#  res = avanzarFila(queue,m)
#  resList = []
#  for e in res.queue:
#    resList.append(e)
#  print (resList)
#  return res


if __name__ == '__main__':
  fila: Queue = Queue()
  fila_inicial: int = int(input())
  for numero in range(1, fila_inicial+1):
    fila.put(numero)
  min: int = int(input())
  avanzarFila(fila, min)
  res = []
  for i in range(0, fila.qsize()):
    res.append(fila.get())
  print(res)


# Caja1: Empieza a atender 10:01, y atiende a una persona cada 10 minutos
# Caja2: Empieza a atender 10:03, atiende a una persona cada 4 minutos
# Caja3: Empieza a atender 10:02, y atiende una persona cada 4 minutos, pero no le resuelve el problema y la persona debe volver a la fila (se va al final y tarda 3 min en llegar. Es decir, la persona que fue atendida 10:02 vuelve a entrar a la fila a las 10:05)
# La fila empieza con las n personas que llegaron antes de que abra el banco. Cuando abre (a las 10), cada 4 minutos llega una nueva persona a la fila (la primera entra a las 10:00)

