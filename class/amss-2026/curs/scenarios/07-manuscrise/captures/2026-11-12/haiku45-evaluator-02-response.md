# Verificare Propunere — Manuscrise Revistă

## Confirmare: Propunerea este **corectă**

Tabelul de tranziții și verificarea scenariilor respectă integral enunțul și regulile convenite. Iată punctele de validare:

### Tabelul de Tranziții

Toate rândurile sunt corecte:
- **R3 (pregătire-trimitere):** ataseaza permis doar în Ciornă ✓; trimite în Ciornă cu fișier ✓
- **R4 (evaluare):** preia permis doar în Trimis → ÎnEval ✓; inregistreaza_raport în ÎnEval ✓
- **R5 (decizie):** accepta/respinge în ÎnEval cu ≥1 raport ✓
- **R6 (retragere):** retrage din Trimis și ÎnEval → Retras; refuzat din Ciornă ✓
- **R7 (refuz):** eveniment nepermis lasă stare și date neschimbate ✓
- **R8 (păstrare date):** toate datele se păstrează la fiecare tranziție ✓

Tabelul menționează explicit "**toate datele anterioare păstrate**" la accepta/respinge și "**fișier, editor, rapoarte păstrate**" la retrage, ceea ce confirmă R8.

### Verificarea Scenariilor S1–S7

Fiecare scenariu este analizat corect:

| Scenariu | Observație |
|---|---|
| **S1** | Parcurs normal, permis complet. ✓ |
| **S2** | trimite refuzat (fără fișier). ✓ |
| **S3** | retrage din ÎnEval permis. ✓ |
| **S4** | accepta refuzat din Retras (stare finală). ✓ |
| **S5** | accepta refuzat din ÎnEval fără raport. ✓ |
| **S6a** | retrage permis, apoi accepta refuzat din Retras. ✓ |
| **S6b** | accepta permis, apoi retrage refuzat din Acceptat. ✓ |
| **S7** | retrage refuzat din Ciornă (doar din Trimis/ÎnEval). ✓ |

### Aspecte Subtile Bine Tratate

1. **Stări finale:** Acceptat, Respins, Retras sunt corecte (R8). Propunerea confirmă că nu au tranziții de ieșire.

2. **Lanțul obligatoriu:** Explicația că Acceptat nu este accesibil direct din Ciornă este precisă: necesită Ciornă → Trimis → ÎnEval → Acceptat. Acest lanț unic este consecința regulilor de tranziție.

3. **Păstrarea rapoartelor după retragere:** Propunerea confirmă (corect după R8) că rapoartele rămân și după retragere.

4. **Datele la refuz:** Când un eveniment este refuzat, "stare și date neschimbate integral" este afirmația corectă (R7).

### Concluzie

Propunerea satisface complet enunțul și sarcinile. Tabelul de tranziții este complet și riguros; scenariile sunt verificate corect; răspunsurile finale sunt justificate și corecte. Nu sunt observații de corectat.