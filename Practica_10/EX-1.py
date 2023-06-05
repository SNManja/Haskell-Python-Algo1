
def contarLineas(nombreArchivo):
    f = open(str(nombreArchivo) + ".txt", 'r')
    count = 0
    
    while True:
        ultimaLinea = f.readline()
        if ultimaLinea == '' :
            break
        count += 1
    
    f.close()
    return 0

def existePalabra(palabra:str, nombreArchivo:str) -> bool:
    f = open(str(nombreArchivo) + ".txt", 'r')
    for line in f:
        if(palabra in line):
            f.close()
            return True
    else: 
        f.close()
        return False

def cantidadApariciones(nombreArchivo: str, palabra:str) -> int:
    f = open(str(nombreArchivo) + ".txt", 'r')
    count =0
    for line in f:
        if (palabra in line):
            count +=1
    f.close()
    return count
