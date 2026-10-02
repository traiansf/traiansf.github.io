# Demonstrație pentru Cursul 2 — Înțelegere înainte de delegare

Ghid pentru cadrul didactic; nu este o prezentare. Alocați aproximativ 15–18 minute secvenței demonstrative, inclusiv raționamentului studenților. Folosiți orice asistent accesibil și un context separat pentru revizuire (review). Nu sunt necesari furnizori diferiți sau agenți care rulează simultan.

## Obiectiv didactic

Studenții explică de ce contează o distincție sau o regulă a domeniului, îi dau unui agent o sarcină delimitată de proiectare și evaluează o afirmație din revizuire pe baza acelorași fapte din enunț. Demonstrația își atinge scopul atât când agentul oferă un răspuns corect, cât și când oferă unul cu defecte.

La curs, studenții au formulat deja întrebări și au primit clarificările despre bibliotecă. Demonstrația nu îi cere agentului să inventeze răspunsurile beneficiarului.

## Materiale și pregătire

- Sursa pentru studenți: [enunțul bibliotecii](scenarios/01-library-kiosk/brief.md).
- Referința pentru cadrul didactic: [o proiectare argumentată](scenarios/01-library-kiosk/reference-design.md).
- Varianta de rezervă pregătită: [sursa prezentării de rezervă](fallback/01-intro-fallback.md), generată ca `fallback/01-intro-fallback.html` / `.pdf`.
- Diapozitivul „Demonstrație: delegăm o sarcină delimitată” din curs.

Folosiți un spațiu de lucru temporar care conține enunțul sau atașați/lipiți enunțul în asistentul ales. Nu includeți răspunsul de referință în contextul inițial al agentului. Pregătiți o a doua conversație, nouă, pentru revizuire. Nu afișați informații private ale contului.

Înainte de curs, încercați prompturile cu instrumentul disponibil pentru a estima durata. Dacă salvați un răspuns real, precizați instrumentul/modelul, data, promptul și setările relevante. Varianta de rezervă din depozit este un exemplu creat pentru predare și nu trebuie descrisă niciodată drept o captură a unei rulări.

## 1. Cereți studenților să anticipeze distincțiile necesare (2 minute)

Înainte de a trimite promptul, întrebați:

> „Ce trebuie să păstreze răspunsul, chiar dacă agentul alege alte denumiri sau o altă reprezentare?”

Urmăriți distincția titlu–exemplar, membrul și exemplarul asociate unui împrumut, cel mult un împrumut activ pentru fiecare exemplar și coexistența unei solicitări pentru titlu cu împrumuturile. Invitați un student să indice regula care îi susține răspunsul.

## 2. Prompt pentru analist/proiectant (3–4 minute, inclusiv lectura)

Furnizați enunțul complet, cu clarificări, apoi folosiți:

> Acționează ca analist și proiectant. Citește enunțul bibliotecii, inclusiv R1–R6 și S1–S5. Produce un document compact de proiectare pentru această parte delimitată a sistemului, nu o aplicație.
>
> Identifică conceptele și distincțiile relevante ale domeniului; atribuie responsabilitățile pentru cele trei operații; enunță invariantul împrumutului activ și rezultatele în caz de succes/respingere; parcurge scenariile furnizate folosind proiectarea ta. Citează identificatorii regulilor care susțin deciziile cu consecințe importante.
>
> Separă cerințele confirmate, alegerile de proiectare și întrebările deschise. Respectă excluderile precizate. Folosește proză, tabele sau pseudocod scurt; folosește o diagramă numai dacă aceasta clarifică un aspect. Păstrează rezultatul suficient de scurt pentru a putea fi examinat la curs. Încheie precizând ce este pregătit pentru etapa următoare și ce nu este acoperit de această afirmație.

Pentru un asistent care lucrează cu fișiere, cereți `design-brief.md` în spațiul demonstrației. Pentru un asistent conversațional, folosiți răspunsul său ca document de lucru. Niciuna dintre variante nu impune un instrument pentru întregul curs.

În timpul generării, cereți studenților să anticipeze starea de după S2. Dacă răspunsul nu este disponibil după aproximativ 45 de secunde sau este prea lung pentru a fi examinat în timpul alocat, treceți la exemplul pregătit. Nu sacrificați discuția pentru a aștepta instrumentul.

## 3. Examinați proiectarea, dincolo de prezentare (3 minute)

Arătați o decizie despre concepte, un contract și un scenariu.

| Întrebare | Unde verificăm |
|---|---|
| Este clar dacă „o carte” desemnează un titlu sau un exemplar? | R1 și S1 |
| Pot coexista două exemplare împrumutate independent și o solicitare pentru titlu? | R2, R4–R5 și S2 |
| Cine impune regula împrumutului activ? | Atribuirea responsabilităților și R2 |
| Lasă o încercare respinsă de împrumut împrumutul existent neschimbat? | R2 și S3 |
| Păstrează returnarea istoricul? | R3 și S4 |
| Sunt inventate reguli de coadă/alocare sau de concurență? | Limita stabilită prin R6 |

Alegeți întrebările cu consecințe importante care se potrivesc răspunsului primit. Nu considerați defecte denumirile alternative, o altă descompunere sau o reprezentare opțională.

**Dacă răspunsul este corect:** cereți unui student să justifice S2 folosind documentul, apoi întrebați ce se schimbă dacă beneficiarul dorește ulterior rezervări cu exemplare alocate. Identificați noua decizie fără a o implementa. Nu trebuie să forțați un eșec al unui răspuns corect.

**Dacă există un defect semnificativ:** cereți studenților scenariul care îl evidențiază. Formulați o corecție punctuală susținută de enunț, apoi verificați din nou regula afectată și încă un scenariu.

**Dacă există o alegere de proiectare nerezolvată:** comparați alternative plauzibile și identificați informațiile care ar ajuta la alegerea uneia. Nu inventați o regulă a beneficiarului doar pentru a închide discuția.

## 4. Predarea sarcinii și a contextului către un agent de revizuire (handoff) (3–4 minute)

Deschideți contextul separat. Furnizați enunțul original și documentul de proiectare; nu presupuneți că prima conversație este vizibilă.

> Acționează ca agent de revizuire. Evaluează proiectarea propusă pentru bibliotecă în raport cu R1–R6 și S1–S5 furnizate. Nu modifica proiectarea.
>
> Verifică distincțiile din domeniu, responsabilitatea pentru regula împrumutului activ, rezultatele operațiilor, consistența cu scenariile și afirmația că proiectarea este pregătită pentru etapa următoare.
>
> Pentru fiecare constatare semnificativă, identifică regula din enunț, afirmația relevantă din proiectare și un contraexemplu concret sau altă justificare verificabilă. Distinge un defect de o alternativă opțională de proiectare și de o întrebare despre o extindere viitoare. Dacă nu găsești niciun defect semnificativ, precizează ce ai verificat și ce nu stabilește revizuirea. Nu adăuga cerințe excluse prin R6.

Contextul nou poate folosi același model. Explicați că separarea face explicită predarea sarcinii și a contextului; nu garantează o revizuire imparțială sau corectă.

## 5. Omul decide ce stabilește revizuirea (2–3 minute)

Alegeți o constatare din răspunsul primit. Cereți studenților să o clasifice ca:

- defect susținut de enunț;
- alternativă rezonabilă ale cărei avantaje și dezavantaje trebuie cântărite;
- afirmație nesusținută; sau
- întrebare din afara domeniului de lucru actual.

Cereți regula și scenariul relevante.

Dacă revizuirea nu oferă o afirmație potrivită pentru discuție, folosiți următorul exercițiu, precizând că este pregătit:

> „Un titlu cu o solicitare activă nu trebuie să poată fi împrumutat.”

Potrivit R5, această afirmație nu susține existența unui defect. O regulă de alocare propusă pentru viitor este o discuție separată. Nu atribuiți această propoziție pregătită agentului de revizuire folosit în demonstrație.

Consemnați pe scurt decizia:

| Afirmație | Ce am verificat | Decizie |
|---|---|---|
| O solicitare ar trebui să blocheze împrumutul | R5 și S2 precizează coexistența | Nu este acceptată ca defect; doar o posibilă regulă viitoare |

Folosiți în schimb o constatare reală, susținută de enunț, dacă apare. Nu există un număr obligatoriu de defecte.

## 6. Încheierea predării sarcinii (1 minut)

Întrebați:

> „Ce poate face acum următorul agent și ce nu ar trebui să presupună?”

Răspuns așteptat: să elaboreze un plan detaliat pentru partea specificată, folosind conceptele, responsabilitățile, contractele operațiilor și scenariile convenite; să nu considere rezolvate alocarea, concurența, autentificarea sau punerea în producție.

Un rezumat scurt trebuie să trimită la regulile din enunț și la detaliile proiectării. Cereți unui student să urmărească o afirmație din rezumat până la acele surse.

Reveniți la diapozitivele „Verificăm și revizuirea” și „Păstrăm o imagine de ansamblu verificabilă” din curs. Folosiți-le pentru recapitulare; nu repetați întregul exercițiu.

## Varianta de rezervă pregătită

Deschideți prezentarea de rezervă și spuneți:

> „Acesta este un exemplu pregătit pentru predare. Ne permite să exersăm același raționament fără să așteptăm generarea în direct.”

Prezentarea conține o proiectare intenționat incompletă, un contraexemplu, o corecție de referință, o constatare de revizuire susținută de enunț și una nesusținută. Studenții efectuează aceleași verificări pe baza regulilor și scenariilor. Referința pregătită este o soluție acceptabilă, nu un model obligatoriu de obiecte.

## Gestionarea abaterilor frecvente

- **Agentul pune o întrebare legitimă:** răspundeți numai pe baza enunțului. Dacă decizia cerută este în afara domeniului de lucru, consemnați-o pentru o etapă ulterioară. Dacă enunțul omite într-adevăr o regulă necesară din domeniul de lucru, recunoașteți lipsa și furnizați explicit o ipoteză didactică.
- **Agentul scrie codul aplicației:** opriți această direcție și reiterați că rezultatul cerut se limitează la proiectare. Nu consumați timpul cursului evaluând o implementare care nu a fost cerută.
- **Agentul recomandă un anumit framework sau tipar de proiectare:** întrebați ce cerință sau variație îl justifică. Păstrați-l numai dacă beneficiul poate fi explicat.
- **Studenții resping o proiectare pentru că nu are diagramă:** întrebați la ce întrebare nu pot răspunde. Adăugați o reprezentare doar pentru a clarifica acea întrebare.
- **Agentul de revizuire inventează cerințe de producție:** distingeți o cerință reală de extindere de un defect al exercițiului delimitat.
- **Toate rezultatele generate sunt corecte:** cereți studenților să explice ce susține afirmația și care îi sunt limitele. Aceasta este o delegare reușită.

## Listă de verificare pentru repetiție

- R1–R6 și S1–S5 sunt vizibile pentru ambele roluri.
- Proiectarea de referință nu se află în contextul inițial al proiectantului.
- Enunțul, detaliile selectate din proiectare și constatările revizuirii încap pe ecran.
- Varianta de rezervă este disponibilă local și etichetată clar ca exemplu pregătit.
- Codul QR Teams și codul echipei rămân pe diapozitivul de bun venit al cursului.
- Demonstrația se încheie cu o decizie de proiectare care poate fi examinată, nu doar cu acceptarea verdictului unui agent.
