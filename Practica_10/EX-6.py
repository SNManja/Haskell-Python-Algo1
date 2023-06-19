def binario_a_legible(binario):
    caracteres = []
    bytes_binarios = binario.split()
    for byte_binario in bytes_binarios:
        byte_decimal = int(byte_binario, 2)
        caracter = chr(byte_decimal)
        caracteres.append(caracter)
    texto_legible = ''.join(caracteres)
    return texto_legible