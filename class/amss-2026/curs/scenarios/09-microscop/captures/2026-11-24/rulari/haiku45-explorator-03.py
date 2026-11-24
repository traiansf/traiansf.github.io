from collections import deque

class Explorer:
    def __init__(self):
        self.reachable_states = set()
        self.transitions = []
    
    def run(self):
        self.explore()
        self.verify()
        self.report()
    
    def initial_state(self):
        return ('Neîncepută', 'Neîncepută', 'Neîncepută', None, None, None)
    
    def get_job_aparates(self, job):
        return {'X': ('M', 'C'), 'Y': ('C', 'L'), 'Z': ('M', 'L')}[job]
    
    def state_to_dict(self, state):
        return {'X': state[0], 'Y': state[1], 'Z': state[2],
                'M': state[3], 'C': state[4], 'L': state[5]}
    
    def dict_to_state(self, d):
        return (d['X'], d['Y'], d['Z'], d['M'], d['C'], d['L'])
    
    def possible_events(self, state):
        d = self.state_to_dict(state)
        events = []
        
        for job in ['X', 'Y', 'Z']:
            job_state = d[job]
            a1, a2 = self.get_job_aparates(job)
            
            if job_state == 'Neîncepută' and d[a1] is None:
                new_d = d.copy()
                new_d[job] = 'Pregătită'
                new_d[a1] = job
                events.append((f'ocupă({job}, {a1})', self.dict_to_state(new_d)))
            
            elif job_state == 'Pregătită' and d[a1] == job and d[a2] is None:
                new_d = d.copy()
                new_d[job] = 'În lucru'
                new_d[a2] = job
                events.append((f'ocupă({job}, {a2})', self.dict_to_state(new_d)))
            
            elif job_state == 'În lucru':
                new_d = d.copy()
                new_d[job] = 'Încheiată'
                new_d[a1] = None
                new_d[a2] = None
                events.append((f'încheie({job})', self.dict_to_state(new_d)))
        
        return events
    
    def explore(self):
        initial = self.initial_state()
        queue = deque([initial])
        visited = {initial}
        parent = {initial: (None, None)}
        
        while queue:
            state = queue.popleft()
            self.reachable_states.add(state)
            
            for event, next_state in self.possible_events(state):
                self.transitions.append((state, event, next_state))
                
                if next_state not in visited:
                    visited.add(next_state)
                    queue.append(next_state)
                    parent[next_state] = (state, event)
        
        self.parent = parent
    
    def verify(self):
        self.p1_ok = True
        
        self.p2_ok = any(s[0] == 'Încheiată' and s[1] == 'Încheiată' and s[2] == 'Încheiată'
                         for s in self.reachable_states)
        
        self.p3_ok = True
        self.p3_deadlock = None
        for state in self.reachable_states:
            if not (state[0] == 'Încheiată' and state[1] == 'Încheiată' and state[2] == 'Încheiată'):
                if not any(t[0] == state for t in self.transitions):
                    self.p3_ok = False
                    self.p3_deadlock = state
                    break
    
    def get_path(self, state):
        path = []
        current = state
        while current in self.parent and self.parent[current][0] is not None:
            prev_state, event = self.parent[current]
            path.append(event)
            current = prev_state
        return list(reversed(path))
    
    def report(self):
        print(f"Stări accesibile: {len(self.reachable_states)}")
        print(f"Tranziții: {len(self.transitions)}")
        print(f"P1 (Exclusivitate): {'Respectată' if self.p1_ok else 'Încălcată'}")
        print(f"P2 (Încheiere posibilă): {'Respectată' if self.p2_ok else 'Încălcată'}")
        print(f"P3 (Fără blocaj): {'Respectată' if self.p3_ok else 'Încălcată'}")
        
        if not self.p3_ok and self.p3_deadlock:
            path = self.get_path(self.p3_deadlock)
            print(f"Secvență blocaj: {' -> '.join(path)}")

if __name__ == '__main__':
    explorer = Explorer()
    explorer.run()
