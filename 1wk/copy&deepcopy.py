import copy

x={"a":{"python":2.7},"b":{"python":3.7}}

y = x.copy()
z = copy.deepcopy(x)

y["a"]["python"]=2.8 # 반영됨
z["b"]["python"]=3.8 # 반영되지 않음


print(x)
print(y)
print(z)

print(id(x["a"]["python"]), id(y["a"]["python"])) #id가 동일하니 변경됨
print(id(x["b"]["python"]), id(z["b"]["python"])) #id가 다르니 변경안됨