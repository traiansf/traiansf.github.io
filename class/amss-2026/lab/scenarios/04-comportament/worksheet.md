# Sprijin facultativ pentru discuție — ghișeul de echipamente

Folosiți [enunțul](scenario.md) la lucrul individual și la discuția în plen. Notițele sunt facultative, rămân la voi și nu se predau.

## Stări și tranziții

Pentru fiecare rând: stare curentă → eveniment → condiție → stare următoare → efect. Un eveniment nepermis este refuzat, fără modificări. Întrebări de verificare: în ce stare sosește o reîncercare? Ce decide un refuz: starea sau condiția? Ce date rămân după anulare?

**Repere:** `ridică` cu identificator nou numai din Rezervată, numai de titular; reîncercarea (același identificator) primește același `ridicat`; `anulează` numai din Rezervată; Anulată este finală intenționată; Ridicată permite reîncercarea și actualizarea notificării, fără o a doua ridicare.

## Interacțiunea

Pentru `ridică`: cine apelează pe cine, ce se întoarce, ce înregistrează registrul la fiecare pas. Marcați pasul în care se schimbă starea și pasul în care este apelată mesageria; verificați ce rămâne înregistrat când mesageria răspunde `eșec`. Despre mesagerie presupunem numai că răspunde `trimis` sau `eșec`.

## Scenarii

Fiecare scenariu S1–S7 din enunț repornește din I (A și B în Rezervată), exceptând continuările marcate. Pentru fiecare, spuneți rezultatul, starea rezervării, ce se înregistrează și dacă mesageria a fost apelată. La refuz, precizați explicit ce nu se modifică.

## Atelierul de diagrame

Desenați diagrama de stări a unei rezervări după [specificația diagramei de stări](../../diagrame/stari.md): de mână, în Mermaid sau generată cu un asistent AI și revizuită de voi. Verificați-o cu lista de verificare a specificației, punct cu punct, căutând în enunț regula fiecărui punct; o diagramă care se randează fără erori nu este, prin asta, corectă. Întrebări de verificare: unde pleacă bucla reîncercării? Există săgeți pentru evenimente refuzate? `trimisă` și `netrimisă` sunt stări sau date? Cine termină desenează diagrama de secvență a lui `ridică` pentru scenariile S3 (notificare eșuată) și S4 (reîncercare după eșec), după [specificația diagramei de secvență](../../diagrame/secventa.md).

## Exercițiu suplimentar, pentru studiu individual

Din I, `ridică(c1, A, T1)` cu `trimis`; răspunsul registrului nu ajunge la ghișeu, care trimite `ridică(c8, A, T1)`, cu identificator nou. Explicați fiecare rezultat cu regula din enunț (R3 — ridicare, R5 — reîncercare). Apoi: ce știe operatorul după a doua cerere? Ce cereri mai sunt acceptate pentru rezervarea A? Ce responsabilitate a ghișeului ar fi evitat refuzul și ce ați întreba beneficiarul?
