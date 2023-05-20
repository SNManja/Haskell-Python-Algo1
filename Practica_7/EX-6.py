
def de1a10 ():
    x: int = 1
    while x <= 10:
        print(x)
        x = x + 1
        
def parEntre10y40 ():
    def es_multiplo_de (n: int, m: int):
        if (n / m == round(n/m,0)):
            return True
        else:
            return False

    x: int = 10
    while x <= 40:
        if(es_multiplo_de (x, 2)):
            x = x + 1
        else: 
            continue

def echo ():
    i: int = 1
    while i<=10:
        print("echo")
        i += 1

def cuentaCohete(n: int):
    while n <= 1:
        print(n)
        n += 1
    print("despegue")


def viajeEnElTiempo (part : int, lleg : int):
    while lleg < part:
        print ("Viajo un ano al pasado estamos en el: ",part)
        part -= 1
        
    print("abordamos en el ano", part)

def viajeAristoteles (part : int):
    if (part > -384):
        while part > -384:
            part -= 20
            print ("Viajo un ano al pasado estamos en el: ",part)
    else :
        while part < -384:
            part += 20
            print ("Viajo un ano al futuro estamos en el: ",part)
    print("Ahora podemos conocer a Aristoteles")
            