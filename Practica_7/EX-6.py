
def de1a10 ():
    x: int = 1
    while x <= 10:
        print(x)
        x = x + 1
        
def parEntre10y40 ():
    x: int = 10
    while x <= 40:
        if(es_multiplo_de (x, 2)):
            x = x + 1
        else: 
            continue

    