# Corectură majoră: Exemplare vs. Cărți

Problema: Modelul meu trateaza **carte** ca entitate unitara, dar biblioteca are **multiple exemplare** din aceeași carte.

## Model revizuit

**Cărți** (titluri/ediții)
- ID, Titlu, Autor, ISBN, etc.

**Exemplare** (copii fizice)
- ID, ID Carte, Nr. inventar, Stare (disponibil/împrumutat/rezervat)
- **Proprietate: ID Membru (dacă e împrumutat)**

**Împrumuturi**
- ID, ID Exemplar, ID Membru, Data împrumut, Data scadență, Data returnare

**Cererile de împrumut**
- ID, ID Carte, ID Membru, Data cererii, Status

---

## Logică corectată

Când **M2 depune cerere pentru "Ion"**:

1. **Verifica**: "Sunt exemplare disponibile din 'Ion'?"
   - **DA** → Aloca unui M2 cel mai vechi exemplar disponibil (fără cerere formal, direct împrumut)
   - **NU** → Inregistreaza cerere în coada; notificata când se elibereaza exemplar

Când **M1 returneaza exemplarul**:
- Verifica cererile în așteptare pentru cartea respectiva
- Aloca exemplarul primului membru din coada

---

**Rezultat**: M2 **obtine imediat "Ion" (exemplar 2)** → fără cerere, fără așteptare.
