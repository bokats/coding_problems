import math
def CountSquares(a,b):
    if a < 0 and b < 1:
        return math.floor(math.sqrt(abs(a))) - math.ceil(math.sqrt(abs(b))) + 1
    elif a < 0:
        result = 0
        result += math.floor(math.sqrt(abs(a))) - math.ceil(math.sqrt(0)) + 1
        result += math.floor(math.sqrt(b)) - math.ceil(math.sqrt(1)) + 1
        return result
    else:
        return (math.floor(math.sqrt(b)) - math.ceil(math.sqrt(a)) + 1)

print(CountSquares(-5,10))
