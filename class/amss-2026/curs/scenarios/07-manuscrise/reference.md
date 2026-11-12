# Raționament de referință — manuscrise

Analiză de pregătire pentru [enunț](brief.md), nu captură AI.

## Tabelul de tranziții

| Stare curentă | Eveniment | Condiție | Stare următoare | Efect asupra datelor |
|---|---|---|---|---|
| Ciornă | `ataseaza(f)` | — | Ciornă | fișierul devine f |
| Ciornă | `trimite` | există fișier | Trimis | data trimiterii |
| Trimis | `preia(e)` | — | În evaluare | editorul devine e |
| În evaluare | `inregistreaza_raport(r)` | — | În evaluare | r se adaugă la rapoarte |
| În evaluare | `accepta` | cel puțin un raport | Acceptat | decizia și data ei |
| În evaluare | `respinge` | cel puțin un raport | Respins | decizia și data ei |
| Trimis | `retrage` | — | Retras | data retragerii |
| În evaluare | `retrage` | — | Retras | data retragerii |

Orice altă combinație stare–eveniment, sau o condiție neîndeplinită, produce un eveniment refuzat: starea și datele rămân neschimbate (R7). Datele înregistrate nu se șterg niciodată (R8). Acceptat, Respins și Retras sunt stări finale intenționate: lipsa tranzițiilor de ieșire este o decizie a beneficiarului, nu o omisiune.

## Legătura cu contractele

Fiecare rând este contractul unui eveniment în starea respectivă: starea curentă și condiția formează condiția de succes; starea următoare și efectul sunt postcondiția cazului de succes; refuzul cu starea și datele neschimbate este postcondiția cazului de refuz. Starea însăși este o dată derivată din istoric: ea spune ce evenimente sunt permise acum. „Există fișier” și „cel puțin un raport” depind de date, nu de stare; de aceea le scriem ca o condiție separată, nu ca o stare suplimentară.

Invariantul modelului: un manuscris este în exact o stare; într-o stare finală intenționată datele nu se mai modifică; un manuscris Acceptat sau Respins are cel puțin un raport și un editor; un manuscris în Trimis, În evaluare sau cu decizie are fișier. Aceste proprietăți se verifică într-o singură stare, iar fiecare tranziție le păstrează.

## Rezultatele scenariilor

Toate pornesc din I0 (Ciornă, fără date).

| Scenariu | Rezultat |
|---|---|
| S1 | toate permise; Acceptat; fișier f1, editor E1, rapoarte [Rp1], decizie: acceptat. |
| S2 | `trimite` refuzat (fără fișier); Ciornă, fără date. |
| S3 | primele patru permise; `retrage` permis; Retras; fișier f1, editor E1, rapoarte [Rp1], data retragerii; fără decizie. |
| S4 | `accepta` refuzat (Retras nu permite decizii); rămâne exact starea de după S3, inclusiv Rp1. |
| S5 | `accepta` refuzat (niciun raport); În evaluare, fișier f1, editor E1, fără rapoarte. |
| S6 (a) | `retrage` permis → Retras; `accepta` refuzat. Final: Retras. |
| S6 (b) | `accepta` permis → Acceptat; `retrage` refuzat. Final: Acceptat. |
| S7 | `retrage` refuzat (Ciornă); I0 neschimbat. |

S6 arată că aceleași evenimente, în altă ordine, produc stări finale diferite; în fiecare ordine exact un eveniment este refuzat. Trasarea nu decide care ordine este „corectă”: ambele respectă regulile; ordinea vine din lume (cine a apăsat primul).

## Contraexemplul didactic

Tabelul propus P, construit pentru verificare, are două abateri față de enunț: `trimite` nu cere fișier, iar rândul `inregistreaza_raport` lipsește, deși `accepta` și `respinge` cer un raport. Sub P: S2 duce manuscrisul fără fișier în Trimis, apoi în În evaluare; din În evaluare, singurul eveniment permis rămâne `retrage`, pentru că niciun eveniment nu poate înregistra un raport. Acceptat nu este accesibil dintr-o ciornă nouă. Nu este un blocaj (există un eveniment permis), ci un obiectiv inaccesibil; Acceptat rămâne, în schimb, o stare finală intenționată. Corecția restabilește condiția lui `trimite` și rândul lipsă; S1 și S2 se recalculează cu tabelul corectat.

O trasare verifică o singură secvență de evenimente. Afirmația „Acceptat este accesibil” cere o secvență care ajunge acolo (S1 o dă); afirmația „niciun manuscris fără fișier nu ajunge în evaluare” privește toate secvențele și se sprijină pe condiția lui `trimite` și pe faptul că fișierul nu se șterge, nu pe câteva exemple. Explorarea sistematică a stărilor accesibile urmează în cursul 9.

## Transfer

Comanda la cafenea (exercițiul final): Plasată → În pregătire → Gata → Ridicată; `anuleaza` permisă numai în Plasată. Din În pregătire, `anuleaza` este refuzată: tranziție interzisă prin regulă, nu lipsă din tabel. Ridicată este finală intenționată. După anulare rămân înregistrate produsele comandate și momentul comenzii. Regulile se citesc din noul enunț, nu se importă de la revistă.
