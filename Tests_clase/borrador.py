from queue import LifoQueue, Queue

print("\nPila/Stack:")
#Stack/pila
pila = LifoQueue()

print(pila.empty())
pila.put(1)
pila.put(2)
pila.put(3)
print("Tamano pila:", pila.qsize(), "\n")
print(pila.get()) #3
print(pila.get()) #2
print(pila.get()) #1

#Cola/Queue

print("\nCola/Queue:")
cola = Queue()
print(cola.empty())
cola.put(1) 
cola.put(2)
cola.put(3)

print("Tamano: ", pila.qsize(), "\n")

print(cola.get()) #1
print(cola.get()) #2
print(cola.get()) #3

print(cola.empty())


#Diccionarios:
# -- las claves son inmutables, los valores son mutables

print("\nDiccionarios: \n")
dict = { "Juan": 20, "Pedro": 23, "Ariel": 40}

print(dict["Juan"])

print("Items del diccionario: ",dict.items())
