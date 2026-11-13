# Cursul 7 — ghid de predare

[Prezentarea](07-stare.md) are **36 de slide-uri cu copertă** și un parcurs de **100 de minute**. [Enunțul](scenarios/07-manuscrise/brief.md) și [referința](scenarios/07-manuscrise/reference.md) fixează regulile și răspunsurile. Toate datele, regulile relevante și sarcinile folosite la curs apar pe slide-uri; nu sunt necesare calculatoare sau fișe pentru studenți.

## Parcurs

| Minute | Activitate |
|---|---|
| 0–15 | Orientare, citatul, întrebarea deschisă despre cereri pe care studenții nu le-au mai putut schimba (5 min), problema manuscrisului retras, cele șapte evenimente din În evaluare (exercițiu înainte de terminologie); stare, eveniment, tranziție. |
| 15–35 | Regulile manuscrisului; tabelul de tranziții; condiția față de stare; datele păstrate; „este permis `acceptă` acum?”. |
| 35–60 | Diagrama ca reprezentare a tabelului; trasarea S1; exercițiul S3–S4; două ordini (S6); stări finale intenționate. |
| 60–80 | Tabelul propus P, trasare pentru a găsi ce permite în plus și ce nu poate atinge; interzisă, finală sau inaccesibilă; corecția; ce stabilește o trasare. |
| 80–95 | Sarcină AI pregătită, tabel de revizuit, promptul evaluatorului (agent AI de revizuire), revizuire și, pe slide separat, decizia noastră. |
| 95–100 | Transfer la comanda de la cafenea. |

Duratele exercițiilor includ discuția. În etapa 15–35, acordați 4 minute regulilor (două slide-uri), 5 tabelului, 4 condiției și datelor (din care 1 întrebarea despre Rp1) și 7 exercițiului. În etapa 35–60: 3 diagramei, 5 trasării S1, 8 exercițiului S3–S4, 6 celor două ordini, 3 stărilor finale. În etapa 60–80: 6 tabelului P cu trasarea scenariului S2, 5 întrebărilor despre P, 4 celor trei cazuri, 3 corecției, 2 limitelor trasării. Tranzițiile sunt incluse în intervale.

## Distincțiile importante

Ce numea cursul 6 starea registrului se desparte aici în stare (Ciornă, Trimis…, etapa cu nume) și date păstrate; împreună decid ce este permis. Slide-ul „Stare și eveniment” fixează sensul: de aici înainte „stare” înseamnă numai etapa. Starea rezumă istoricul, dar nu decide singură dacă un eveniment este permis: condiția citește și celelalte date. Condiția unei tranziții („există fișier”, „cel puțin un raport”) este verificarea datelor; împreună cu starea curentă formează condiția de succes a evenimentului, în sensul cursului 6. Refuzul unui eveniment păstrează starea și datele, ca refuzul din contractul atribuirii. Slide-ul „Condiția nu este o stare” spune explicit că un model cu stări „Ciornă cu fișier” ar fi și el corect; criteriul nostru este etapa convenită cu beneficiarul.

Datele se păstrează la schimbarea stării (R8); în Ciornă, R3 permite înlocuirea fișierului. De exemplu, după retragere, rapoartele rămân. Verificăm, deci, și starea de după, și datele de după.

S1, S2, S3, S5 și S7 repornesc din I0; S4 continuă S3, iar S6 pornește din starea și datele de după primele patru evenimente ale lui S1. În S6, aceleași două evenimente în ordine diferită dau Retras, respectiv Acceptat, cu exact un eveniment refuzat în fiecare ordine; ambele ordini respectă regulile. Acceptat, Respins și Retras sunt finale intenționate prin decizia beneficiarului; lipsa unei ieșiri se notează, nu se repară.

Tabelul P are două abateri față de enunț: `trimite` fără condiția fișierului (permite prea mult: S2 ajunge în Trimis fără fișier, iar extinderea cu `preia` ajunge În evaluare) și lipsa rândului `înregistrează raport` (permite prea puțin: Acceptat devine inaccesibil, deoarece deciziile cer un raport pe care niciun eveniment nu îl înregistrează). Sub P, În evaluare nu este blocaj (`retrage` rămâne permis), ci obiectivul cerut este inaccesibil; slide-ul „Interzisă, finală sau inaccesibilă?” separă cele trei cazuri și definește blocajul ca pe un caz extrem, explorat în cursul 9. Trasarea este manuală, nu un jurnal de execuție.

Accesibilitatea: o stare este accesibilă dacă există o secvență de evenimente permise care ajunge la ea. S1 este o asemenea secvență pentru Acceptat. Afirmațiile despre toate secvențele (inaccesibilitate, invarianți ai ciclului de viață) cer un argument, nu o trasare; cursul 9 reia distincția cu un model executabil.

## Pregătirea AI și proveniența

Prezentarea folosește **capturi reale** Claude Haiku 4.5, obținute la 12 noiembrie 2026 prin Claude Code 2.1.322, fără unelte și fără contextul proiectului; [arhiva](scenarios/07-manuscrise/captures/2026-11-12/README.md) păstrează promptul exact, contextul, răspunsurile integrale, metadatele și ambele încercări pentru fiecare rol. [Prompturile pregătite](scenarios/07-manuscrise/ai/README.md) rămân sursa pentru capturi noi.

Am ales analiza 01: tabelul și scenariile S1–S7 sunt corecte, dar încheierea răspunde „NU” la accesibilitatea lui Acceptat dintr-o ciornă nouă, citind „accesibil” ca „într-un singur pas”, sens consacrat (relația de accesibilitate dintr-un model Kripke) pe care enunțul trimis nu îl excludea; propria trasare S1 ajunge în Acceptat printr-o secvență. Analiza 02 are aceeași lectură, formulată mai prudent („nu este accesibil direct”). Evaluatorul AI a primit într-un context nou enunțul, sarcina și răspunsul integral. Am ales revizuirea 01, care declară propunerea „corectă și completă”, confirmă S1 și confirmă „NU” ca „riguros”, fără să numească sensul lui „accesibil” care le face compatibile; revizuirea 02 confirmă la fel („nu sunt observații de corectat”). Selecția nu descrie performanța tipică a modelului.

Discuția nu cere găsirea unui defect cu orice preț: tabelul este corect, iar slide-ul o confirmă. Precizarea noastră privește numai sensul lui „accesibil”: nu criticăm lectura „într-un pas”, legitimă, ci faptul că a rămas implicită; ambiguitatea era a enunțului, iar definiția termenului este explicită în enunțul curent. Prompturile și capturile istorice rămân neschimbate. Tabelul P din etapa 60–80 este o propunere construită de noi, nu o captură.

## Încheiere și calibrare

Transferul la cafenea folosește regulile explicit date: anularea numai din Plasată, deci refuzată din În pregătire prin regulă, nu prin omisiune; Ridicată finală, Gata nu. La laborator, ciclul de viață se combină cu interacțiunea peste graniță din cursul 8. După curs, notați dacă studenții confundă încă refuzul decis de stare cu cel decis de condiție, sau accesibilitatea cu un singur pas; folosiți observația pentru ritmul laboratorului.

## Feedback aplicat

Fiecare exercițiu și fiecare fragment AI reia pe același slide regulile necesare, în propoziții întregi; la prima apariție dintr-un slide, identificatorii poartă cuvintele-cheie din enunț: R1 (context), R2 (stări), R3 (pregătire și trimitere), R4 (evaluare), R5 (decizie), R6 (retragere), R7 (evenimente refuzate), R8 (datele se păstrează). Exercițiile au lucru individual și discuție cu toată clasa, fără lucru în pereche; deschiderea are întrebarea deschisă după citat; decizia asupra revizuirii AI are slide propriu.

Vocabular: un eveniment nepermis este **refuzat** (același cuvânt ca rezultatul `refuz` din cursul 6); „respins” rămâne pentru decizia editorială, starea Respins. Condiția unei tranziții se numește **condiție**, ca în modelul de examen; **accesibil** înseamnă „printr-o secvență de evenimente permise”; **blocaj** este starea fără niciun eveniment permis, care nu este finală intenționată.
