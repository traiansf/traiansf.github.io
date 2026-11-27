Voi construi un explorator de stări care parcurge toate configurațiile accesibile ale sistemului, apoi verific proprietățile.

```python
from collections import deque

def get_order(job):
    return {'X': ['M', 'C'], 'Y': ['C', 'L'], 'Z': ['M', 'L']}[job]

def state_tuple(jobs, devices):
    items = []
    for job in ['X', 'Y', 'Z']:
        status, devs = jobs[job]
        items.append((job, status, tuple(sorted(devs))))
    for dev in ['M', 'C', 'L']:
        items.append((dev, devices[dev]))
    return tuple(items)

def get_events(jobs, devices):
    events = []
    for job in ['X', 'Y', 'Z']:
        status, devs = jobs[job]
        
        if status in ['NotStarted', 'Ready']:
            order = get_order(job)
            if len(devs) < len(order):
                dev = order[len(devs)]
                if devices[dev] is None:
                    events.append(('occupy', job, dev))
        
        if status == 'Working':
            events.append(('finish', job))
    
    return events

def apply(jobs, devices, event):
    if event[0] == 'occupy':
        _, job, dev = event
        status, devs = jobs[job]
        order = get_order(job)
        
        if len(devs) >= len(order) or order[len(devs)] != dev or devices[dev] is not None:
            return None
        
        new_jobs = {j: (s, set(d)) for j, (s, d) in jobs.items()}
        new_devices = dict(devices)
        
        new_devs = new_jobs[job][1]
        new_devs.add(dev)
        new_devices[dev] = job
        
        if len(new_devs) == 1:
            new_jobs[job] = ('Ready', new_devs)
        else:
            new_jobs[job] = ('Working', new_devs)
        
        return new_jobs, new_devices
    
    elif event[0] == 'finish':
        _, job = event
        status, devs = jobs[job]
        
        if status != 'Working':
            return None
        
        new_jobs = {j: (s, set(d)) for j, (s, d) in jobs.items()}
        new_devices = dict(devices)
        
        for dev in new_jobs[job][1]:
            new_devices[dev] = None
        new_jobs[job] = ('Done', set())
        
        return new_jobs, new_devices
    
    return None

def explore():
    init_jobs = {'X': ('NotStarted', set()), 'Y': ('NotStarted', set()), 'Z': ('NotStarted', set())}
    init_devices = {'M': None, 'C': None, 'L': None}
    
    visited = {}
    q = deque([(init_jobs, init_devices, [])])
    trans = 0
    
    while q:
        jobs, devices, path = q.popleft()
        
        t = state_tuple(jobs, devices)
        if t in visited:
            continue
        visited[t] = (jobs, devices, path)
        
        for evt in get_events(jobs, devices):
            result = apply(jobs, devices, evt)
            if result is not None:
                trans += 1
                new_jobs, new_devices = result
                nt = state_tuple(new_jobs, new_devices)
                if nt not in visited:
                    q.append((new_jobs, new_devices, path + [evt]))
    
    return visited, trans

def main():
    visited, trans = explore()
    
    print(f"Stari accesibile: {len(visited)}")
    print(f"Tranzitii: {trans}")
    
    # P1: Exclusivitate
    p1_ok, p1_path = True, None
    for t, (jobs, devices, path) in visited.items():
        for dev in ['M', 'C', 'L']:
            cnt = sum(1 for job in ['X', 'Y', 'Z'] if dev in jobs[job][1])
            if cnt > 1:
                p1_ok, p1_path = False, path
                break
        if not p1_ok:
            break
    
    print(f"P1 (Exclusivitate): {'OK' if p1_ok else 'VIOLAT'}")
    if not p1_ok:
        print("  Secventa catre violatie:")
        for evt in p1_path:
            print(f"    {evt[0]}({evt[1]}, {evt[2] if len(evt) > 2 else ''})")
    
    # P2: Finalizare posibilă
    p2_ok = any(all(jobs[j][0] == 'Done' for j in ['X', 'Y', 'Z']) 
                 for t, (jobs, devices, path) in visited.items())
    print(f"P2 (Finalizare posibila): {'OK' if p2_ok else 'IMPOSIBIL'}")
    
    # P3: Fără blocaj
    p3_ok, p3_path = True, None
    for t, (jobs, devices, path) in visited.items():
        if any(jobs[j][0] != 'Done' for j in ['X', 'Y', 'Z']):
            if not get_events(jobs, devices):
                p3_ok, p3_path = False, path
                break
    
    print(f"P3 (Fara blocaj): {'OK' if p3_ok else 'BLOCARE'}")
    if not p3_ok:
        print("  Secventa catre blocare:")
        for evt in p3_path:
            print(f"    {evt[0]}({evt[1]}, {evt[2] if len(evt) > 2 else ''})")

if __name__ == '__main__':
    main()
```

Exploratorul construiește graful de stări accesibile pornind din configurația inițială (toate aparatele libere, lucrările neinceput). Pentru fiecare stare, determină evenimentele permise și generează stări succesoare. Verică apoi proprietățile: P1 asigură că nicio aparat nu e ocupată de mai mult de o lucrare; P2 verifică existența unei stări finale unde toate sunt Finalizate; P3 testează absența blocajelor. Dacă o proprietate e violată, raportează secvența de evenimente care duce acolo.