from collections import deque

# Ordinea ocupării: X(M,C), Y(C,L), Z(M,L)
ordinea = {'X': ['M', 'C'], 'Y': ['C', 'L'], 'Z': ['M', 'L']}

def initial_state():
    # (stare_X, stare_Y, stare_Z, aparat_M, aparat_C, aparat_L)
    # stare: Initiata, Pregatita, In_lucru, Finalizata
    # aparat: X, Y, Z, None
    return ('Initiata', 'Initiata', 'Initiata', None, None, None)

def get_moves(state):
    moves = []
    lucrari_idx = {'X': 0, 'Y': 1, 'Z': 2}
    aparate_idx = {'M': 3, 'C': 4, 'L': 5}
    aparate = {'M': state[3], 'C': state[4], 'L': state[5]}
    
    for lucrare in ['X', 'Y', 'Z']:
        L_idx = lucrari_idx[lucrare]
        L_state = state[L_idx]
        
        # Ocupă următorul aparat
        if L_state == 'Initiata':
            aparat = ordinea[lucrare][0]
            if state[aparate_idx[aparat]] is None:
                moves.append(('ocupa', lucrare, aparat, 'Pregatita'))
        elif L_state == 'Pregatita':
            aparat = ordinea[lucrare][1]
            if state[aparate_idx[aparat]] is None:
                moves.append(('ocupa', lucrare, aparat, 'In_lucru'))
        
        # Finalizează
        if L_state == 'In_lucru':
            moves.append(('finalizeaza', lucrare))
    
    return moves

def apply_move(state, move):
    new_state = list(state)
    lucrari_idx = {'X': 0, 'Y': 1, 'Z': 2}
    aparate_idx = {'M': 3, 'C': 4, 'L': 5}
    
    if move[0] == 'ocupa':
        lucrare, aparat, new_L_state = move[1], move[2], move[3]
        new_state[lucrari_idx[lucrare]] = new_L_state
        new_state[aparate_idx[aparat]] = lucrare
    elif move[0] == 'finalizeaza':
        lucrare = move[1]
        new_state[lucrari_idx[lucrare]] = 'Finalizata'
        for aparat in ordinea[lucrare]:
            new_state[aparate_idx[aparat]] = None
    
    return tuple(new_state)

# BFS explorator
visited = set()
queue = deque()
initial = initial_state()
queue.append(initial)
visited.add(initial)
parent = {initial: None}
transitions = 0

while queue:
    state = queue.popleft()
    
    for move in get_moves(state):
        next_state = apply_move(state, move)
        transitions += 1
        
        if next_state not in visited:
            visited.add(next_state)
            queue.append(next_state)
            parent[next_state] = (state, move)

# Raportare
print(f"Stări accesibile: {len(visited)}")
print(f"Tranziții: {transitions}")

# P1: exclusivitate (garantată de reprezentare)
print(f"P1 (exclusivitate): OK")

# P2: finalizare posibilă
final_state = ('Finalizata', 'Finalizata', 'Finalizata', None, None, None)
p2_ok = final_state in visited
print(f"P2 (finalizare posibilă): {'OK' if p2_ok else 'INCALCATA'}")

# P3: fără blocaj
p3_ok = True
blocked = None
for state in visited:
    if any(state[i] != 'Finalizata' for i in [0, 1, 2]):
        if not get_moves(state):
            p3_ok = False
            blocked = state
            break

print(f"P3 (fără blocaj): {'OK' if p3_ok else 'INCALCATA'}")

if not p3_ok:
    path = []
    current = blocked
    while parent[current]:
        state, move = parent[current]
        path.append(f"{move[0]}({move[1]}{',' + move[2] if len(move) > 2 else ''})")
        current = state
    path.reverse()
    print(f"  Secvență: {' → '.join(path)}")
    print(f"  Stare blocată: {blocked}")
