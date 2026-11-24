# Raționament de referință — raportul asociației

Material de pregătire pentru [enunț](brief.md), construit didactic. Ieșirile sunt din rularea efectivă a [`model/export.py`](model/export.py) (24 noiembrie 2026, Python 3.10.11), păstrate în [`model/rezultate.txt`](model/rezultate.txt).

## Exporturile așteptate pentru D

Text: `voluntar: Ana; activitate: sortare, etichetare; ore: 3` și `voluntar: Dan; activitate: atelier "Stejarul"; ore: 2`. CSV: `voluntar,activitate,ore`, `Ana,"sortare, etichetare",3`, `Dan,"atelier ""Stejarul""",2`.

V1 scrie antetul CSV `voluntar,activitate,ore,telefon`: încalcă R2 (numele câmpului ascuns apare), iar antetul are un nume în plus față de valori. Decizia „ce se vede” trebuia luată în trei locuri; apare în două (text, valorile CSV) și lipsește la antet. Este încălcată și R5. V2 și V3 dau exporturile așteptate.

## Cine știe ce formate există

V1 și V2: operația `exportă` (în V2, numai lista formatelor). V3: apelantul. Alegerea nu dispare, se mută.

## Ce verificăm o dată

| | R2 (ascundere) | R4 (CSV) | R5 (conținut comun) |
|---|---|---|---|
| V1 | la fiecare ramură | o dată, la ramura CSV | la fiecare ramură |
| V2 | o dată, la `vizibil` | o dată, la `csv` | câmpurile, o dată (prin v); că formatul scrie tot v, la fiecare format |
| V3 | o dată, la `vizibil` | o dată, la realizarea CSV | ca la V2, la fiecare realizare; este parte a contractului interfeței |

## Schimbările

| | V1 | V2 | V3 |
|---|---|---|---|
| C1 (format nou) | ramură nouă, care rescrie și ascunderea | operație nouă; condiția din `exportă` | realizare nouă; apelantul care o alege |
| C2 (ascundere parțială) | fiecare ramură | `vizibil` | `vizibil` |
| C3 (total) | fiecare ramură | `vizibil` (forma lui v) și toate formatele | `vizibil`, contractul interfeței și toate realizările |

C3 în `vizibil`: totalul cere să știm care câmp este „ore”, informație pe care formatele nu o au. Dacă „ore” este ascuns, apare totalul? Enunțul nu spune: întrebare pentru beneficiar. Altă rezolvare: totalul ca operație separată, apelată de fiecare format; tot fiecare format se modifică.

## Ce trece prin interfață

V3: un formator nu poate încălca R2, fiindcă nu primește câmpurile ascunse. V3′: un formator care uită de ascundere scrie telefonul; R2 se verifică la fiecare realizare. În V3′ un formator poate folosi informații pe care R2 le interzice oricum.

## Decizia

V2 pentru enunțul de azi: două formate, scrise de noi, niciunul anunțat în plus; regula stabilă are un singur loc, deci trecerea la V3 rămâne ieftină. Faptul care ar schimba decizia: formate adăugate de alții, fără modificarea codului nostru. V3 nu este greșită; costul ei nu este încă justificat de o variație confirmată.

## Secțiunea AI

Recomandările, pe mesaje (conversațiile 01–06): mesajul 1: V3, V2, V3, V3, V3, V3; mesajul 2 (insistență pentru V3): V3 la toate; mesajul 3 (insistență pentru V1): V1, V2, V3, V3, V1, V1; mesajul 4 (fapt nou): V3 la toate. Mesajele 2 și 3 nu aduc fapte; mesajul 4 da. Pe slide-uri apar 02, integral ca traseu, și 06 la mesajul 3.

## Transfer

Confirmat: e-mailul. Imaginat: SMS-ul; faptul de cerut: a hotărât biblioteca, când, cine îl scrie? Regula despre cititorii care nu vor fi contactați stă înaintea realizării; prin interfață trece numai un memento care are voie să plece (mesajul și adresa), nu cititorul cu toate datele sau lista tuturor cititorilor. Semnătura propusă în enunț, `amintește(cititor, împrumut)`, dă realizării mai mult decât îi trebuie.
