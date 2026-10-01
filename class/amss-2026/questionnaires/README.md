# Chestionare AMSS 2026/2027

Cele două chestionare sunt pregătite pentru Google Forms, prin import din Google Sheets cu Form Builder. Fișierele sunt resurse pentru profesor; formularele nu au fost create într-un cont Google. Nu publicați un link de completare până când formularul nu este configurat și verificat.

## Administrare

- **Inițial:** 19 întrebări, aproximativ 10–12 minute, în prima săptămână. Invitați toate grupele, inclusiv studenții care nu participă la Laboratorul 0. Păstrați fereastra de răspuns deschisă până după cursul 2 și înaintea Laboratorului 1; notați acest context la interpretare.
- **Final:** 18 întrebări, aproximativ 10–12 minute, în ultima săptămână. Invitați din nou întreaga cohortă; includeți completarea în timpul rezervat reflecției, separat de examen și de interviul proiectului.
- Participare voluntară, fără punctaj. Nu cereți nume, e-mail, număr matricol sau echipă. Dezactivați colectarea adreselor de e-mail; verificați setările de acces ale contului instituțional. Nu prezentați formularul ca anonim înainte de verificarea acestor setări.

Titlu inițial: **AMSS — Experiență și așteptări la început de curs**.

Descriere inițială: „Vrem să aflăm ce experiență ai și ce ai vrea să înveți, pentru a adapta exemplele, explicațiile și exercițiile cursului. Completarea este voluntară, durează aproximativ 10–12 minute și nu influențează nota. Nu solicităm date de identificare. Poți omite întrebări. Pentru scenariile scurte, răspunde fără căutări sau AI; «Nu știu încă» ne ajută să planificăm explicațiile.”

Titlu final: **AMSS — Ce ai învățat și ce putem îmbunătăți**.

Descriere finală: „Răspunsurile ne ajută să înțelegem ce ai învățat și cum putem îmbunătăți ediția următoare. Completarea este voluntară, durează aproximativ 10–12 minute și nu influențează nota. Nu solicităm date de identificare. Poți omite întrebări. Răspunde la scenariile scurte fără căutări sau AI; ne interesează raționamentul tău actual.”

## Import prin Form Builder

1. Într-un Google Sheet nou, importați [initial.csv](initial.csv) sau [final.csv](final.csv) prin **File → Import → Upload**. Folosiți separatorul virgulă și codificarea UTF-8. Fiecare variantă merge într-un tab separat.
2. Deschideți add-on-ul **Form Builder for Sheets**, selectați tabul și modelul **Questions and Answers**, fără mod Quiz.
3. Mapați **Questions** la coloana A, **Desc** la B, **Type** la C, **Required** la D, iar opțiunile la **E:M**. Prima linie este antet; intervalele de întrebări sunt A2:M20 pentru inițial și A2:M19 pentru final. Folosiți opțiunea de ignorare a antetului sau selectați direct aceste intervale, conform interfeței add-on-ului.
4. Previzualizați toate întrebările și importați într-un formular nou. Completați titlul, descrierea și mesajul de confirmare: „Mulțumim! Răspunsurile vor fi analizate împreună pentru îmbunătățirea cursului.”
5. Verificați că întrebările sunt opționale, răspunsurile deschise au tip paragraf și listele cu selecție multiplă au tip checkbox. Pentru întrebările care cer cel mult trei variante, setați manual validarea **Select at most 3**. Nu amestecați ordinea întrebărilor sau a răspunsurilor.
6. Faceți o completare de probă, inspectați răspunsul din Sheet și eliminați răspunsul de probă înainte de distribuirea linkului pe Teams. Verificați și accesul unui student, fără drepturi de editare.

Structura și tipurile `MULTIPLE_CHOICE`, `CHECKBOX`, `PARAGRAPH`, cu `Required=FALSE`, urmează [documentația oficială Form Builder](https://sites.google.com/jivrus.com/f-builder/docs/formatting/google-sheets). Conversia CSV în Google Sheets este descrisă în [FAQ-ul producătorului](https://sites.google.com/jivrus.com/f-builder/support/faq). Importul efectiv în add-on rămâne de verificat în contul profesorului.

## Interpretarea rezultatelor

[initial.md](initial.md) și [final.md](final.md) permit revizuirea întrebărilor fără add-on. [mapping.json](mapping.json) păstrează identificatorii în ordinea rândurilor; aceștia nu apar în formular.

K1–K6 sunt autoevaluări identice în ambele chestionare. D1–D3 sunt scenarii identice; răspunsul de referință este a doua variantă pentru D1 și D2, respectiv a treia pentru D3. D2 invită la clarificarea comportamentului concurent și repetat, nu presupune o anumită implementare. Nu transformați întrebările în test cu punctaj sau feedback automat. Trei scenarii oferă indicii limitate, nu o măsură completă a competenței.

După prima colectare, sumarizați separat autoevaluările, alegerile la scenarii, prioritățile și dificultățile. Pentru fiecare întrebare raportați numărul de răspunsuri; omisiunile nu sunt răspunsuri greșite. Folosiți distribuțiile pe categorii pentru K1–K6, nu presupuneți intervale egale între trepte. Selectați 2–3 ajustări concrete ale materialelor încă nepublicate: exemple introductive suplimentare, explicații despre contracte, mai multă comparație a soluțiilor sau sprijin pentru unelte. Comunicați studenților ce ați schimbat în urma răspunsurilor.

La final comparați distribuțiile K1–K6, D1–D3 și frecvența utilizării AI (A1), apoi sintetizați exemplele A2/F2 și sugestiile. Comparația este la nivelul cohortei: fără identificatori nu se pot urmări persoane, iar numărul și componența respondenților pot diferi. Repetarea acelorași scenarii și expunerea la curs pot influența răspunsurile; nu atribuiți automat diferențele exclusiv cursului. Păstrați concluziile și schimbările propuse pentru ediția următoare într-un rezumat pentru profesor, fără a publica răspunsuri individuale.
