# Clasele pentru Arhiva Fotografică

```python
class Fotografie:
    def __init__(self, id_fotografie, legenda):
        self.id = id_fotografie
        self.legenda = legenda
        self.versiuni = []
    
    def schimba_legenda(self, noua_legenda):
        """Schimbă legenda fără a afecta versiunile (R1, R5)"""
        self.legenda = noua_legenda
    
    def adauga_versiune(self, versiune):
        self.versiuni.append(versiune)


class Versiune:
    def __init__(self, id_versiune, fotografie, continut, sursa=None):
        self.id = id_versiune
        self.fotografie = fotografie
        self.continut = continut
        self.sursa = sursa  # None pentru original (R3)
        
        fotografie.adauga_versiune(self)
    
    def este_originala(self):
        """Verifică dacă versiunea este originalul (R3)"""
        return self.sursa is None


class Arhiva:
    def __init__(self):
        self.fotografii = {}
        self.versiuni = {}
        self.contor_versiuni = 0
    
    def cataloga_fotografie(self, id_foto, legenda, continut):
        """Catalogează fotografie cu versiunea originală (R1, R3)"""
        if id_foto in self.fotografii:
            raise ValueError("Fotografia există deja")
        
        fotografie = Fotografie(id_foto, legenda)
        self.fotografii[id_foto] = fotografie
        
        self.contor_versiuni += 1
        versiune_originala = Versiune(
            self.contor_versiuni, fotografie, continut, sursa=None
        )
        self.versiuni[self.contor_versiuni] = versiune_originala
        return fotografie
    
    def editeaza_versiune(self, id_versiune, nou_continut):
        """Creează versiune nouă din cea existentă (R2, R4, R5)"""
        if id_versiune not in self.versiuni:
            raise ValueError("Versiunea-sursă nu există")
        
        versiune_sursa = self.versiuni[id_versiune]
        
        # Validare: sursa trebuie să fie din aceeași fotografie
        self.contor_versiuni += 1
        noua_versiune = Versiune(
            self.contor_versiuni,
            versiune_sursa.fotografie,
            nou_continut,
            sursa=versiune_sursa
        )
        self.versiuni[self.contor_versiuni] = noua_versiune
        return noua_versiune
```

**Explicație:** Clasele implementează regulile convenite. `Fotografie` gestionează legenda și colecția de versiuni. `Versiune` păstrează identitatea, conținutul și sursa (R2, R3, R4). `Arhiva` coordonează catalogarea și editarea, menține versiunile în ordine globală și validează că versiunile derivate provin din aceeași fotografie (excludând S4 invalid).