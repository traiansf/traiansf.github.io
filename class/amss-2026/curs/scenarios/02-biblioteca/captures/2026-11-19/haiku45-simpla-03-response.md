# Proiectare Sistem Gestionare Împrumuturi Bibliotecă

## Concepte Principale

**Entități cheie:**
- **Membre**: Utilizatori care pot împrumuta cărți
- **Cărți**: Resurse cu stoc disponibil și cereri în așteptare
- **Împrumuturi**: Înregistrări active cu dată de expirare
- **Cereri de Aşteptare**: Liste de prioritate pentru cărți indisponibile

## Reguli pentru Operația de Împrumut

Membrul poate împrumuta o carte dacă:
- Cartea are cel puțin o copie disponibilă
- Membrul nu depășește limita de cărți active (ex: 5 cărți)
- Membrul nu are datorii (cărți cu retur depășit)

**Rezultat**: Se creează o înregistrare de împrumut cu:
- Data împrumutului (azi)
- Data scadenței (ex: peste 14 zile)
- Stare: ACTIV

## Reguli pentru Operația de Returnare

Membrul poate returna o carte dacă:
- Deține o copie a acelei cărți (împrumut activ)

**Rezultate după returnare:**
- Dacă returnarea este la timp: Starea împrumutului → ÎNCHIS, Stoc cartei se incrementează
- Dacă returnarea este cu întârziere: Se înregistrează o amendă/penalizare, apoi ÎNCHIS
- **Automat**: Dacă există cereri în așteptare pentru cartea returnată, se notifică primul membru din coadă

## Reguli pentru Cererea de Împrumut

Membrul poate cere o carte dacă:
- Cartea nu are copii disponibile
- Membrul nu figurează deja în coada de așteptare

**Rezultat**: Se creează o înregistrare de cerere cu:
- Poziție în coadă (automatică, în ordinea depunerii)
- Stare: ÎN AŞTEPTARE
- Data cererii

## Stări și Fluxuri

**Pentru o carte:**
- DISPONIBILĂ (stoc > 0)
- INDISPONIBILĂ (stoc = 0, liste de așteptare)

**Pentru un împrumut:**
- ACTIV → ÎNCHIS (după returnare)
- ACTIV → DEPĂȘIT (dacă trece scadența)

## Reguli Suplimentare

- Un membru poate avea mai multe cereri, dar doar pentru cărți diferite
- Cererile se onorează în ordinea FIFO
- Notificări: Membrul este anunțat când cartea solicitată devine disponibilă
- Statistici: Sistem urmărește cărți populare și membri activi

Aceasta asigură un flux echitabil de acces și gestionare eficientă a resurselor bibliotecii.