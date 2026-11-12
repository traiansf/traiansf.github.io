# Verificare propunere — Tabelul de tranziții și scenariile S1–S7

Propunerea este **corectă și completă**. Verific conformitatea cu regulile și scenariile.

## Conformitate cu regulile R1–R8

**Tabelul acoperă toate tranziții permise:**

- **R3** (Ciornă): `ataseaza(f)` rămâne în Ciornă, înregistrând fișierul; `trimite` trece în Trimis cu condiția fișierului atașat. ✓ Confirmat corect.

- **R4** (Trimis și ÎnEval): `preia(e)` din Trimis → ÎnEval cu editor responsabil; `inregistreaza_raport(r)` rămâne în ÎnEval. ✓ Corect.

- **R5** (Decizie): `accepta` și `respinge` din ÎnEval → Acceptat/Respins cu condiție ≥1 raport. Tabelul include ambele tranziții. ✓ Complet.

- **R6** (Retragere): `retrage` din Trimis și ÎnEval → Retras; refuzat din Ciornă și stări finale. ✓ Corect; S7 și S6b confirmă refuzări.

- **R7** (Refuzare): Linia finală "Orice stare | Eveniment nepermis" asigură că stare și date rămân neschimbate. ✓ Corect.

- **R8** (Păstrare date): Fiecare tranziție menționează păstrarea datelor anterioare (fișier, editor, rapoarte). Stări finale (Acceptat, Respins, Retras) nu au ieșiri. ✓ Corect și complet.

## Verificarea scenariilor S1–S7

- **S1** (normal): Lanțul Ciornă → Trimis → ÎnEval → ÎnEval → Acceptat este valid; toate evenimentele permise. ✓
- **S2** (fără fișier): `trimite` refuzat pe condiție; Ciornă rămâne neschimbat. ✓
- **S3** (retragere): Retrage din ÎnEval permis → Retras; data_retragerii se adaugă. ✓
- **S4** (după retragere): Din Retras, `accepta` refuzat (stare finală). ✓
- **S5** (fără raport): `accepta` refuzat pe condiție; rămâne în ÎnEval. ✓
- **S6a/b** (ordini conflictuale): Prima tranziție permisă, a doua refuzată (stare finală); propunerea confirmă corect ordinea și efectele. ✓
- **S7** (retragere ciornă): `retrage` refuzat din Ciornă (R6); stare neschimbată. ✓

## Răspunsuri finale

**Stări finale:** Acceptat, Respins, Retras sunt corecte; fără tranziții de ieșire. ✓

**Accesibilitate Acceptat:** NU din Ciornă nouă — argumentul lanțului obligatoriu (Ciornă → Trimis → ÎnEval → Acceptat) este riguros. Acceptat necesită eveniment `accepta` care cere stare ÎnEval, raport și doar aceasta oferă tranziție. ✓

**Eveniment refuzat:** Stare și date rămân integral neschimbate — corect per R7. ✓

Propunerea satisface complet sarcina de proiectare și verifica corect toate cazurile.