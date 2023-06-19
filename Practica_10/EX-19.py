def promedioNota ():
    f = open("notas.csv", "r")
    notas:dict = {}
    for line in f:
        s = line.split(",")
        print(str(s[3][-1])])
        if(s[3][-1]== 'n'):
            
            s[3] = s[3].slice(0,-2)
        notas[s[0]] = s[3]
    print(notas)
    return notas    
    