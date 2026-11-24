# Enunț — biletele de ordine de la secretariat

Exemplu didactic pentru Laboratorul 5, după cursurile 9–10. Versiune: 24 noiembrie 2026. Discutăm proprietăți, explorarea unui model finit, limitele ei și o abstractizare. Nu se cere aplicație, migrarea unui sistem existent sau un instrument de verificare formală.

Studenții care vin la secretariat iau un bilet de ordine de la un **automat de bilete**. Secretara, la **ghișeu**, cheamă următorul bilet. Un **registru al cozii**, componenta pe care o proiectăm, dă biletele și alege pe cine chemăm.

## Reguli convenite

- **R1 — context:** un singur ghișeu; evenimentele se produc secvențial. Nu modelăm durata, plecarea unui student care așteaptă sau mai multe ghișee.
- **R2 — bilet:** un bilet are un număr, dat în ordinea sosirii, și un fel: **obișnuit** sau **prioritar** (de exemplu, pentru o persoană cu dizabilități).
- **R3 — sosire:** `sosește(fel)` este acceptat numai dacă așteaptă mai puțin de N bilete: biletul primește numărul următor, intră în coadă, iar numărul este întors. Altfel întoarce `refuz`, fără modificări.
- **R4 — chemare:** `cheamă()` este acceptat numai dacă așteaptă cel puțin un bilet: registrul alege un bilet care așteaptă, îl scoate din coadă și îi întoarce numărul. Altfel întoarce `refuz`, fără modificări.
- **R5 — regula de alegere:** alegerea urmează regula stabilită de secretariat; secretara o fixează de la ghișeu, prin `fixează regula(r)`. Regula se schimbă de la o perioadă la alta, fără să se schimbe sosirea și chemarea. Regulile folosite azi sunt „În ordinea sosirii” și „Prioritarii întâi”.
- **R6 — depășire:** un bilet care așteaptă este **depășit** când este chemat un bilet sosit după el.

## Proprietăți cerute

- **A1 — chemat o dată:** un bilet este chemat cel mult o dată.
- **A2 — fără blocaj:** cât timp așteaptă cel puțin un bilet, `cheamă()` este acceptat.
- **A3 — așteptare limitată:** niciun bilet nu este depășit de mai mult de două ori.

## Reguli de alegere

- **În ordinea sosirii:** cel mai vechi bilet care așteaptă.
- **Prioritarii întâi:** cel mai vechi bilet prioritar; dacă nu așteaptă niciunul, cel mai vechi bilet.
- **Doi la rând** (propunere de discutat): ca „Prioritarii întâi”, dar, după doi prioritari chemați unul după altul, urmează cel mai vechi bilet obișnuit, dacă așteaptă vreunul.

## Starea modelului și scenariile

Starea modelului cuprinde biletele care așteaptă, în ordinea sosirii, fiecare cu felul și numărul de depășiri; la regula „Doi la rând”, și câți prioritari au fost chemați unul după altul. Scriem biletele cu felul și numărul lor: o1 este obișnuit, primul sosit; p2 este prioritar, al doilea. La început coada este goală. Scenariile sunt independente și pornesc de acolo.

| Scenariu | Evenimente |
|---|---|
| S1 — câte unul | sosesc o1, p2; două chemări |
| S2 — un obișnuit | sosește o1; apoi, de trei ori: sosește un prioritar (p2, p3, p4) și urmează o chemare |
| S3 — doi obișnuiți | sosesc o1, o2, p3; o chemare; sosește p4; o chemare; sosește p5; două chemări |

## Schimbări

- **C1 — programați:** apare felul **programat** și regula „Programații întâi”: cel mai vechi bilet programat; dacă nu așteaptă niciunul, ca „Prioritarii întâi”.
- **C2 — după oră:** o regulă nouă alege și după ora la care a fost luat biletul.

## Întrebările discuției

Ce infirmă și ce stabilește fiecare proprietate? Ce spun scenariile și ce spune explorarea unui model cu N bilete? Ce se schimbă dacă N crește? Unde stă limita din A3? Ce trece prin interfața regulii de alegere?

Puteți schița sau nota idei, fără documente de predat. În atelierul de diagrame, fiecare realizează diagrama de clase cu interfață a variantei discutate în plen, după [specificația ei](../../diagrame/clase-interfata.md): de mână, în Mermaid sau cu un asistent AI, și o revizuiește față de acest enunț. Asistentul AI este opțional; nu sunt necesare conturi AI. [Exploratorul](model/explorare.py) modelului este opțional; rezultatele lui sunt pe slide-uri.
