Mai jos sunt regulile convenite cu firma și funcția care le aplică într-unul dintre canale. Firma cere o schimbare: un plic este acceptat acum până la 1500 g inclusiv. Celelalte reguli rămân neschimbate. Actualizează funcția și răspunde cu codul complet și cel mult trei rânduri de explicații, în română.

CONTEXT

# Estimarea prețului expedierii unui colet

Un client cere o estimare pe site sau de la operatorul ghișeului. Formularul web și aplicația operatorului sunt cele două canale software; ambele estimează prețul expedierii, fără să o efectueze.

## Reguli convenite cu firma

- **R1 — intrare:** estimăm expedierea unui singur colet, descris prin masa în grame (număr întreg) și tipul ambalajului. Canalul interpretează textul; dacă masa nu poate fi interpretată ca număr întreg, cere corectarea ei. Valorile interpretate se verifică conform R2–R3, inclusiv un tip de ambalaj neacceptat.
- **R2 — masa acceptată:** `1 ≤ masa ≤ 5000`. Orice altă masă produce un refuz, fără preț.
- **R3 — ambalaj:** un plic este acceptat numai până la 1000 g inclusiv. O cutie este acceptată pe întregul interval R2. Un ambalaj diferit produce un refuz, fără preț.
- **R4 — preț:** pentru un colet acceptat, masa de cel mult 1000 g costă 10 lei; masa de peste 1000 g costă 18 lei. Nu există alte taxe.
- **R5 — canale:** formularul web și aplicația ghișeului folosesc aceleași reguli; pentru aceeași masă și același ambalaj, ambele acceptă la același preț sau refuză. Fiecare canal își alege textele și aspectul afișării.
- **R6 — limitele sarcinii:** producem doar o estimare; fără salvarea coletului, plată, expediere, integrare cu un transportator, concurență sau măsurarea masei. Un refuz pentru o intrare cu mai multe probleme poate indica oricare dintre motivele aplicabile; prioritatea lor nu este stabilită.

## Funcția actuală

```python
def estimeaza_pret(masa_text, ambalaj):
    # Interpretare masă
    try:
        masa = int(masa_text)
    except (ValueError, TypeError):
        return "Masa introdusă nu este validă."
    
    # R2: Interval masă
    if masa < 1 or masa > 5000:
        return "Masa nu respectă intervalul 1–5000 g."
    
    # R3: Verificare ambalaj și restricții
    ambalaj_lower = ambalaj.lower()
    if ambalaj_lower == "plic":
        if masa > 1000:
            return "Plicul este acceptat doar până la 1000 g."
    elif ambalaj_lower == "cutie":
        pass
    else:
        return f"Ambalaj nerecunoscut: '{ambalaj}'."
    
    # R4: Calculare preț
    if masa <= 1000:
        return "Preț estimat: 10 lei"
    else:
        return "Preț estimat: 18 lei"
```
