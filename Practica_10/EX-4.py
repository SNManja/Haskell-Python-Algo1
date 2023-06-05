def agregaFrase(frase, archivo):
    f = open (str(archivo) + ".txt", "a")
    f.write(frase)
    f.close()
    
    