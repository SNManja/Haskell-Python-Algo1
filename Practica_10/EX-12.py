from queue import LifoQueue as Pila

operaciones = ["+", "-", "*", "/"]
paretesis = ["(",")"]

#Checkea solo los parentesis, no la correctitud de las cuentas.
def estaBienBalanceada(s:str)-> bool:
    parenStack = Pila()
    for char in s:
        if char == '(':
            parenStack.put(')')  
        elif char == ')' and not(parenStack.empty()):
            parenStack.get()
        elif char == ')' and parenStack.empty():
            return False
    if parenStack.empty():
        return True
    else:
        return False            

