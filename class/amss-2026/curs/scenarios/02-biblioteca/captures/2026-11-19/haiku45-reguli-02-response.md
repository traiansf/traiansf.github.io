# Proiectare Sistem Gestionare Împrumturi Bibliotecă

## Entități și Stări

**Entități principale:**
- **Titlu**: Resursă catalog cu identificator unic.
- **Exemplar**: Copie fizică a unui titlu; are trei stări mutually exclusive:
  - *Disponibil*: fără împrumut activ și fără rezervare activă.
  - *Împrumutat*: legat activ de un membru printr-un împrumut.
  - *Rezervat*: alocat unei cereri neîncheiate (în așteptare de ridicare).
- **Membru**: Utilizator al sistemului.
- **Împrumut activ**: Legătura membru-exemplar; doar unu pe exemplar.
- **Cerere neîncheiată**: Solicitare de titlu de către membru; poate fi în stare *Așteptare* (fără exemplar) sau *Îndeplinit* (cu exemplar rezervat).

## Operații și Reguli

**1. Împrumut (R2)**
- **Condiție**: Exemplar disponibil SAU rezervat aceluiași membru.
- **Acțiune**: Creare împrumut activ.
- **Rezultat**: Succes sau respingere (împrumut/rezervat altcuiva).

**2. Returnare (R3)**
- **Condiție**: Exemplar cu împrumut activ.
- **Acțiune**: Închidere împrumut; alocarea exemplarului primei cereri în așteptare (devino rezervat) sau devenire disponibil.
- **Rezultat**: Succes și tranziție de stare; respingere (fără împrumut).

**3. Cerere de Împrumut (R4)**
- **Condiție**: 
  - Fără exemplare disponibile ale titlului.
  - Membru fără cerere neîncheiată pentru acel titlu.
- **Acțiune**: Înregistrare cerere în așteptare cu marcă temporală.
- **Rezultat**: Succes (cere în așteptare) sau respingere (exemplare disponibile/duplicat).

## Fluxuri și Rezultate

**Flux normal:**
1. Membru solicită titlu → Cerere în așteptare (dacă reguli valide).
2. Exemplar returnat → Prima cerere în așteptare devine *Îndeplinit* (exemplar rezervat); celelalte rămân în așteptare.
3. Membru cu cerere îndeplinit ridică exemplar → Creare împrumut; cerere închisă.

**Rezultate operații:**
- **Succes**: Starea sistemului se modifică conform regulilor; cereri/exemplare tranziționate.
- **Respingere**: Stare nemodificată; motiv implicit (indisponibilitate, duplicat, fără împrumut).

## Concepte-Cheie

- **Prioritate FIFO**: Cererile în așteptare pentru un titlu se servesc în ordinea înregistrării.
- **Atomicitate**: Returnare + alocație = o operație; nu se execută parțial.
- **Separare emplu-cerere**: Exemplar specific pentru împrumut; cerere abstract (titlu fără alegere).
- **Și/sau logic**: Exemplar *este* disponibil *sau* rezervat acelui membru → împrumut OK.

Sistemul este minimal, fără notificări, amende, expirare sau autentificare—doar stările și tranzițiile esențiale pentru logica de împrumut, returnare și așteptare.