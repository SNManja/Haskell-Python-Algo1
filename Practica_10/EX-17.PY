from queue import Queue as Cola


def nPacientesUrgentes(c: Cola[(int,str,str)]) -> int:
    urgentes = []
    for paciente in c.queue:
        if paciente[0] <= 3 and paciente[0] >= 1:
            urgentes.append(paciente)
    return urgentes