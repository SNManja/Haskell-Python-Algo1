vocales:list = ["a", "e","i","o","u","A","E","I","O","U"]

def eliminarPares(s: list): # Pasa por referencia
    for i in range(len(s)):
        if i % 2 == 0:
            s[i] = 0
            
def eliminarParesHardCopy (s: list):
    copy:list = s[::]
    eliminarPares(copy)
    return copy

def sinVocales (s:list):
    global vocales
    res:list = []
    for i in s:
        if(s[i] in vocales):
            continue
        else :
            res += s[i]
    return res

def reemplazaVocales (s:list[chr]) -> list[chr]:
    global vocales
    res:list = []
    for i in range(len(s)):
        if (s[i] in vocales):
            res+= "_"
        else :
            res += s[i]
    return res

def daVueltaStr (s:list[chr]) -> list[chr]:
    res:list = []
    for i in range(len(s)-1, -1, -1):
        res.append(s[i])
    return res    
