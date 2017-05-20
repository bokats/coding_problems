import math

def solution(A, B):
    if A < 0 and B < 0:
        return 0
    elif A < 0:
        return (int(math.floor(math.sqrt(B))) - int(math.ceil(math.sqrt(0))) + 1)
    else:
        return (int(math.floor(math.sqrt(B))) - int(math.ceil(math.sqrt(A))) + 1)

print(solution(4,17))
