from collections import deque

JOBS = ('X', 'Y', 'Z')
DEVICES = ('M', 'C', 'L')

DEVICE_ORDER = {
    'X': ['M', 'C'],
    'Y': ['C', 'L'],
    'Z': ['M', 'L']
}

class State:
    def __init__(self, job_status=None, device_owner=None, job_step=None):
        if job_status is None:
            self.job_status = {j: 'Neînceput' for j in JOBS}
            self.device_owner = {d: None for d in DEVICES}
            self.job_step = {j: 0 for j in JOBS}
        else:
            self.job_status = dict(job_status)
            self.device_owner = dict(device_owner)
            self.job_step = dict(job_step)
    
    def to_tuple(self):
        return (
            tuple(self.job_status[j] for j in JOBS),
            tuple(self.device_owner[d] for d in DEVICES),
            tuple(self.job_step[j] for j in JOBS)
        )
    
    def copy(self):
        return State(self.job_status, self.device_owner, self.job_step)
    
    def get_permitted_events(self):
        events = []
        for job in JOBS:
            if self.job_status[job] != 'Încheiată':
                step = self.job_step[job]
                if step < 2:
                    device = DEVICE_ORDER[job][step]
                    if self.device_owner[device] is None:
                        events.append(('occupy', job, device))
        for job in JOBS:
            if self.job_status[job] == 'În lucru':
                events.append(('finish', job))
        return events
    
    def apply_event(self, event):
        new_state = self.copy()
        if event[0] == 'occupy':
            job, device = event[1], event[2]
            new_state.device_owner[device] = job
            new_state.job_step[job] += 1
            if new_state.job_step[job] == 1:
                new_state.job_status[job] = 'Pregătit'
            elif new_state.job_step[job] == 2:
                new_state.job_status[job] = 'În lucru'
        elif event[0] == 'finish':
            job = event[1]
            new_state.job_status[job] = 'Încheiată'
            for device in DEVICE_ORDER[job]:
                new_state.device_owner[device] = None
        return new_state

def explore():
    initial = State()
    visited = set()
    queue = deque([(initial, [])])
    states_list = []
    transitions_count = 0
    state_to_path = {}
    
    visited.add(initial.to_tuple())
    state_to_path[initial.to_tuple()] = []
    
    while queue:
        state, path = queue.popleft()
        states_list.append(state)
        
        for event in state.get_permitted_events():
            transitions_count += 1
            new_state = state.apply_event(event)
            new_tuple = new_state.to_tuple()
            
            if new_tuple not in visited:
                visited.add(new_tuple)
                new_path = path + [event]
                queue.append((new_state, new_path))
                state_to_path[new_tuple] = new_path
    
    return states_list, transitions_count, state_to_path

def check_p1(states_list):
    for state in states_list:
        for job in JOBS:
            if sum(1 for d in DEVICES if state.device_owner[d] == job) > 2:
                return False, state
        for device in DEVICES:
            if state.device_owner[device] is not None:
                if sum(1 for d in DEVICES if state.device_owner[d] == state.device_owner[device]) > 2:
                    return False, state
    return True, None

def check_p2(states_list):
    return any(all(state.job_status[j] == 'Încheiată' for j in JOBS) for state in states_list)

def check_p3(states_list):
    for state in states_list:
        if any(state.job_status[j] != 'Încheiată' for j in JOBS) and not state.get_permitted_events():
            return False, state
    return True, None

def format_event(event):
    return f"ocupă({event[1]}, {event[2]})" if event[0] == 'occupy' else f"încheie({event[1]})"

states_list, transitions_count, state_to_path = explore()

print(f"Stări accesibile: {len(states_list)}")
print(f"Tranziții: {transitions_count}")

p1_ok, p1_state = check_p1(states_list)
print(f"P1 (Exclusivitate): {'OK' if p1_ok else 'FAILED'}")
if not p1_ok:
    print("Secvență:", " -> ".join(format_event(e) for e in state_to_path[p1_state.to_tuple()]))

p2_ok = check_p2(states_list)
print(f"P2 (Încheiere posibilă): {'OK' if p2_ok else 'FAILED'}")

p3_ok, p3_state = check_p3(states_list)
print(f"P3 (Fără blocaj): {'OK' if p3_ok else 'FAILED'}")
if not p3_ok:
    print("Secvență:", " -> ".join(format_event(e) for e in state_to_path[p3_state.to_tuple()]))
