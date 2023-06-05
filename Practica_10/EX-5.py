def agregarFrasePrincipio (frase, archivo):
    f = open(str(archivo) + ".txt", "r")
    save = f.read()
    f.clear()
    f.close()
    
    f = open(str(archivo) + ".txt", "w")
    f.write(frase+"\n")
    f.write(save)
    f.close()
    