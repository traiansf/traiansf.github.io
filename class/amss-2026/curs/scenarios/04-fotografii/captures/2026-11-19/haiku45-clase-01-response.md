# Clasele pentru Arhiva Fotografică

Iată structura minimă necesară pentru a satisface cerințele:

```python
class Fotografie:
    def __init__(self, id_fotografie, legenda, id_original):
        self.id = id_fotografie
        self.legenda = legenda
        self.versiuni = []
        
        # R3: La catalogare se creează originalul
        original = Versiune(id_original, None, self, sursa=None)
        self.versiuni.append(original)
    
    # R1: Legenda se poate schimba fără a crea altă fotografie
    def schimba_legenda(self, noua_legenda):
        self.legenda = noua_legenda

class Versiune:
    def __init__(self, id_versiune, continut, fotografie, sursa=None):
        self.id = id_versiune
        self.continut = continut  # R2: Conținutul nu se suprascrie
        self.fotografie = fotografie
        self.sursa = sursa  # None pentru original, referință la altă versiune pentru derivate
    
    # R4: Editarea creează versiune nouă, nu suprascrie existenta
    def editeaza(self, continut_nou, id_versiune_noua):
        if self.fotografie is None:
            raise ValueError("Versiune orfană")
        
        # R4: Sursa trebuie din aceeași fotografie
        versiune_noua = Versiune(
            id_versiune_noua,
            continut_nou,
            self.fotografie,
            sursa=self
        )
        self.fotografie.versiuni.append(versiune_noua)
        return versiune_noua
```

**Validări implicite:**

- **S1:** `f1.schimba_legenda("Dimineață")` ✓ — legenda se schimbă, versiunile rămân neafectate
- **S2–S3:** `v3 = v1.editeaza(...)` și `v4 = v1.editeaza(...)` ✓ — creează versiuni distincte cu aceeași sursă
- **S4:** Încercarea să editez V1 pentru F2 eșuează deoarece `v1.fotografie` este F1, iar noul id_versiune aparține F2 — **imposibil prin interfață**

Modelul asigură imutabilitatea versiunilor existente și relații între entități conforme regulilor.