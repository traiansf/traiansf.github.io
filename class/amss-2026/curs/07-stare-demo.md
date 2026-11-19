# Cursul 7 — ghid de predare

[Prezentarea](07-stare.md) are **37 de slide-uri cu copertă** și un parcurs de **100 de minute**. [Enunțul](scenarios/07-manuscrise/brief.md) și [referința](scenarios/07-manuscrise/reference.md) fixează regulile și răspunsurile. Toate datele, regulile relevante și sarcinile folosite la curs apar pe slide-uri; nu sunt necesare calculatoare sau fișe pentru studenți.

## Parcurs

| Minute | Activitate |
|---|---|
| 0–15 | Orientare, citatul, întrebarea deschisă despre cereri pe care studenții nu le-au mai putut schimba (5 min), problema manuscrisului retras, cele șapte evenimente din În evaluare (exercițiu înainte de terminologie); stare, eveniment, tranziție. |
| 15–35 | Regulile manuscrisului; tabelul de tranziții; condiția față de stare; datele păstrate; „este permis `acceptă` acum?”. |
| 35–60 | Diagrama ca reprezentare a tabelului; trasarea S1; exercițiul S3–S4; două ordini (S6); stări finale intenționate. |
| 60–80 | Tabelul propus P, trasare pentru a găsi ce permite în plus și ce nu poate atinge; interzisă, finală sau inaccesibilă; corecția; ce stabilește o trasare. |
| 80–95 | O diagramă generată: cererea către asistentul AI, diagrama Mermaid randată exact cum a fost generată, comparația rând cu rând a codului cu tabelul de tranziții, consecința rândului lipsă (trasare din I0), altă încercare, corectă, la aceeași cerere și, pe slide separat, decizia noastră. |
| 95–100 | Transfer la comanda de la cafenea. |

Duratele exercițiilor includ discuția. În etapa 15–35, acordați 4 minute regulilor (două slide-uri), 5 tabelului, 4 condiției și datelor (din care 1 întrebarea despre Rp1) și 7 exercițiului. În etapa 35–60: 3 diagramei, 5 trasării S1, 8 exercițiului S3–S4, 6 celor două ordini, 3 stărilor finale. În etapa 60–80: 6 tabelului P cu trasarea scenariului S2, 5 întrebărilor despre P, 4 celor trei cauze, 3 corecției, 2 limitelor trasării. Tranzițiile sunt incluse în intervale.

## Distincțiile importante

Ce numea cursul 6 starea registrului se desparte aici în stare (Ciornă, Trimis…, etapa cu nume) și date păstrate; împreună decid ce este permis. Slide-ul „Stare și eveniment” fixează sensul: de aici înainte „stare” înseamnă numai etapa. Starea rezumă istoricul, dar nu decide singură dacă un eveniment este permis: condiția citește și celelalte date. Condiția unei tranziții („există fișier”, „cel puțin un raport”) este verificarea datelor; împreună cu starea curentă formează condiția de succes a evenimentului, în sensul cursului 6. Refuzul unui eveniment păstrează starea și datele, ca refuzul din contractul atribuirii. Slide-ul „Condiția nu este o stare” spune explicit că un model cu stări „Ciornă cu fișier” ar fi și el corect; criteriul nostru este etapa convenită cu beneficiarul.

Datele se păstrează la schimbarea stării (R8); în Ciornă, R3 permite înlocuirea fișierului. De exemplu, după retragere, rapoartele rămân. Verificăm, deci, și starea de după, și datele de după.

S1, S2, S3, S5 și S7 repornesc din I0; S4 continuă S3, iar S6 pornește din starea și datele de după primele patru evenimente ale lui S1. În S6, aceleași două evenimente în ordine diferită dau Retras, respectiv Acceptat, cu exact un eveniment refuzat în fiecare ordine; ambele ordini respectă regulile. Acceptat, Respins și Retras sunt finale intenționate prin decizia beneficiarului; lipsa unei ieșiri se notează, nu se repară.

Tabelul P are două abateri față de enunț: `trimite` fără condiția fișierului (permite prea mult: S2 ajunge în Trimis fără fișier, iar extinderea cu `preia` ajunge În evaluare) și lipsa rândului `înregistrează raport` (permite prea puțin: Acceptat devine inaccesibil, deoarece deciziile cer un raport pe care niciun eveniment nu îl înregistrează). Sub P, În evaluare nu este blocaj (`retrage` rămâne permis), dar starea Acceptat, cerută de reguli, este inaccesibilă; slide-ul „Interzisă, finală sau inaccesibilă?” separă cele trei cauze și definește blocajul ca formă extremă, explorat în cursul 9. Trasarea este manuală, nu un jurnal de execuție.

Accesibilitatea: o stare este accesibilă dacă există o secvență de evenimente permise care ajunge la ea. S1 este o asemenea secvență pentru Acceptat. Afirmațiile despre toate secvențele (inaccesibilitate, invarianți ai ciclului de viață) cer un argument, nu o trasare; cursul 9 reia distincția cu un model executabil.

## Pregătirea AI și proveniența

**Lecția AI a cursului (decizia din 19 noiembrie 2026, `docs/ai-lessons-and-lab-diagrams.md`): o diagramă randată nu este o diagramă corectă.** Codul Mermaid generat se desenează curat și arată complet, dar poate să nu spună același lucru ca tabelul de tranziții. Formatul: comparația rând cu rând dintre cod și tabel, apoi trasarea din I0. Nu mai folosim perechea analist–evaluator (agent AI de revizuire).

Prezentarea folosește **capturi reale** Claude Haiku 4.5, obținute la 19 noiembrie 2026 prin Claude Code 2.1.328, fără unelte și fără contextul proiectului, fiecare încercare într-un context nou; [arhiva](scenarios/07-manuscrise/captures/2026-11-19/README.md) păstrează cele patru formulări ale cererii, contextul, răspunsurile integrale, metadatele și toate cele 18 încercări. [Prompturile pregătite](scenarios/07-manuscrise/ai/README.md) rămân sursa pentru capturi noi. Capturile din 12 noiembrie 2026 (analist și evaluator, sensul lui „accesibil”) rămân arhivate, neschimbate.

Contextul trimis este enunțul curent, fără sarcina de proiectare (deci fără tabelul de tranziții). Primele cinci încercări au stări și tranziții corecte, dar nu se randează: Mermaid nu acceptă numele de stări între ghilimele în tranziții. Am adăugat cerința de randare (`state "Nume" as X`): cinci încercări corecte; apoi etichetele UML cu efecte: patru încercări corecte; apoi cererea unei diagrame „compacte”: două corecte și două care omit bucla `atașează(f)` (una afișează și `\n` literal în etichete). Am ales încercarea v4-04: se randează curat, are toate stările, condițiile corecte și o explicație care afirmă că diagrama conține „tranzițiile permise de reguli”, dar îi lipsește rândul `atașează(f)`. Consecința, găsită prin trasare: din I0 condiția lui `trimite` nu poate fi îndeplinită, deci toate stările de după Ciornă sunt inaccesibile, iar din I0 nu mai este permis niciun eveniment (blocaj). Încercarea v4-03, la aceeași cerere, este corectă și se proiectează după comparație, randată tot exact cum a fost generată. Dintre cele 18 încercări, 16 conțin toate rândurile tabelului; selecția nu descrie comportamentul tipic al modelului.

Codul selectat apare de două ori: randat (slide-ul „Diagrama generată”) și ca fragment text, alături de tabel, pentru comparația rând cu rând; omisiunile (starea inițială, săgețile spre cercul final, declarațiile numelor) sunt marcate pe slide. Săgețile spre cercul final din unele încercări nu au eveniment: sunt notația UML pentru sfârșitul mașinii de stări, nu rânduri ale tabelului; dacă studenții le socotesc tranziții în plus, discuția trece prin R8. Diagramele generate sunt redate cu tema implicită Mermaid; în PDF etichetele lor sunt mici, iar fragmentul text de pe slide-ul următor le face lizibile. Tabelul P din etapa 60–80 rămâne o propunere construită de noi, nu o captură; lecția AI reia aceeași verificare (acolo lipsea `înregistrează raport`, aici `atașează`).

## Încheiere și calibrare

Transferul la cafenea folosește regulile explicit date: anularea numai din Plasată, deci refuzată din În pregătire prin regulă, nu prin omisiune; Ridicată finală, Gata nu. La laborator, ciclul de viață se combină cu interacțiunea peste graniță din cursul 8. După curs, notați dacă studenții confundă încă refuzul decis de stare cu cel decis de condiție, sau accesibilitatea cu un singur pas; folosiți observația pentru ritmul laboratorului.

## Feedback aplicat

Fiecare exercițiu și fiecare fragment AI reia pe același slide regulile necesare, în propoziții întregi; la prima apariție dintr-un slide, identificatorii poartă cuvintele-cheie din enunț: R1 (context), R2 (stări), R3 (pregătire și trimitere), R4 (evaluare), R5 (decizie), R6 (retragere), R7 (evenimente refuzate), R8 (date păstrate, stări finale). Exercițiile au lucru individual și discuție cu toată clasa, fără lucru în pereche; deschiderea are întrebarea deschisă după citat; decizia asupra capturilor AI are slide propriu.

Vocabular: un eveniment nepermis este **refuzat** (același cuvânt ca rezultatul `refuz` din cursul 6); „respins” rămâne pentru decizia editorială, starea Respins. Când s-a petrecut o trimitere, o decizie sau o retragere spunem **momentul** trimiterii, deciziei, retragerii, nu „data”, ca să nu se confunde cu **datele** păstrate. Condiția unei tranziții se numește **condiție**, ca în modelul de examen; **accesibil** înseamnă „printr-o secvență de evenimente permise”, iar o stare cerută de reguli, dar la care nu se ajunge, este o **stare inaccesibilă** (nu „obiectiv inaccesibil”); **blocaj** este starea fără niciun eveniment permis, care nu este finală intenționată.
