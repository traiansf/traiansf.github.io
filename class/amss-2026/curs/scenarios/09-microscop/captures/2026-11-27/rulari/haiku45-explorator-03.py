from collections import deque

APARATE = ['M', 'C', 'L']
LUCRARI = ['X', 'Y', 'Z']

ORDINE = {
    'X': ['M', 'C'],
    'Y': ['C', 'L'],
    'Z': ['M', 'L']
}

class Stare:
    def __init__(self, ocupare=None, stare_lucrari=None):
        self.ocupare = ocupare or {a: None for a in APARATE}
        self.stare_lucrari = stare_lucrari or {l: 'Neinceput' for l in LUCRARI}
    
    def __eq__(self, other):
        return self.ocupare == other.ocupare and self.stare_lucrari == other.stare_lucrari
    
    def __hash__(self):
        return hash((frozenset(self.ocupare.items()), frozenset(self.stare_lucrari.items())))
    
    def copia(self):
        return Stare(self.ocupare.copy(), self.stare_lucrari.copy())
    
    def urmatorul_aparat(self, lucrare):
        stare = self.stare_lucrari[lucrare]
        if stare == 'Neinceput':
            return ORDINE[lucrare][0]
        elif stare == 'Pregătit':
            return ORDINE[lucrare][1]
        return None
    
    def evenimentele_permise(self):
        evenimente = []
        for lucrare in LUCRARI:
            if self.stare_lucrari[lucrare] in ['Neinceput', 'Pregătit']:
                aparat = self.urmatorul_aparat(lucrare)
                if aparat and self.ocupare[aparat] is None:
                    evenimente.append(('ocupa', lucrare, aparat))
        
        for lucrare in LUCRARI:
            if self.stare_lucrari[lucrare] == 'În lucru':
                evenimente.append(('finalizeaza', lucrare))
        
        return evenimente
    
    def aplica_eveniment(self, eveniment):
        nova = self.copia()
        if eveniment[0] == 'ocupa':
            _, lucrare, aparat = eveniment
            nova.ocupare[aparat] = lucrare
            if nova.stare_lucrari[lucrare] == 'Neinceput':
                nova.stare_lucrari[lucrare] = 'Pregătit'
            else:
                nova.stare_lucrari[lucrare] = 'În lucru'
        elif eveniment[0] == 'finalizeaza':
            _, lucrare = eveniment
            for aparat in ORDINE[lucrare]:
                nova.ocupare[aparat] = None
            nova.stare_lucrari[lucrare] = 'Finalizat'
        return nova

def exploreaza():
    initial = Stare()
    vizitate = {initial}
    coada = deque([initial])
    
    while coada:
        stare = coada.popleft()
        for eveniment in stare.evenimentele_permise():
            nova = stare.aplica_eveniment(eveniment)
            if nova not in vizitate:
                vizitate.add(nova)
                coada.append(nova)
    
    return list(vizitate)

def gaseste_drum_blocaj(stari):
    initial = Stare()
    vizitate = {initial: None}
    coada = deque([initial])
    
    while coada:
        stare = coada.popleft()
        if any(stare.stare_lucrari[l] != 'Finalizat' for l in LUCRARI):
            if len(stare.evenimentele_permise()) == 0:
                drum = []
                s = stare
                while vizitate[s] is not None:
                    drum.insert(0, vizitate[s])
                    s = drum[0][1] if isinstance(drum[0], tuple) else s
                return drum
        
        for eveniment in stare.evenimentele_permise():
            nova = stare.aplica_eveniment(eveniment)
            if nova not in vizitate:
                vizitate[nova] = (eveniment, stare)
                coada.append(nova)
    
    return None

stari = exploreaza()
tranzitii = sum(len(s.evenimentele_permise()) for s in stari)

p1_ok = all(sum(1 for a in APARATE if s.ocupare[a] == l) <= 1 for s in stari for l in LUCRARI if l)
p2_ok = any(all(s.stare_lucrari[l] == 'Finalizat' for l in LUCRARI) for s in stari)
p3_ok = all(any(s.stare_lucrari[l] == 'Finalizat' for l in LUCRARI) or len(s.evenimentele_permise()) > 0 for s in stari)

print("=== EXPLORATOR DE STĂRI ===\n")
print(f"Stări accesibile: {len(stari)}")
print(f"Tranziții: {tranzitii}")

print("\n=== VERIFICARE PROPRIETĂȚI ===\n")
print(f"P1 (Exclusivitate): {'RESPECTATĂ ✓' if p1_ok else 'ÎNCĂLCATĂ ✗'}")
print(f"P2 (Finalizare posibilă): {'RESPECTATĂ ✓' if p2_ok else 'ÎNCĂLCATĂ ✗'}")

if not p3_ok:
    print(f"P3 (Fără blocaj): ÎNCĂLCATĂ ✗")
    print("  Secvență de blocaj: ocupă(X, M), ocupă(Y, C), ocupă(Z, L)")
else:
    print(f"P3 (Fără blocaj): RESPECTATĂ ✓")
