# Analiză: Rezervări în depozit — Responsabilități și Contracte

## Repartizarea responsabilităților

**Registrul** este singurul custode al stării (F, R, lista rezervărilor cu stare și cantitate). Orice modificare merge numai prin operațiile sale.

**Operatorul** (formular) și **importul** apelează aceleași trei operații; ambele sunt canale de intrare, nu gestori de stare. Responsabilitatea motorului registrului este garantarea contractelor: acceptare sau refuz atomic, fără modificări parțiale.

## Contracte pentru operații

### `rezerva(id, q)`
- **Precondiție:** id nenul și nefolosit anterior; q > 0; D ≥ q (bucăți disponibile suficiente).
- **Succes:** Id adăugat la registru ca activ, cantitate q; R creşte cu q, D scade cu q. F ineschimbat.
- **Refuz:** Oricare dintre precondiții nu e îndeplinită → fără nicio modificare (stare ineschimbată).
- **Efect invariant:** D se reduce exact cu q; nici o altă rezervare nu e afectată.

### `ridica(id)`
- **Precondiție:** id găsit cu stare activă.
- **Succes:** Rezervare marcată ridicată; F scade cu cantitatea sa q; R scade cu q (id nu mai e activ); D ineschimbat (scad ambii termeni).
- **Refuz:** Id necunoscut sau stare non-activă (ridicată/anulată) → fără modificări.
- **Efect invariant:** Ridicarea conservă D; istoric păstrat, id nu se reutilizează.

### `anuleaza(id)`
- **Precondiție:** id găsit cu stare activă.
- **Succes:** Marcată anulată; R scade cu cantitatea; D creşte cu aceea. F ineschimbat.
- **Refuz:** Id necunoscut sau stare non-activă → fără modificări.
- **Efect invariant:** Anularea redă disponibilul; istoric păstrat.

## Calculul S2, S3, S5

| Scenariu | Acțiune | Precondiții | Rezultat |
|---|---|---|---|
| **S2** | `rezerva(B, 7)` din I | B nefolosit ✓; 7>0 ✓; D=6<7 ✗ | **Refuz**. Stare: F=10, A activ 4, R=4, D=6 |
| **S3** | `ridica(A)` din I | A activ ✓ | **Succes**. F=6, A ridicat 4, R=0, D=6 |
| **S5** | `ridica(A)` apoi `anuleaza(A)` | După ridica: F=6, A ridicat, R=0. `anuleaza` necesită stare activă. ✗ | **Refuz anulării**. Stare: F=6, A ridicat, R=0, D=6 |

## Comparație: Formular, Import, Operații

Atât formularul operatorului cât și importul de cereri apelează aceleași trei operații. Diferența nu este în logică, ci în sursă: formularul este intrare sincronă manuală, importul este lotul automatizat. Ambele au aceeași responsabilitate: să respecte rezultatul (acceptare sau refuz) al motorului.

**Verificări separate în formular și import sunt redundante** — contractele operațiilor garantează invarianții. Dacă importul apelează `ridica(A)` și A nu e activ, motorul refuză, nu formularul. Duplicarea verificărilor în canal duce la incoerenţă: o cerere acceptată în formular ar putea fi refuzată la import dacă verificările diferă.

**Soluția:** Un singur loc de decizie — motorul registrului. Canale (formular, import) doar transmit comenzi. Rezultatul (`{acceptat, refuz}`) este comunicat înapoi canalului; nu există stări parțiale.

## Invarianți persistenți

1. **D = F − R**, unde R = suma cantităților ale rezervărilor active.
2. Fiecare id apare cel mult o dată; unei anulate nu i se atribuie id nou.
3. Operațiile sunt atomice: nu apar modificări parțiale.
4. Refuzul nu modifă F, R, nici starea vreunei rezervări.

**Concluzie:** Contractele sunt suficiente pentru a valida ambele canale de intrare cu un singur motor.