# Tabel de tranziții și analiza scenariilor

## Tabel de tranziții al manuscrisului

| Stare curentă | Eveniment | Condiție | Stare următoare | Efect pe date |
|---|---|---|---|---|
| **Ciornă** | `ataseaza(f)` | — | Ciornă | fișier ← f |
| **Ciornă** | `trimite` | fișier ≠ ∅ | Trimis | data_trimiterii ← acum |
| **Trimis** | `preia(e)` | — | În evaluare | editor ← e |
| **În evaluare** | `inregistreaza_raport(r)` | — | În evaluare | rapoarte ← rapoarte ∪ {r} |
| **În evaluare** | `accepta` | rapoarte ≠ ∅ | Acceptat | decizie ← acceptat; data_deciziei ← acum |
| **În evaluare** | `respinge` | rapoarte ≠ ∅ | Respins | decizie ← respins; data_deciziei ← acum |
| **Trimis** | `retrage` | — | Retras | data_retragerii ← acum |
| **În evaluare** | `retrage` | — | Retras | data_retragerii ← acum |

## Evenimente refuzate și păstrarea datelor

Un eveniment fără tranziție permisă în starea curentă sau cu condiție neîndeplinită este **refuzat**: **starea și toate datele înregistrate rămân neschimbate**. Exemple: `trimite` din Ciornă fără fișier; `accepta` din În evaluare fără rapoarte; `retrage` din Ciornă sau din stări finale.

La orice schimbare de stare, **fișierul, editorul, rapoartele și decizia se păstrează permanent**: nu se șterg niciodată, nici după retragere.

## Verificarea scenariilor S1–S7

| Scenariu | Eveniment | Status | Stare următoare | Date înregistrate |
|---|---|---|---|---|
| **S1** | ataseaza(f1) | ✓ permis | Ciornă | f1 |
| | trimite | ✓ permis | Trimis | data_trimiterii |
| | preia(E1) | ✓ permis | În evaluare | editor=E1 |
| | inregistreaza_raport(Rp1) | ✓ permis | În evaluare | rapoarte={Rp1} |
| | accepta | ✓ permis | Acceptat | decizie=acceptat |
| **S2** | trimite | ✗ refuzat | Ciornă | — |
| **S3** | ataseaza(f1) | ✓ permis | Ciornă | f1 |
| | trimite | ✓ permis | Trimis | data_trimiterii |
| | preia(E1) | ✓ permis | În evaluare | editor=E1 |
| | inregistreaza_raport(Rp1) | ✓ permis | În evaluare | rapoarte={Rp1} |
| | retrage | ✓ permis | Retras | data_retragerii; rapoarte={Rp1} se păstrează |
| **S4** | accepta | ✗ refuzat | Retras | — (stare finală) |
| **S5** | ataseaza(f1) | ✓ permis | Ciornă | f1 |
| | trimite | ✓ permis | Trimis | data_trimiterii |
| | preia(E1) | ✓ permis | În evaluare | editor=E1 |
| | accepta | ✗ refuzat | În evaluare | — (fără rapoarte) |
| **S6a** | retrage | ✓ permis | Retras | data_retragerii |
| | accepta | ✗ refuzat | Retras | — (stare finală) |
| **S6b** | accepta | ✓ permis | Acceptat | decizie=acceptat |
| | retrage | ✗ refuzat | Acceptat | — (stare finală) |
| **S7** | retrage | ✗ refuzat | Ciornă | — (nu e în Trimis/În evaluare) |

## Stări finale și accesibilitate

**Stări finale intenționate** (conform R8): **Acceptat**, **Respins**, **Retras**. Aceste stări nu au tranziții de ieșire intenționat.

**Acceptat nu este accesibil direct dintr-o Ciornă nouă.** Orice manuscris trebuie să parcurgă lanțul obligatoriu: Ciornă → Trimis → În evaluare → Acceptat (plus condiția rapoarte ≠ ∅).