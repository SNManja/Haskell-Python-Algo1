from queue import Queue as Cola


def buscarElMaximo(c:Cola) -> int:
    return max (c.queue)

def buscarElMaximoAlt(c:Cola) -> int:
    max = None
    for num in c.queue:
        if num > max or max == None: max = num
    return max
        
    

