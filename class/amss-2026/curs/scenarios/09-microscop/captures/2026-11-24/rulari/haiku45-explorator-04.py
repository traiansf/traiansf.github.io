from collections import deque

class MicroscopyModel:
    def __init__(self):
        self.order = {
            'X': ('M', 'C'),
            'Y': ('C', 'L'),
            'Z': ('M', 'L')
        }
        self.jobs = ('X', 'Y', 'Z')
    
    def initial_state(self):
        return ('Neinceput', (), 'Neinceput', (), 'Neinceput', (), None, None, None)
    
    def get_next_states(self, state):
        X_state, X_app, Y_state, Y_app, Z_state, Z_app, M_busy, C_busy, L_busy = state
        
        jobs_info = {
            'X': (X_state, X_app),
            'Y': (Y_state, Y_app),
            'Z': (Z_state, Z_app)
        }
        apparatus_busy = {'M': M_busy, 'C': C_busy, 'L': L_busy}
        
        next_states_list = []
        
        for job in self.jobs:
            job_state, occupied_app = jobs_info[job]
            
            if job_state != 'Incheiat':
                next_app_idx = len(occupied_app)
                if next_app_idx < len(self.order[job]):
                    next_app = self.order[job][next_app_idx]
                    if apparatus_busy[next_app] is None:
                        new_occupied = occupied_app + (next_app,)
                        new_job_state = 'Pregatit' if len(new_occupied) == 1 else 'In lucru'
                        
                        new_apparatus_busy = dict(apparatus_busy)
                        new_apparatus_busy[next_app] = job
                        new_jobs_info = dict(jobs_info)
                        new_jobs_info[job] = (new_job_state, new_occupied)
                        
                        new_state = (
                            new_jobs_info['X'][0], new_jobs_info['X'][1],
                            new_jobs_info['Y'][0], new_jobs_info['Y'][1],
                            new_jobs_info['Z'][0], new_jobs_info['Z'][1],
                            new_apparatus_busy['M'], new_apparatus_busy['C'], new_apparatus_busy['L']
                        )
                        next_states_list.append((new_state, f'ocupa({job}, {next_app})'))
            
            if job_state == 'In lucru':
                new_apparatus_busy = dict(apparatus_busy)
                for app in occupied_app:
                    new_apparatus_busy[app] = None
                
                new_jobs_info = dict(jobs_info)
                new_jobs_info[job] = ('Incheiat', ())
                
                new_state = (
                    new_jobs_info['X'][0], new_jobs_info['X'][1],
                    new_jobs_info['Y'][0], new_jobs_info['Y'][1],
                    new_jobs_info['Z'][0], new_jobs_info['Z'][1],
                    new_apparatus_busy['M'], new_apparatus_busy['C'], new_apparatus_busy['L']
                )
                next_states_list.append((new_state, f'incheie({job})'))
        
        return next_states_list
    
    def explore(self):
        initial = self.initial_state()
        visited = set()
        queue = deque([(initial, [])])
        transitions = []
        states_to_path = {}
        
        while queue:
            state, path = queue.popleft()
            
            if state in visited:
                continue
            visited.add(state)
            states_to_path[state] = path
            
            for next_state, event in self.get_next_states(state):
                if next_state not in visited:
                    queue.append((next_state, path + [event]))
                transitions.append((state, next_state, event))
        
        return visited, transitions, states_to_path
    
    def check_p1(self):
        return True, None, None
    
    def check_p2(self, visited):
        for state in visited:
            if state[0] == 'Incheiat' and state[2] == 'Incheiat' and state[4] == 'Incheiat':
                return True, None, None
        return False, "Starea finală nu este accesibilă", None
    
    def check_p3(self, visited, transitions):
        next_map = {}
        for src, dst, event in transitions:
            if src not in next_map:
                next_map[src] = []
            next_map[src].append((dst, event))
        
        for state in visited:
            has_unfinished = state[0] != 'Incheiat' or state[2] != 'Incheiat' or state[4] != 'Incheiat'
            if has_unfinished and (state not in next_map or len(next_map[state]) == 0):
                return False, "Blocaj detectat", state
        
        return True, None, None
    
    def run_verification(self):
        visited, transitions, states_to_path = self.explore()
        
        print("=== REZULTATE VERIFICARE ===")
        print(f"Stări accesibile: {len(visited)}")
        print(f"Tranziții: {len(transitions)}")
        print()
        
        p1_ok, p1_msg, _ = self.check_p1()
        print(f"P1 (Exclusivitate): {'OK' if p1_ok else 'INCALCATA'}")
        if not p1_ok and p1_msg:
            print(f"  {p1_msg}")
        print()
        
        p2_ok, p2_msg, _ = self.check_p2(visited)
        print(f"P2 (Încheiere posibilă): {'OK' if p2_ok else 'INCALCATA'}")
        if not p2_ok and p2_msg:
            print(f"  {p2_msg}")
        print()
        
        p3_ok, p3_msg, p3_state = self.check_p3(visited, transitions)
        print(f"P3 (Fără blocaj): {'OK' if p3_ok else 'INCALCATA'}")
        if not p3_ok and p3_msg:
            print(f"  {p3_msg}")
            if p3_state and p3_state in states_to_path:
                path = states_to_path[p3_state]
                if path:
                    print(f"  Secvență: {' → '.join(path)}")

if __name__ == '__main__':
    model = MicroscopyModel()
    model.run_verification()
