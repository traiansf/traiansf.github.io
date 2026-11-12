# Enunț — manuscrisele unei reviste

Exemplu didactic pentru Cursul 7, versiunea 12 noiembrie 2026. Un sistem editorial ține evidența manuscriselor trimise unei reviste. Pentru fiecare manuscris, registrul editorial păstrează **starea** lui și **datele** înregistrate pe parcurs: fișierul atașat, editorul responsabil, rapoartele de evaluare, decizia și data ei.

## Reguli convenite

- **R1 — context:** identificatorii manuscriselor, ai editorilor și ai rapoartelor sunt cunoscuți; evenimentele se procesează secvențial, fiecare începând după încheierea celui anterior. Fiecare scenariu privește un singur manuscris. Nu discutăm autentificarea, concurența, erorile tehnice, retrimiterea unui manuscris respins sau retras și programarea publicării.
- **R2 — stări:** un manuscris este în exact una dintre stările **Ciornă**, **Trimis**, **În evaluare**, **Acceptat**, **Respins**, **Retras**. Un manuscris nou este în Ciornă, fără fișier, fără editor, fără rapoarte și fără decizie.
- **R3 — pregătire și trimitere:** `ataseaza(f)` este permis numai în Ciornă: înregistrează fișierul f (înlocuind unul anterior) și lasă manuscrisul în Ciornă. `trimite` este permis numai în Ciornă și numai dacă există un fișier atașat: manuscrisul trece în Trimis, iar data trimiterii este înregistrată.
- **R4 — evaluare:** `preia(e)` este permis numai în Trimis: editorul e devine editorul responsabil, iar manuscrisul trece în În evaluare. `inregistreaza_raport(r)` este permis numai în În evaluare: adaugă raportul r la lista rapoartelor; starea rămâne În evaluare.
- **R5 — decizie:** `accepta` și `respinge` sunt permise numai în În evaluare și numai dacă există cel puțin un raport înregistrat: manuscrisul trece în Acceptat, respectiv Respins, iar decizia și data ei sunt înregistrate.
- **R6 — retragere:** `retrage` este permis numai în Trimis și În evaluare: manuscrisul trece în Retras, iar data retragerii este înregistrată. Autorul nu poate retrage o ciornă (nu a fost trimisă) și nici un manuscris cu decizie.
- **R7 — evenimente refuzate:** un eveniment fără tranziție permisă în starea curentă, sau cu condiția neîndeplinită, este **refuzat**: starea și toate datele rămân neschimbate.
- **R8 — datele se păstrează:** fișierul, editorul, rapoartele și decizia nu se șterg la nicio schimbare de stare; rapoartele înregistrate rămân și după retragere. Acceptat, Respins și Retras sunt **stări finale intenționate**: nu au tranziții de ieșire, prin decizia beneficiarului.

## Starea inițială și scenariile

**I0:** manuscrisul M este în Ciornă, fără fișier, fără editor, fără rapoarte, fără decizie. Fiecare scenariu repornește din I0, exceptând continuările marcate explicit.

| Scenariu | Evenimente, în ordine |
|---|---|
| S1 — parcurs normal | `ataseaza(f1)`, `trimite`, `preia(E1)`, `inregistreaza_raport(Rp1)`, `accepta` |
| S2 — trimitere fără fișier | `trimite` |
| S3 — retragere din evaluare | `ataseaza(f1)`, `trimite`, `preia(E1)`, `inregistreaza_raport(Rp1)`, `retrage` |
| S4 — decizie după retragere | continuarea lui S3: `accepta` |
| S5 — acceptare fără raport | `ataseaza(f1)`, `trimite`, `preia(E1)`, `accepta` |
| S6 — două ordini | din starea de după `ataseaza(f1)`, `trimite`, `preia(E1)`, `inregistreaza_raport(Rp1)`: (a) `retrage`, apoi `accepta`; (b) `accepta`, apoi `retrage` |
| S7 — retragerea unei ciorne | `retrage` |

## Sarcina de proiectare

Propuneți tabelul de tranziții al manuscrisului: pentru fiecare rând, starea curentă, evenimentul, condiția (dacă există), starea următoare și efectul asupra datelor. Precizați ce se întâmplă cu un eveniment refuzat și ce date se păstrează la fiecare schimbare de stare. Verificați scenariile S1–S7, indicând pentru fiecare eveniment dacă este permis sau refuzat, starea de după și datele înregistrate. Spuneți care stări sunt finale intenționate și dacă Acceptat este accesibil dintr-o ciornă nouă. Nu se cere cod sau o reprezentare particulară.
