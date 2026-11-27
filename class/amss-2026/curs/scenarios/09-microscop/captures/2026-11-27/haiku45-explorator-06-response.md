Voi scrie un explorator complet care modelează sistemul ca un graf de stări accesibile și verifică proprietățile cerute.

```python
from collections import deque

class State:
    def __init__(self):
        self.state = {'X': 0, 'Y': 0, 'Z': 0}
        self.occupied = {'X': set(), 'Y': set(), 'Z': set()}
    
    def __hash__(self):
        return hash((tuple(sorted(self.state.items())),
                     tuple(sorted((k, tuple(sorted(v))) for k, v in self.occupied.items()))))
    
    def __eq__(self, other):
        return self.state == other.state and self.occupied == other.occupied
    
    def copy(self):
        s = State()
        s.state = self.state.copy()
        s.occupied = {k: v.copy() for k, v in self.occupied.items()}
        return s
    
    def get_free_devices(self):
        occupied = set()
        for devices in self.occupied.values():
            occupied.update(devices)
        return {'M', 'C', 'L'} - occupied
    
    def get_next_device(self, lucrare):
        order = {'X': ['M', 'C'], 'Y': ['C', 'L'], 'Z': ['M', 'L']}
        idx = len(self.occupied[lucrare])
        return order[lucrare][idx] if idx < 2 else None
    
    def can_occupy(self, lucrare):
        if self.state[lucrare] > 1:
            return False
        dev = self.get_next_device(lucrare)
        return dev and dev in self.get_free_devices()
    
    def can_finalize(self, lucrare):
        return self.state[lucrare] == 2
    
    def occupy(self, lucrare):
        if not self.can_occupy(lucrare):
            return False
        dev = self.get_next_device(lucrare)
        self.occupied[lucrare].add(dev)
        self.state[lucrare] = 1 if len(self.occupied[lucrare]) == 1 else 2
        return True
    
    def finalize(self, lucrare):
        if not self.can_finalize(lucrare):
            return False
        self.state[lucrare] = 3
        self.occupied[lucrare].clear()
        return True

def get_events(state):
    events = []
    for l in ['X', 'Y', 'Z']:
        if state.can_occupy(l):
            events.append(f"occupa({l})")
        if state.can_finalize(l):
            events.append(f"finalize({l})")
    return events

def apply_event(state, event):
    new_state = state.copy()
    lucrare = event.split('(')[1][0]
    if event.startswith("occupa"):
        new_state.occupy(lucrare)
    else:
        new_state.finalize(lucrare)
    return new_state

def explore():
    start = State()
    q = deque([start])
    visited = {start}
    parent = {start: None}
    
    while q:
        curr = q.popleft()
        for evt in get_events(curr):
            nxt = apply_event(curr, evt)
            if nxt not in visited:
                visited.add(nxt)
                q.append(nxt)
                parent[nxt] = (curr, evt)
    
    return visited, parent

def get_path(state, parent):
    path = []
    while parent[state]:
        p, evt = parent[state]
        path.append(evt)
        state = p
    return list(reversed(path))

states, parent_map = explore()
transitions = sum(1 for p in parent_map.values() if p)

print(f"Stări accesibile: {len(states)}")
print(f"Tranziții: {transitions}")

p1_ok = all(sum(1 for l in ['X', 'Y', 'Z'] if d in s.occupied[l]) <= 1
            for s in states for d in ['M', 'C', 'L'])
print(f"\nP1 - Exclusivitate: {'OK' if p1_ok else 'VIOLATĂ'}")

p2_ok = any(all(s.state[l] == 3 for l in ['X', 'Y', 'Z']) for s in states)
print(f"P2 - Finalizare posibilă: {'OK' if p2_ok else 'NU'}")

deadlock = next((s for s in states if any(s.state[l] != 3 for l in ['X', 'Y', 'Z'])
                 and not get_events(s)), None)
print(f"P3 - Fără blocaj: {'OK' if not deadlock else 'VIOLATĂ'}")
if deadlock:
    path = get_path(deadlock, parent_map)
    print(f"  Secvență: {' -> '.join(path)}")
```

Exploratorul modelează stările cu starea fiecărei lucrări (0=neînceput, 1=pregătit, 2=în lucru, 3=finalizat) și aparatele ocupate. Folosind BFS, explorează toate stările accesibile din starea inițială, unde toate sunt neînceput și aparatele libere. Pentru fiecare proprietate, raportează dacă e satisfăcută; dacă e încălcată, afișează secvența de evenimente care duce la încălcare (ciclu de deadlock pentru P3).