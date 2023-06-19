from queue import LifoQueue as Pila


def cantidadElementos(p:Pila) -> int:
    return p.qsize()
        
