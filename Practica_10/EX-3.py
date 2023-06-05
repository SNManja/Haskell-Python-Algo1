def reversorDeTextos (texto):
    f = open(str(texto) +".txt","r")
    save = []
    for line in f:
        save.append(line)
    save.reverse()
    f.close()
    f = open(str(texto) +".txt","w")
    for elem in save:
        f.write(elem)
    f.close()

