import random


def armaLista():
    print("Ingrese 'listo' para terminar")
    res = []
    while True:
        s = input("Ingrese nombre")
        if(s=="listo"):
            return res
        res.append(s)

def operacionSube():
    saveData = []
    creditos = 0
    while True:
        mainInput = input("Seleccione operacion: ")
        if(mainInput=="C"):
            s = int(input("Carga: "))
            creditos += s
            saveData.append("C", s)
        elif(mainInput=="D"):
            s = int(input("Gasto: "))
            creditos -= s
            saveData.append("C", s)
        elif(mainInput=="X"):
            break;
        else:
            print("Wrong input, try again")
    return { creditos, saveData }

def sieteYmedio ():
    def randCarta ():
        def valorCarta(s:int):
            if(s == 10 or s == 11 or s == 12):
                return 0.5
            else:
                return s
        s = -1
        while s == -1 or s == 8 or s == 9 :
            s = random.randint(1,12)
        return (s, valorCarta(s))
    
    historial = []
    puntos =0
    while True:
        i = input("X para plantarse, cualquier cosa para seguir")
        if(i=="X"):
            print("Plantado")
            break
        else:
            selec = randCarta()
            historial.append(selec[1])
            print("Toco " + str(selec[1]))
            puntos += selec[0]
            if(puntos > 7.5):
                print("Perdiste")
                print(historial)
                break
            elif(puntos == 7.5):
                print("ganaste")
                break

        
            