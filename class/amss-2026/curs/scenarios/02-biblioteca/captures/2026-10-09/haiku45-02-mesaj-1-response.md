# Model de date pentru sistem de gestionare a împrumuturilor

## Entități principale

**Membri**
- ID, Nume, Email, Telefon, Data înregistrării
- Status (activ/inactiv)

**Cărți**
- ID, Titlu, Autor, ISBN, Anul publicării
- Stare (disponibilă/împrumutată)
- Locație în bibliotecă

**Împrumuturi**
- ID, ID Carte, ID Membru, Data împrumut, Data scadență, Data returnare
- Stare (activ/returnat/întârziat)

**Cererile de împrumut** (wishlist)
- ID, ID Carte, ID Membru, Data cererii
- Stare (în așteptare/notificată/îndeplinită)

---

## Operații principale

1. **Împrumut carte**: Validare disponibilitate → Creare înregistrare împrumut → Actualizare stare carte
2. **Returnare carte**: Validare împrumut activ → Marcare returnat → Eliberare carte → Notificare cererile în așteptare
3. **Depunere cerere**: Verificare dacă membru există → Înregistrare cerere → Notificare automată la disponibilitate
4. **Prelungire împrumut**: Validare (doar o dată), actualizare scadență
5. **Rapoarte**: Cărți împrumutate, membre cu depășiri, cărți solicitate frecvent

**Vinculi importanți**: Un membru poate avea maxim N cărți simultan; cărți în așteptare se alochez în ordinea cererilor.
