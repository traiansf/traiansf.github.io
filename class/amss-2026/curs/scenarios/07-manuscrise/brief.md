# Enunț — manuscrisele unei reviste

Exemplu didactic pentru Cursul 7, versiunea 12 noiembrie 2026. Un sistem editorial ține evidența manuscriselor trimise unei reviste. Pentru fiecare manuscris, registrul editorial păstrează **starea** lui și **datele** înregistrate pe parcurs: fișierul atașat, editorul responsabil, rapoartele de evaluare, decizia și data ei.

## Reguli convenite

- **R1 — context:** identificatorii manuscriselor, ai editorilor și ai rapoartelor sunt cunoscuți; apelurile sunt secvențiale: fiecare începe după încheierea celui anterior. Fiecare scenariu privește un singur manuscris. Nu discutăm autentificarea, concurența, erorile tehnice, retrimiterea unui manuscris respins sau retras și programarea publicării.
- **R2 — stări:** un manuscris este în exact una dintre stările **Ciornă**, **Trimis**, **În evaluare**, **Acceptat**, **Respins**, **Retras**. Un manuscris nou este în Ciornă, fără fișier, fără editor și fără rapoarte.
- **R3 — pregătire și trimitere:** `atașează(f)` este permis numai în Ciornă: înregistrează fișierul f (înlocuind unul anterior) și lasă manuscrisul în Ciornă. `trimite` este permis numai în Ciornă și numai dacă există un fișier atașat: manuscrisul trece în Trimis, iar data trimiterii este înregistrată.
- **R4 — evaluare:** `preia(e)` este permis numai în Trimis: editorul e devine editorul responsabil, iar manuscrisul trece în În evaluare. `înregistrează raport(r)` este permis numai în În evaluare: adaugă raportul r la lista rapoartelor; starea rămâne În evaluare.
- **R5 — decizie:** `acceptă` și `respinge` sunt permise numai în În evaluare și numai dacă există cel puțin un raport înregistrat: manuscrisul trece în Acceptat, respectiv Respins, iar data deciziei este înregistrată; decizia însăși este starea.
- **R6 — retragere:** `retrage` este permis numai în Trimis și În evaluare: manuscrisul trece în Retras, iar data retragerii este înregistrată. Autorul nu poate retrage o ciornă (nu a fost trimisă) și nici un manuscris cu decizie.
- **R7 — evenimente refuzate:** un eveniment fără tranziție permisă în starea curentă, sau cu condiția neîndeplinită, este **refuzat**: starea și toate datele rămân neschimbate.
- **R8 — datele se păstrează:** fișierul, editorul și rapoartele nu se șterg la nicio schimbare de stare; rapoartele înregistrate rămân și după retragere. Acceptat, Respins și Retras sunt **stări finale intenționate**: nu au tranziții de ieșire, prin decizia beneficiarului.

## Starea inițială și scenariile

**I0:** manuscrisul M este în Ciornă, fără fișier, fără editor, fără rapoarte. Fiecare scenariu repornește din I0, exceptând continuările marcate explicit.

| Scenariu | Evenimente, în ordine |
|---|---|
| S1 — parcurs normal | `atașează(f1)`, `trimite`, `preia(E1)`, `înregistrează raport(Rp1)`, `acceptă` |
| S2 — trimitere fără fișier | `trimite` |
| S3 — retragere din evaluare | `atașează(f1)`, `trimite`, `preia(E1)`, `înregistrează raport(Rp1)`, `retrage` |
| S4 — decizie după retragere | continuarea lui S3: `acceptă` |
| S5 — acceptare fără raport | `atașează(f1)`, `trimite`, `preia(E1)`, `acceptă` |
| S6 — două ordini | din starea de după `atașează(f1)`, `trimite`, `preia(E1)`, `înregistrează raport(Rp1)`: (a) `retrage`, apoi `acceptă`; (b) `acceptă`, apoi `retrage` |
| S7 — retragerea unei ciorne | `retrage` |

## Vocabular

Un manuscris are o stare din ciclul de viață și datele păstrate. O stare este **accesibilă din I0** dacă există o secvență de evenimente permise care pornește din I0 și ajunge la ea; nu este necesar un singur pas. R8 păstrează datele la schimbarea stării; în Ciornă, R3 permite înlocuirea fișierului. Datele calendaristice deja înregistrate se păstrează.

## Sarcina de proiectare

Propuneți tabelul de tranziții al manuscrisului: pentru fiecare rând, starea curentă, evenimentul, condiția (dacă există), starea următoare și efectul asupra datelor. Precizați ce se întâmplă cu un eveniment refuzat și ce date se păstrează la fiecare schimbare de stare. Verificați scenariile S1–S7, indicând pentru fiecare eveniment dacă este permis sau refuzat, starea de după și datele înregistrate. Spuneți care stări sunt finale intenționate și dacă Acceptat este accesibil dintr-o ciornă nouă. Nu se cere cod sau o reprezentare particulară.
