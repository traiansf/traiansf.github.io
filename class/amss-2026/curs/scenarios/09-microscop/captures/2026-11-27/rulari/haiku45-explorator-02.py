from collections import deque

NESTART, PREGATITA, IN_LUCRU, FINALIZATA = 0, 1, 2, 3
M, C, L = "M", "C", "L"

NECESARE = {"X": [M, C], "Y": [C, L], "Z": [M, L]}

class State:
    def __init__(self):
        self.aparate = {M: None, C: None, L: None}
        self.lucrari = {"X": NESTART, "Y": NESTART, "Z": NESTART}
        self.ocupate = {"X": [], "Y": [], "Z": []}
    
    def __hash__(self):
        return hash((tuple(sorted(self.aparate.items())),
                     tuple(sorted(self.lucrari.items())),
                     tuple((l, tuple(sorted(self.ocupate[l]))) for l in sorted(self.ocupate))))
    
    def __eq__(self, other):
        return self.aparate == other.aparate and self.lucrari == other.lucrari and self.ocupate == other.ocupate
    
    def copy(self):
        s = State()
        s.aparate = self.aparate.copy()
        s.lucrari = self.lucrari.copy()
        s.ocupate = {l: self.ocupate[l].copy() for l in self.ocupate}
        return s

def next_aparat(state, lucrare):
    if state.lucrari[lucrare] == FINALIZATA:
        return None
    idx = len(state.ocupate[lucrare])
    return NECESARE[lucrare][idx] if idx < len(NECESARE[lucrare]) else None

def get_moves(state):
    moves = []
    for lucrare in ["X", "Y", "Z"]:
        aparat = next_aparat(state, lucrare)
        if aparat and state.aparate[aparat] is None:
            moves.append(("ocupa", lucrare, aparat))
    for lucrare in ["X", "Y", "Z"]:
        if state.lucrari[lucrare] == IN_LUCRU:
            moves.append(("finalizeaza", lucrare))
    return moves

def apply(state, move):
    s = state.copy()
    if move[0] == "ocupa":
        l, a = move[1], move[2]
        s.aparate[a] = l
        s.ocupate[l].append(a)
        s.lucrari[l] = PREGATITA if len(s.ocupate[l]) == 1 else IN_LUCRU
    else:
        l = move[1]
        s.lucrari[l] = FINALIZATA
        for a in s.ocupate[l]:
            s.aparate[a] = None
        s.ocupate[l] = []
    return s

def explore():
    visited = {}
    queue = deque([(State(), [])])
    
    while queue:
        state, path = queue.popleft()
        h = hash(state)
        if h in visited:
            continue
        visited[h] = (state, path)
        for move in get_moves(state):
            new_state = apply(state, move)
            if hash(new_state) not in visited:
                queue.append((new_state, path + [move]))
    
    return visited

def format_event(event):
    if event[0] == "ocupa":
        return f"ocupă({event[1]}, {event[2]})"
    else:
        return f"finalizează({event[1]})"

def main():
    visited = explore()
    states = [s for s, _ in visited.values()]
    
    print(f"Stări accesibile: {len(states)}")
    print(f"Tranziții: {sum(len(get_moves(s)) for s in states)}")
    print()
    
    p1_ok = all(sum(1 for l in ["X", "Y", "Z"] if a in s.ocupate[l]) <= 1 for s in states for a in [M, C, L])
    print(f"{'✓' if p1_ok else '✗'} P1 (Exclusivitate): {'Respectată' if p1_ok else 'Încălcată'}")
    
    p2_ok = any(all(s.lucrari[l] == FINALIZATA for l in ["X", "Y", "Z"]) for s in states)
    print(f"{'✓' if p2_ok else '✗'} P2 (Finalizare posibilă): {'Respectată' if p2_ok else 'Încălcată'}")
    
    blocked = None
    for s in states:
        if any(s.lucrari[l] != FINALIZATA for l in ["X", "Y", "Z"]) and not get_moves(s):
            blocked = s
            break
    
    if blocked:
        print(f"✗ P3 (Fără blocaj): Încălcată")
        for state, path in visited.values():
            if state == blocked:
                print(f"  Secvență: {[format_event(e) for e in path]}")
                break
    else:
        print(f"✓ P3 (Fără blocaj): Respectată")

if __name__ == "__main__":
    main()
