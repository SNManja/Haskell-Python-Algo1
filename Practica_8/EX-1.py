import math


def pertenece (s: list, z) :  #Efectivamente, funciona con char en string
    for num in s:
        if (z == num):
            return True
    return False 

def divideATodos (s:list, z: int):
    for i in range(0, len(s),1):
        if s[i] % z != 0:
            return False
        
def sumaTotal (s:list):
    count: int = 0
    for elem in s:
        count += elem
    return count

def ordenados (s: list):
    if(len(s)<=1):
        return True
    save : int = s[0]
    for elem in s:
        if(save > elem):
            return False
        save = elem
    return True

def listaLarga (s: list):
    if (len(s)<=7):
        return True
    else:
        return False


def esPalindroma (s:list):
        save = list(s)
        save.reverse()
        for i in range(0,math.ceil(len(s)/2),1):
            if save[i] != s[i]:
                return False
        return True

def strongPassword(s:list):
    def tieneMin (s:list):
        for elem in s:
            if(ord(elem) >= 97 and ord(elem) <=122):
                return True
        return False
            
    def tieneMax (s:list):
        for elem in s:
            if(ord(elem) >= 65 and ord(elem) <= 90):
                return True
        return False
    
    def tieneNum (s:list):
        for elem in s:
            if(ord(elem) >=49 and ord(elem) <= 57):
                return True
        return False
        
    if len(s) >= 8 and tieneMin(s) and tieneMax(s) and tieneNum(s):
        return "VERDE"
    elif len(s) < 5:
        return "ROJA"
    else:
        return "AMARILLA"
    
def saldoActual(movim : list):
    count = 0
    for tupla in movim:
        if(tupla[0] == 'I'):
            print("INGRESO", tupla[1])
            count += tupla[1]
        elif(tupla[0] == 'R'):
            print("RETIRO", tupla[1])
            count -= tupla[1]
        else:
            print("error: unknown operation")
    return count

def masde3vocales(s: list):
    def vocal (e):
        e = e.lower()
        if (e == 'a' or e == 'e' or e == 'i' or e == 'o' or e == 'u'):
            return True
        else:
            return False
        
    count = 0
    for elem in s:
        if(vocal(elem)):
            count += 1
    return (count >= 3)