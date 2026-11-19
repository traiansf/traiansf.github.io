# Proiectare Sistem Gestionare Împrumuturi Bibliotecă

## Entități Principale

**Carte**: Identificată unic, cu titlu, autor, disponibilitate (exemplare disponibile/total). Fiecare exemplar are un status (disponibil, împrumutat, indisponibil).

**Membru**: Înregistrat cu date personale, cont activ/inactiv. Are o limită de cărți împrumutate simultan și o dată de expirare a abonamentului.

**Împrumut**: Legătură între Membru și Carte cu data început, dată scadență (implicit 14-30 zile) și status (activ/returnat).

**Cerere de Împrumut**: Coadă de așteptare când o carte este indisponibilă. Înregistrează Membrul, Cartea și data cererii.

## Reguli de Operații

**Împrumut:**
- Membru activ cu abonament valabil
- Cărți disponibile (exemplare > 0)
- Membru sub limita de cărți împrumutate
- Nicio dată de scadență anterioară a altor împrumuturi
- Rezultat: Înregistrare împrumut, exemplare disponibile scad, persoană notificată

**Returnare:**
- Înregistrare date reale return
- Calculare eventuale penalități (zile întârziere)
- Stare = "returnat"
- Exemplare disponibile cresc
- **Notificare următorului din coadă de așteptare** (dacă există cereri)

**Cerere de Împrumut:**
- Carte indisponibilă
- Membru activ cu abonament valabil
- Se adaugă în coadă FIFO
- Rezultat: Înregistrare cerere, Membru notificat cînd cartea devine disponibilă
- Se oferă fereastră temporală (ex: 48 ore) pentru a efectua împrumutul

## Constrângeri și Stări Speciale

**Penalități**: Zile întârziere = penalizări (blocaj temporar, taxă, etc.). Cont poate fi suspendat dacă penalități neachitate.

**Prioritate în Coadă**: Se respectă ordinea FIFO; opțional - membri cu mai puține întârzieri primesc prioritate.

**Reactivare Cerere**: Dacă Membru nu preia cartea în 48h, cererea rămâne în coadă pentru următorul.

## Metrici Monitorizate

- Rata de disponibilitate per carte
- Datorii și penalități active
- Lungime cozi de așteptare
- Timp mediu de așteptare

Sistemul asigură o distribuție echitabilă a resurselor și menține calitate serviciilor prin management eficient al cozilor și al responsabilităților membrilor.