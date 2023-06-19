import json
from queue import Queue
from typing import Dict, List, Union


# ACLARACIÓN: El tipo de "pedidos" debería ser: pedidos: Queue[Dict[str, Union[int, str, Dict[str, int]]]]
# Por no ser soportado por la versión de CMS, usamos simplemente "pedidos: Queue"
# ACLARACIÓN: El tipo de "pedidos" debería ser: pedidos: Queue[Dict[str, Union[int, str, Dict[str, int]]]]
# Por no ser soportado por la versión de CMS, usamos simplemente "pedidos: Queue"
def procesamiento_pedidos(pedidos: Queue,
                          stock_productos: Dict[str, int],
                          precios_productos: Dict[str, float]) -> List[Dict[str, Union[int, str, float, Dict[str, int]]]]:
  
  def checkStock(pedido:dict):
    estado = "completo"
    for producto in pedido.keys():
      if (stock_productos[producto]-pedido[producto] >=0):
        stock_productos[producto] -= pedido[producto]

      else:
        estado = "incompleto"
        pedido[producto] = stock_productos[producto]
        stock_productos[producto] = 0
    return [pedido,estado]
  
  def checkPrecio(pedido:dict):
    precio = 0
    for producto in pedido.keys():
      precio += precios_productos[producto] * pedido[producto]
    return precio
  
  res = []
  
  while not pedidos.empty():
    pedido = pedidos.get()
    pedidoProc = {}
    
    pedidoProc["id"] = pedido["id"]
    pedidoProc["cliente"] = pedido["cliente"]
    calcStock = checkStock(pedido["productos"])
    pedidoProc["productos"] = calcStock[0] #Devuelve lista de productos teniendo en cuenta el stock que haya
    pedidoProc["precio_total"] = checkPrecio(pedidoProc["productos"])
    pedidoProc["estado"] = calcStock[1]
    
    res.append(pedidoProc)
     
  return res




if __name__ == '__main__':
  pedidos: Queue = Queue()
  list_pedidos = json.loads(input())
  [pedidos.put(p) for p in list_pedidos]
  stock_productos = json.loads(input())
  precios_productos = json.loads(input())
  print("{} {}".format(procesamiento_pedidos(pedidos, stock_productos, precios_productos), stock_productos))

# Ejemplo input  
# pedidos: [{"id":21,"cliente":"Gabriela", "productos":{"Manzana":2}}, {"id":1,"cliente":"Juan","productos":{"Manzana":2,"Pan":4,"Factura":6}}]
# stock_productos: {"Manzana":10, "Leche":5, "Pan":3, "Factura":0}
# precios_productos: {"Manzana":3.5, "Leche":5.5, "Pan":3.5, "Factura":5}