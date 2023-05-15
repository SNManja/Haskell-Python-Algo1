#aux
def es_multiplo_de (n: int, m: int):
    if (n / m == round(n/m,0)):
        return True
    else:
        return False


#

def es_nombre_largo (nombre) -> bool:
    return (length (nombre) >= 3 and length (nombre) <= 8)

def es_bisiesto(ano: int):
    if ((not (es_multiplo_de (ano, 100))) and (es_multiplo_de (ano, 4))):
        return True
    else:
        return False
    
    
    
