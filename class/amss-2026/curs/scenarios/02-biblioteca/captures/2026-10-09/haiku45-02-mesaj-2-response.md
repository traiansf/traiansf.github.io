# Corectură model de date

Problema: **Cererile nu au prioritate asupra împrumuturilor noi.** Necesari mecanisme de rezervare și respectare a cozii.

## Modificări necesare

**1. Adauga entitatea Rezervări**
- ID, ID Carte, ID Membru, Data cererii, Status (în așteptare/notificată/anulată)
- **Indice pe (ID Carte, Data cererii)** — asigură FIFO

**2. Regulă la returnare**
- La returnare: **verifica dacă exista cereri în așteptare**
- Dacă da → Carte merge în **status "rezervată"** pentru membrul din vârf al cozii
- Notificare: membrul are X zile să o prelueze (altfel cerea se anulează)

**3. Regulă la împrumut nou**
- **Verifică**: "Sunt cereri în așteptare pentru această carte?"
- Dacă da → **Refuz împrumut** (carte e deja promisă)
- Doar membrul cu rezervare activa poate o lua

**4. Stări extinse pentru carte**
- disponibilă
- împrumutată
- **rezervată (pentru ID Membru specific)**
- sub întreținere

---

## Rezultat
M2 ar fi avut carte în stare "rezervată" → M3 ar fi refuzat cu mesaj "Această carte a fost solicitată de alt membru"
