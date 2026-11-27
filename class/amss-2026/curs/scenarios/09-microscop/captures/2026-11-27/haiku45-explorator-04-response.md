Scriu un explorator cu BFS care modelează stările și tranziții ale sistemului, verificând P1-P3.

```python
from collections import deque

def explore_model():
    needs = [
        [0, 1],  # X: M, C
        [1, 2],  # Y: C, L
        [0, 2]   # Z: M, L
    ]
    
    app_names = {0: 'M', 1: 'C', 2: 'L'}
    job_names = ['X', 'Y', 'Z']
    
    # Stare: (finalizate[3], detinator_aparat[3])
    initial_state = (
        (False, False, False),
        (None, None, None)
    )
    
    visited = {}
    queue = deque([(initial_state, [])])
    visited[initial_state] = []
    
    final_state = ((True, True, True), (None, None, None))
    final_accessible = False
    num_edges = 0
    
    while queue:
        state, path = queue.popleft()
        job_fin, app_holder = state
        
        if state == final_state:
            final_accessible = True
        
        for job_idx in range(3):
            if not job_fin[job_idx]:
                held_count = sum(1 for i in range(3) if app_holder[i] == job_idx)
                
                # Ocupare aparat
                if held_count < len(needs[job_idx]):
                    next_app = needs[job_idx][held_count]
                    
                    if app_holder[next_app] is None:
                        new_app_holder = list(app_holder)
                        new_app_holder[next_app] = job_idx
                        new_state = (job_fin, tuple(new_app_holder))
                        
                        if new_state not in visited:
                            new_path = path + [(job_names[job_idx], f"ocupă({job_names[job_idx]}, {app_names[next_app]})")]
                            visited[new_state] = new_path
                            queue.append((new_state, new_path))
                            num_edges += 1
                
                # Finalizare
                if held_count == len(needs[job_idx]):
                    new_job_fin = list(job_fin)
                    new_job_fin[job_idx] = True
                    new_app_holder = list(app_holder)
                    for app in needs[job_idx]:
                        new_app_holder[app] = None
                    
                    new_state = (tuple(new_job_fin), tuple(new_app_holder))
                    
                    if new_state not in visited:
                        new_path = path + [(job_names[job_idx], f"finalizează({job_names[job_idx]})")]
                        visited[new_state] = new_path
                        queue.append((new_state, new_path))
                        num_edges += 1
    
    num_states = len(visited)
    
    # Verificare P1: exclusivitate
    p1_ok = True
    p1_path = None
    for state in visited:
        _, app_holder = state
        for app in range(3):
            count = sum(1 for holder in app_holder if holder == app)
            if count > 1:
                p1_ok = False
                p1_path = visited[state]
                break
        if not p1_ok:
            break
    
    # Verificare P2: finalizare posibilă
    p2_ok = final_accessible
    
    # Verificare P3: fără blocaj
    p3_ok = True
    p3_path = None
    for state in visited:
        job_fin, app_holder = state
        if all(job_fin):
            continue
        
        event_possible = False
        for job_idx in range(3):
            if not job_fin[job_idx]:
                held_count = sum(1 for i in range(3) if app_holder[i] == job_idx)
                
                if held_count < len(needs[job_idx]):
                    next_app = needs[job_idx][held_count]
                    if app_holder[next_app] is None:
                        event_possible = True
                        break
                
                if held_count == len(needs[job_idx]):
                    event_possible = True
                    break
        
        if not event_possible:
            p3_ok = False
            p3_path = visited[state]
            break
    
    print(f"Stări accesibile: {num_states}")
    print(f"Tranziții: {num_edges}")
    print(f"P1 (exclusivitate): {'OK' if p1_ok else 'VIOLATĂ'}")
    print(f"P2 (finalizare): {'OK' if p2_ok else 'VIOLATĂ'}")
    print(f"P3 (fără blocaj): {'OK' if p3_ok else 'VIOLATĂ'}")
    
    if not p1_ok:
        print("\nP1 - Exclusivitate violată. Secvență:")
        for _, event in p1_path:
            print(f"  {event}")
    elif not p2_ok:
        print("\nP2 - Starea finală nu e accesibilă")
    elif not p3_ok:
        print("\nP3 - Deadlock detectat. Secvență:")
        for _, event in p3_path:
            print(f"  {event}")

if __name__ == '__main__':
    explore_model()
```

**Rezumat**: Exploratorul construiește spațiul de stări cu BFS, unde fiecare stare codifică care lucrări sunt finalizate și ce aparat ține fiecare. Verific P1 (nici un aparat nu e ocupat de două lucrări simultan), P2 (starea finală e accesibilă) și P3 (din orice stare necomletă există o tranziție posibilă). Pentru proprietatea încălcată, afișez traseul care o violeaza.