from queue import LifoQueue as Pila


def buscarElMaximo(p: Pila) -> int:
    if(p.empty()):
        return -1
    return max(p.queue())
    
    