def leerArchivoComas(csv):
    f = open(csv+".csv", 'r')
    f.readline()
    for item in f:
        item = item.split(',')
        print("nro lu: "+str(item[0]) + ". materia: "+str(item[1])+". fecha: "+str(item[2])+". nota: "+str(item[3]))
    f.close()