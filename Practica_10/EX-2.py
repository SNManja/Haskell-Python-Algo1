def clonarSinComentarios (nombreArchivo:str):
    
    def esComment(linea:str):
        for char in linea:
            if(char == "" ):
                continue
            elif (char == "#"):
                return True
            else:
                return False
        
    
    f = open(str(nombreArchivo) + ".txt", 'r')
    cloneWithoutComment = []
    for i in f:
        if (esComment(i)):
            continue
        else:
            cloneWithoutComment.append(i)
    f.close()
    return cloneWithoutComment



