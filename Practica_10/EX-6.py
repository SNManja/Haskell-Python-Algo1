def binario_a_legible (archivo):
    f = open(str(archivo)+".txt", 'rb')
    save = f.read()
    print (save.decode('utf-8'))
    f.close()
    