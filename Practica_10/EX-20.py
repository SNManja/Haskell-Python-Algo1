def laPalabraMasFrecuente(nombreArchivo:str) -> str:
    f = open(nombreArchivo+".txt", 'r')
    wordCounter:dict = {}
    for line in f:
        saveline = line.slice(0,-2)
        for word in saveline:
            if word in wordCounter:
                wordCounter[word] += 1
            else: 
                wordCounter[word] = 1
                
                