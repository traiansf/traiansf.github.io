# Clase pentru Arhiva Fotografică

```python
class Fotografie:
    def __init__(self, id_foto: str, legenda: str):
        self.id_foto = id_foto
        self.legenda = legenda
        self.versiuni = {}  # id_versiune -> Versiune
        self.original_id = None
    
    def schimba_legenda(self, noua_legenda: str):
        self.legenda = noua_legenda

class Versiune:
    def __init__(self, id_versiune: int, fotografie_id: str, continut: str, 
                 sursa_id: int = None):
        self.id_versiune = id_versiune
        self.fotografie_id = fotografie_id
        self.continut = continut
        self.sursa_id = sursa_id  # None pentru original
    
    def este_original(self) -> bool:
        return self.sursa_id is None

class Arhiva:
    def __init__(self):
        self.fotografii = {}  # id_foto -> Fotografie
        self.versiuni = {}    # id_versiune -> Versiune
        self.contor_versiuni = 0
    
    def cataloga_fotografie(self, id_foto: str, legenda: str, continut: str):
        """R1, R2, R3: Creează o fotografie cu originalul său"""
        if id_foto in self.fotografii:
            raise ValueError("Fotografia există")
        
        foto = Fotografie(id_foto, legenda)
        self.contor_versiuni += 1
        versiune_originala = Versiune(self.contor_versiuni, id_foto, continut)
        
        foto.versiuni[self.contor_versiuni] = versiune_originala
        foto.original_id = self.contor_versiuni
        self.fotografii[id_foto] = foto
        self.versiuni[self.contor_versiuni] = versiune_originala
    
    def editeaza_versiune(self, id_versiune: int, continut_nou: str) -> int:
        """R4, R5: Creează versiune nouă cu sursa din versiunea editată"""
        if id_versiune not in self.versiuni:
            raise ValueError("Versiunea nu există")
        
        versiune_sursa = self.versiuni[id_versiune]
        foto_id = versiune_sursa.fotografie_id
        
        self.contor_versiuni += 1
        noua_versiune = Versiune(self.contor_versiuni, foto_id, continut_nou, 
                                 id_versiune)
        
        self.fotografii[foto_id].versiuni[self.contor_versiuni] = noua_versiune
        self.versiuni[self.contor_versiuni] = noua_versiune
        
        return self.contor_versiuni
    
    def schimba_legenda(self, id_foto: str, noua_legenda: str):
        """R5: Legendă modificabilă independent de versiuni"""
        if id_foto not in self.fotografii:
            raise ValueError("Fotografia nu există")
        self.fotografii[id_foto].schimba_legenda(noua_legenda)
```

**Structură:** `Fotografie` ține legendă și referințele versiunilor; `Versiune` păstrează conținut, fotografia-părinte și versiunea-sursă (None pentru originale); `Arhiva` gestionează identificatori globali și validări (R4 interzice surse din alte fotografii prin controlul `fotografie_id`).