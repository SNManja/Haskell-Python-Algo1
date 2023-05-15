def es_multiplo_de (n: int, m: int):
    if (n / m == round(n/m,0)):
        return True
    else:
        return False



def devolver_el_doble_si_es_par (un_numero : int):
    if (es_multiplo_de(un_numero, 2)):
        return un_numero *2
    else: 
        return un_numero

def devolver_valor_si_es_par_sino_el_que_sigue (un_numero : int):
    if(devolver_el_doble_si_es_par(un_numero) == un_numero):
        return un_numero +1
    else: 
        return un_numero 
    
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(un_numero: int):
    if(es_multiplo_de (un_numero, 9)):
        return un_numero * 3
    elif (es_multiplo_de (un_numero,3)): 
        return un_numero * 2
    else: 
        return un_numero
    
def muchas_letras(nombre):
    if(length (nombre) >= 5):
        return "Tu nombre tiene muchas letras!"
    else: 
        return "Tu nombre tiene menos de 5 caracteres"

def vacasOlaburo (sexo, edad: int):
    if(edad < 18 or jubilado(sexo, edad)):
        print("Anda de vacas")
    else:
        print("Te toca trabajar")
        
def jubilado(sexo, edad: int)-> bool:
    if((sexo== "M" and edad >= 65) or (sexo == "F" and edad >= 60)):
        return True
    else: False
        