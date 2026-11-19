# Sistem de Gestionare a Împrumuturilor de Cărți

## Concepte Principale

**Entități core:**
- **Carte**: articolul din bibliotecă cu status (Disponibilă/Împrumutată)
- **Membru**: persoană înregistrată în sistem
- **Împrumut**: relație activă între membru și carte cu dată de expirare
- **Cerere de Împrumut**: coadă de așteptare pentru cărți împrumutate

## Reguli Operaționale

### Operația de Împrumut
**Condiții de succes:**
- Cartea trebuie să fie disponibilă (nu are împrumut activ)
- Membrul nu are amenzii neplătite
- Membrul nu a depășit limita de cărți simultan

**Rezultat:** 
- Status carte se schimbă în „Împrumutată"
- Se creează înregistrare de împrumut cu dată de scadență (ex. 14 zile)
- Se notifică membrul
- Alte cereri de împrumut pentru acea carte rămân în coadă

**Eșec:** Mesaj clar indicând motivul (carte ocupată, limite depășite, etc.)

### Operația de Returnare
**Condiții:**
- Carte trebuie să aibă împrumut activ
- Se verifică dacă a fost depășit termenul

**Rezultat:**
- Împrumutul se inchide
- Status carte se schimbă în „Disponibilă"
- Dacă există cereri în așteptare, prima se notifică și devine automaticamente următorul împrumut (statusul cărții rămâne „Împrumutată")
- Se calculează penalizări dacă e întârziere
- Se notifică toți cei pe coadă despre schimbarea pozițiilor

**Eșec:** Carte nu are împrumut activ

### Operația de Cerere de Împrumut (Rezervare)
**Condiții:**
- Cartea trebuie să fie împrumutată (nu se fac cereri pentru cărți disponibile)
- Membrul nu se află deja pe coadă pentru acea carte

**Rezultat:**
- Membrul se adaugă în coadă de așteptare
- Pozitia în coadă: ultimul în linie
- Se notifică membrul cu poziția estimată
- Se notifică membrul actual al împrumutului (cartea are o cerere în așteptare)

**Eșec:** Carte este disponibilă (trebuie să facă împrumut direct)

## Reguli Generale
- Un membru poate derula **maxim N cărți** simultan
- Durata standard de împrumut: 14 zile
- Penalizări pentru întârziere
- Céreri se anulează manual sau se onorează automat

---

Aceasta asigură flux clar: disponibilitate → împrumut → cereri în coadă → returnare → notificare următorului.