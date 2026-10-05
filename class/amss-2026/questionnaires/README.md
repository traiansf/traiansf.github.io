# Chestionare AMSS 2026/2027

Cele două chestionare sunt pregătite pentru Google Forms, prin import din Google Sheets cu Form Builder. Fișierele sunt destinate profesorului. Formularul inițial a fost creat și publicat în 2026 (diferențele față de aceste fișiere sunt descrise mai jos, în „Formularul inițial publicat”); formularul final nu a fost creat încă. Nu publicați un link de completare până când formularul nu este configurat și verificat.

## Administrare

- **Inițial:** 19 întrebări, aproximativ 10–12 minute, în prima săptămână. Invitați toate grupele, inclusiv studenții care nu participă la Laboratorul 0. Lăsați formularul deschis până după cursul 2 și închideți-l înainte de Laboratorul 1; țineți cont de acest lucru când interpretați răspunsurile.
- **Final:** 18 întrebări, aproximativ 10–12 minute, în ultima săptămână. Invitați din nou întreaga cohortă; lăsați timp pentru completare în intervalul rezervat reflecției, separat de examen și de interviul proiectului.
- Participare voluntară, fără punctaj. Nu cereți nume, e-mail, număr matricol sau echipă. Dezactivați colectarea adreselor de e-mail; verificați setările de acces ale contului instituțional. Nu spuneți că formularul este anonim până nu ați verificat aceste setări.

Titlu inițial: **AMSS — Experiență și așteptări la început de curs**.

Descriere inițială: „Vrem să aflăm ce experiență ai și ce ai vrea să înveți, pentru a adapta exemplele, explicațiile și exercițiile cursului. Completarea este voluntară, durează aproximativ 10–12 minute și nu influențează nota. Nu solicităm date de identificare. Poți omite întrebări. Pentru scenariile scurte, răspunde fără căutări sau AI; «Nu știu încă» ne ajută să planificăm explicațiile.”

Titlu final: **AMSS — Ce ai învățat și ce putem îmbunătăți**.

Descriere finală: „Răspunsurile ne ajută să înțelegem ce ai învățat și cum putem îmbunătăți ediția următoare. Completarea este voluntară, durează aproximativ 10–12 minute și nu influențează nota. Nu solicităm date de identificare. Poți omite întrebări. Răspunde la scenariile scurte fără căutări sau AI; ne interesează cum gândești acum.”

## Import prin Form Builder

1. Într-un Google Sheet nou, importați [initial.csv](initial.csv) sau [final.csv](final.csv) prin **File → Import → Upload**. Folosiți separatorul virgulă și codificarea UTF-8. Puneți fiecare chestionar într-un tab separat.
2. Deschideți add-on-ul **Form Builder for Sheets**, selectați tabul și modelul **Questions and Answers**, fără mod Quiz.
3. Asociați **Questions** cu coloana A, **Desc** cu B, **Type** cu C, **Required** cu D, iar opțiunile cu **E:M**. Prima linie este antet; intervalele de întrebări sunt A2:M20 pentru inițial și A2:M19 pentru final. Folosiți opțiunea de ignorare a antetului sau selectați direct aceste intervale, după cum permite interfața add-on-ului.
4. Previzualizați toate întrebările și importați într-un formular nou. Completați titlul, descrierea și mesajul de confirmare: „Mulțumim! Răspunsurile vor fi analizate împreună pentru îmbunătățirea cursului.”
5. Verificați că toate întrebările sunt opționale, că răspunsurile libere sunt de tip paragraf și că listele cu selecție multiplă sunt de tip checkbox. Pentru întrebările care cer cel mult trei variante, setați manual validarea **Select at most 3**. Nu amestecați ordinea întrebărilor sau a răspunsurilor.
6. Completați o dată formularul de probă, verificați cum apare răspunsul în Sheet și ștergeți-l înainte de a distribui linkul pe Teams. Verificați și că un student, fără drepturi de editare, poate deschide formularul.

Structura și tipurile `MULTIPLE_CHOICE`, `CHECKBOX`, `PARAGRAPH`, cu `Required=FALSE`, urmează [documentația oficială Form Builder](https://sites.google.com/jivrus.com/f-builder/docs/formatting/google-sheets). Conversia CSV în Google Sheets este descrisă în [FAQ-ul producătorului](https://sites.google.com/jivrus.com/f-builder/support/faq). La formularul inițial, importul a lăsat formularul în modul Quiz și fără limita de trei variante; la formularul final, verificați explicit ambele setări după import.

## Interpretarea rezultatelor

[initial.md](initial.md) și [final.md](final.md) permit revizuirea întrebărilor fără add-on. [mapping.json](mapping.json) păstrează identificatorii în ordinea rândurilor; aceștia nu apar în formular.

K1–K6 sunt autoevaluări identice în ambele chestionare. D1–D3 sunt scenarii identice; răspunsul de referință este a doua variantă pentru D1 și D2, respectiv a treia pentru D3. D2 cere clarificarea comportamentului la cereri concurente și repetate; nu presupune o anumită implementare. Nu transformați întrebările în test cu punctaj sau feedback automat. Trei scenarii dau doar indicii, nu o măsură completă a competenței.

După prima colectare, rezumați separat autoevaluările, alegerile la scenarii, prioritățile și dificultățile. Pentru fiecare întrebare indicați numărul de răspunsuri; omisiunile nu sunt răspunsuri greșite. Folosiți distribuțiile pe categorii pentru K1–K6, nu presupuneți intervale egale între trepte. Alegeți 2–3 ajustări concrete pentru materialele încă nepublicate: mai multe exemple introductive, explicații despre contracte, mai multe comparații între soluții sau sprijin pentru unelte. Spuneți-le studenților ce ați schimbat în urma răspunsurilor.

La final comparați distribuțiile K1–K6, D1–D3 și frecvența utilizării AI (A1), apoi sintetizați exemplele A2/F2 și sugestiile. Comparația este la nivelul cohortei: fără identificatori nu se pot urmări persoane, iar numărul și componența respondenților pot diferi. Răspunsurile pot fi influențate atât de curs, cât și de faptul că scenariile se repetă; nu puneți automat diferențele doar pe seama cursului. Concluziile și schimbările propuse pentru ediția următoare se trec într-un rezumat pentru profesor; răspunsurile individuale nu se publică.

## Rezumatul automat al răspunsurilor

Exportați răspunsurile din foaia formularului (**File → Download → CSV**) într-un director din afara repository-ului; exportul brut nu se adaugă în repository și nu se publică. Apoi rulați:

```
python3 questionnaires/sumar.py initial <export.csv>
python3 questionnaires/sumar.py final <export.csv>
```

Scriptul potrivește coloanele după textul întrebărilor și afișează, în Markdown, numărul de răspunsuri și distribuțiile pe categorii, cu răspunsul de referință marcat la D1–D3 și mediana treptelor la K1–K6. Nu afișează răspunsurile libere; acelea se citesc separat și se rezumă pe teme, fără citate și fără detalii care ar putea identifica un student.

## Formularul inițial publicat: diferențe față de aceste fișiere

Verificat pe exportul din 4 octombrie 2026:

- Treapta a patra a scalei K1–K6 apare în formular ca „Pot realiza independent pe o problemă mică” (la K3: „Mă descurc independent pentru o problemă mică”), nu ca în `initial.csv`. Scriptul numără aceste variante la aceeași treaptă. Formularul final păstrează etichetele din `final.csv`; comparația dintre chestionare se face după poziția opțiunii pe scală, nu după text.
- Limita „cel mult trei variante” nu a fost aplicată în formular la T1 și T3; unii respondenți au ales mai multe. La formularul final, setați validarea **Select at most 3** și verificați-o.
- Exportul conține o coloană „Scor”, goală: formularul pare creat în modul Quiz. Verificați că modul este dezactivat sau că studenții nu văd un punctaj ori „răspunsuri corecte”.
