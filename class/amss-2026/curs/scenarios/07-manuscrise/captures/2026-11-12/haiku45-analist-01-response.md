# Tabelul de tranziții și verificarea scenariilor

## Tabelul de tranziții

| Starea curentă | Eveniment | Condiție | Starea următoare | Efect asupra datelor |
|---|---|---|---|---|
| Ciornă | `ataseaza(f)` | — | Ciornă | Fișier ← f; alte date neschimbate |
| Ciornă | `trimite` | Fișier atașat | Trimis | Data_trimiterii înregistrată; fișier păstrat |
| Trimis | `preia(e)` | — | În evaluare | Editor ← e; fișier și data trimiterii păstrate |
| În evaluare | `inregistreaza_raport(r)` | — | În evaluare | Raport adăugat la listă; alte date neschimbate |
| În evaluare | `accepta` | ≥1 raport | Acceptat | Decizie + dată înregistrate; **toate datele anterioare păstrate** |
| În evaluare | `respinge` | ≥1 raport | Respins | Decizie + dată înregistrate; **toate datele anterioare păstrate** |
| Trimis, În evaluare | `retrage` | — | Retras | Data_retragerii înregistrată; **fișier, editor, rapoarte păstrate** |
| Orice stare | Eveniment nepermis | Condiție neresp. | *Neschimbată* | Refuzat: stare și date neschimbate integral |

## Verificarea S1–S7

**S1** (normal): ataseaza(f1)✓→Ciornă, trimite✓→Trimis, preia(E1)✓→ÎnEval, inregistreaza_raport(Rp1)✓→ÎnEval, accepta✓→Acceptat. ✓ **Permis** complet.

**S2** (fără fișier): trimite✗→Ciornă. **Refuzat** (condiție fișier). Rămâne Ciornă, dată niciodată înregistrată.

**S3** (retragere): ataseaza(f1)✓, trimite✓, preia(E1)✓, inregistreaza_raport(Rp1)✓, retrage✓→Retras. **Permis**. Data_retragerii se adaugă; fișier, editor, rapoarte rămân.

**S4** (după retragere): continuare S3, accepta✗→Retras. **Refuzat** (Retras nu permite tranziții). Stare și date neschimbate.

**S5** (acceptare fără raport): ataseaza(f1)✓, trimite✓, preia(E1)✓, accepta✗→ÎnEval. **Refuzat** (condiție raport). Manuscrisul rămâne ÎnEval fără decizie.

**S6a** (retrage, apoi accepta): După ataseaza, trimite, preia, inregistreaza_raport suntem ÎnEval. retrage✓→Retras, accepta✗→Retras. **Prima permisă, a doua refuzată.** Manuscrisul finalizat în Retras.

**S6b** (accepta, apoi retrage): accepta✓→Acceptat, retrage✗→Acceptat. **Prima permisă, a doua refuzată.** Manuscrisul rămâne în Acceptat.

**S7** (retragere ciornă): retrage✗→Ciornă. **Refuzat** (R6: retrage doar din Trimis/ÎnEval). Ciornă și date neschimbate.

## Răspunsuri la întrebări finale

**Stări finale intenționate:** Acceptat, Respins și Retras sunt stări finale (R8). Nu au tranziții de ieșire; beneficiarul refuză orice schimbare ulterioară.

**Acceptat accesibil din Ciornă nouă?** **NU.** Singura cale către Acceptat este evenimentul `accepta` din ÎnEval, care necesită ≥1 raport. Pentru a ajunge în ÎnEval se traversează obligatoriu Trimis (prin preia). Pentru Trimis se necesită trimite din Ciornă cu fișier. Lanțul este **unic: Ciornă → Trimis → ÎnEval → Acceptat**. Acceptat nu este direct accesibil din Ciornă.

**Eveniment refuzat:** rămân neschimbate starea curentă și toate datele (fișier, editor, rapoarte, decizie, date). Este caz tipic al validării: condiția logică eșuează, tranzițiile nu se aplică.