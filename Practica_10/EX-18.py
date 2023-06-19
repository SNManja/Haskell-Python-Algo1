def agruparPorLong(nombreArchivo:str)->dict:
    f = open(nombreArchivo+".txt", 'r')
    dic:dict = {}
    for linea in f:
        for word in linea.split(' '):
            if str(len(word)) in dic:
                dic[str(len(word))] += 1
            else:
                dic[str(len(word))] = 1

