from typing import List
from typing import Dict
import json

def unir_diccionarios(a_unir: List[Dict[str,str]]) -> Dict[str,List[str]]:
  mainDict:dict = {}
  for d in a_unir: 
    for key,value in d.items():
      if key not in mainDict.keys():
        mainDict[key] = []
      mainDict[key].append(value)
  return mainDict

d1:dict = {"a": "1", "b": "2"}
d2:dict = {"b": "3", "c": "4"}
d3:dict = {"a": "5"}

if __name__ == '__main__':
  x = json.loads(input()) # Ejemplo de input: [{"a":2},{"b":3,"a":1}]
  print(unir_diccionarios(x))