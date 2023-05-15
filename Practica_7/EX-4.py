# Se conoce de cada arbol la altura expresada en metros
# el peso se estima
# 3kg por cada cm hasta 3metros
# 4kg por cada cm arriba de 3 metros

def peso_pino (largo: int):
    if(largo>=3):
        return 3 * 300 + 2 * (largo*100 - 30) 
    else:
        return 3 * (largo * 100)
    
def es_peso_util (peso: int):
    if(peso >= 400 and peso <= 1000):
        return True
    else:
        return False
    
def sirve_pino (altura: int):
    return es_peso_util(peso_pino(altura))
