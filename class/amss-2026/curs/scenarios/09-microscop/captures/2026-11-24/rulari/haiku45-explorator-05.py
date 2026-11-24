from collections import deque

class Explorator:
    def __init__(self):
        self.aparate_lucrare = {
            'X': ['M', 'C'],
            'Y': ['C', 'L'],
            'Z': ['M', 'L']
        }
    
    def stare_inițială(self):
        return {
            'X': {'stare': 'neinițiată', 'aparate': []},
            'Y': {'stare': 'neinițiată', 'aparate': []},
            'Z': {'stare': 'neinițiată', 'aparate': []},
            'ocupare': {'M': None, 'C': None, 'L': None}
        }
    
    def stare_hashabilă(self, stare):
        lucrări = tuple(sorted([
            (l, stare[l]['stare'], tuple(sorted(stare[l]['aparate'])))
            for l in ['X', 'Y', 'Z']
        ]))
        ocupare = tuple(sorted(stare['ocupare'].items()))
        return (lucrări, ocupare)
    
    def poate_ocupa(self, stare, lucrare, aparat):
        if stare['ocupare'][aparat] is not None:
            return False
        
        stare_lucrare = stare[lucrare]['stare']
        aparate_dorite = self.aparate_lucrare[lucrare]
        
        if stare_lucrare == 'neinițiată':
            return aparat == aparate_dorite[0]
        elif stare_lucrare == 'pregătită':
            return aparat == aparate_dorite[1]
        else:
            return False
    
    def ocupa(self, stare, lucrare, aparat):
        if not self.poate_ocupa(stare, lucrare, aparat):
            return None
        
        noua_stare = {
            l: {'stare': stare[l]['stare'], 'aparate': stare[l]['aparate'][:]}
            for l in ['X', 'Y', 'Z']
        }
        noua_stare['ocupare'] = {a: stare['ocupare'][a] for a in ['M', 'C', 'L']}
        
        noua_stare[lucrare]['aparate'].append(aparat)
        
        if len(noua_stare[lucrare]['aparate']) == 1:
            noua_stare[lucrare]['stare'] = 'pregătită'
        elif len(noua_stare[lucrare]['aparate']) == 2:
            noua_stare[lucrare]['stare'] = 'în_lucru'
        
        noua_stare['ocupare'][aparat] = lucrare
        
        return noua_stare
    
    def incheie(self, stare, lucrare):
        if stare[lucrare]['stare'] != 'în_lucru':
            return None
        
        noua_stare = {
            l: {'stare': stare[l]['stare'], 'aparate': stare[l]['aparate'][:]}
            for l in ['X', 'Y', 'Z']
        }
        noua_stare['ocupare'] = {a: stare['ocupare'][a] for a in ['M', 'C', 'L']}
        
        for aparat in noua_stare[lucrare]['aparate']:
            noua_stare['ocupare'][aparat] = None
        
        noua_stare[lucrare]['stare'] = 'încheiată'
        noua_stare[lucrare]['aparate'] = []
        
        return noua_stare
    
    def tranziții(self, stare):
        rezultat = []
        
        for lucrare in ['X', 'Y', 'Z']:
            for aparat in ['M', 'C', 'L']:
                noua_stare = self.ocupa(stare, lucrare, aparat)
                if noua_stare is not None:
                    rezultat.append((f'ocupă({lucrare}, {aparat})', noua_stare))
        
        for lucrare in ['X', 'Y', 'Z']:
            noua_stare = self.incheie(stare, lucrare)
            if noua_stare is not None:
                rezultat.append((f'încheie({lucrare})', noua_stare))
        
        return rezultat
    
    def explorează(self):
        stare_start = self.stare_inițială()
        
        coadă = deque([(stare_start, [])])
        vizitate = {self.stare_hashabilă(stare_start): []}
        stări = {}
        stări[self.stare_hashabilă(stare_start)] = stare_start
        
        tranziții_all = []
        
        while coadă:
            stare_actuală, cale = coadă.popleft()
            hash_actual = self.stare_hashabilă(stare_actuală)
            
            for eveniment, noua_stare in self.tranziții(stare_actuală):
                hash_noua = self.stare_hashabilă(noua_stare)
                noua_cale = cale + [eveniment]
                
                tranziții_all.append((hash_actual, eveniment, hash_noua))
                
                if hash_noua not in vizitate:
                    vizitate[hash_noua] = noua_cale
                    stări[hash_noua] = noua_stare
                    coadă.append((noua_stare, noua_cale))
        
        return stări, vizitate, tranziții_all
    
    def verifică_P1(self, stări):
        for stare in stări.values():
            ocupare_contor = {}
            for aparat, lucrare in stare['ocupare'].items():
                if lucrare is not None:
                    ocupare_contor[lucrare] = ocupare_contor.get(lucrare, 0) + 1
                    if ocupare_contor[lucrare] > 1:
                        return False, None
        
        return True, None
    
    def verifică_P2(self, stări, vizitate):
        for hash_stare, stare in stări.items():
            dacă_finale = all(stare[l]['stare'] == 'încheiată' for l in ['X', 'Y', 'Z'])
            if dacă_finale:
                return True, vizitate[hash_stare]
        
        return False, None
    
    def verifică_P3(self, stări, vizitate):
        for hash_stare, stare in stări.items():
            are_neîncheiată = any(stare[l]['stare'] != 'încheiată' for l in ['X', 'Y', 'Z'])
            
            if are_neîncheiată:
                tranziții = self.tranziții(stare)
                if len(tranziții) == 0:
                    return False, vizitate[hash_stare]
        
        return True, None

def main():
    explorator = Explorator()
    stări, vizitate, tranziții_all = explorator.explorează()
    
    p1_ok, _ = explorator.verifică_P1(stări)
    p2_ok, p2_cale = explorator.verifică_P2(stări, vizitate)
    p3_ok, p3_cale = explorator.verifică_P3(stări, vizitate)
    
    print(f"Stări accesibile: {len(stări)}")
    print(f"Tranziții: {len(tranziții_all)}")
    print(f"P1 (Exclusivitate): {'OK' if p1_ok else 'INCALCAT'}")
    print(f"P2 (Încheiere posibilă): {'OK' if p2_ok else 'INCALCAT'}")
    if not p2_ok:
        print(f"  Starea finală nu este accesibilă")
    else:
        print(f"  Secvență: {' -> '.join(p2_cale)}")
    print(f"P3 (Fără blocaj): {'OK' if p3_ok else 'INCALCAT'}")
    if not p3_ok:
        print(f"  Blocaj la secvența: {' -> '.join(p3_cale)}")

if __name__ == '__main__':
    main()
