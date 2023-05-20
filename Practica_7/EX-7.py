def unoAlDiez():
    for num in range(1,11,1):
        print(num)
        
def diezAlCuarentaPares():
    for num in range (10, 41, 2):
        print(num)
        
def echo():
    for i in range (1,11,1):
        print("echo " +  str(i))
        
def cuentaCohetec (param: int):
    for i in range (1, param, 1):
        print("Cuena regresiva", param)
    print("Despegue")

def viajeEnElTiempo (part : int, lleg: int):
    for i in range (part, lleg,-1):
        print("Viaje al pasado, estamos en", i)
    print("llegamos al", lleg)
    
def viajeAristoteles (part: int):
    if( part > -384):
        for i in range (part, -384, -20):
            print("Viaje al pasado, estamos en:", i)
    else: 
        for i in range(part, -384, +20):
            print("Viaje al futuro, estamos en:", i)
    print("Podemos conocer a Aristoteles")