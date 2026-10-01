---
title: "Cursul 2 — Exercițiu pregătit de proiectare și revizuire"
subtitle: "Terminal de bibliotecă: înțelegere înainte de delegare"
author: "AMSS 2026/2027 — exemplu didactic pregătit"
lang: ro-RO
---

# Despre acest exemplu

Acesta este un **exemplu didactic pregătit**, nu un răspuns AI capturat.

Folosiți același enunț și aceleași întrebări ca în demonstrație:

- Ce cerință susține o decizie?
- Ce scenariu o pune la încercare?
- Ce stabilește, de fapt, revizuirea (review)?

::: notes
Variantă de rezervă pentru cadrul didactic. Precizați explicit că aceste materiale au fost create pentru predare. Ele nu documentează comportamentul unui model. Enunț: ../scenarios/01-library-kiosk/brief.md; referință: ../scenarios/01-library-kiosk/reference-design.md.
:::

---

# Partea convenită a sistemului

- Un titlu poate avea mai multe exemplare identificate.
- Un exemplar are cel mult un împrumut activ.
- Returnarea închide împrumutul și păstrează istoricul.
- Solicitările vizează titluri și pot coexista cu împrumuturile.
- Înregistrarea unei solicitări nu blochează împrumutul.

Regulile de alocare și de prioritate în coadă nu sunt incluse.

::: notes
Aceste fapte rezumă R1–R6. Solicitările duplicate pentru aceeași pereche membru/titlu sunt respinse. Exercițiul presupune identificatori cunoscuți și operații procesate pe rând. Păstrați enunțul complet la îndemână, astfel încât rezumatul să nu fie confundat cu totalitatea cerințelor.
:::

---

# Varianta A pregătită: o proiectare de examinat

| Concept | Informații propuse |
|---|---|
| Carte | Identificatorul titlului; stare: disponibilă/împrumutată/solicitată |
| Împrumut | Membru; titlul cărții; stare: activ/închis |
| Solicitare | Membru; titlul cărții |

Împrumutul schimbă starea cărții în „împrumutată”.

O solicitare schimbă aceeași stare în „solicitată”.

::: notes
Aceasta este o variantă intenționat greșită. Nu o prezentați drept rezultat generat. Defectele de investigat sunt absența identității exemplarului și stările mutual exclusive atribuite titlului. Lipsa semnăturilor complete ale metodelor nu este în sine o eroare.
:::

---

# Rândul vostru: construiți un contraexemplu

Titlul T are două exemplare, C1 și C2.

1. M1 împrumută C1.
2. M2 solicită T.
3. M3 împrumută C2.

Toate cele trei operații sunt permise de enunț.

**Poate varianta A să reprezinte rezultatul și să identifice exemplarul fiecărui împrumut?**

::: notes
Alocați două minute. Studenții trebuie să explice că starea de la nivelul titlului suprascrie fapte independente și că un împrumut legat doar de T nu indică dacă a fost împrumutat C1 sau C2. Cereți referiri la R1, R2, R4–R5 și S2.
:::

---

# Diagnosticați înainte de a corecta

Adăugarea indicatorului `has_request` ar separa existența solicitării.

Ar rămâne însă:

- Două exemplare reprezentate ca un singur lucru.
- Lipsa identității exemplarului pentru fiecare împrumut.
- Imposibilitatea de a aplica separat regula împrumutului activ pentru C1 și C2.

Corecția are nevoie de distincția lipsă din domeniu.

::: notes
Un indicator poate rezolva o problemă fără a o rezolva pe alta. Nu predați „indicatorii sunt răi” sau „introduceți întotdeauna un șablon de proiectare”. Explicați ce cerință abordează fiecare schimbare propusă.
:::

---

# O proiectare de referință

| Concept | Rol în proiectare |
|---|---|
| Titlu | Ceea ce solicită un membru |
| Exemplar | Un obiect fizic care aparține unui titlu |
| Împrumut | Împrumutarea unui exemplar de către un membru |
| Solicitare | O pereche membru/titlu |

**Gestionarea împrumuturilor** impune regula împrumutului activ.

**Înregistrarea solicitărilor** păstrează independența solicitărilor față de împrumuturi.

::: notes
Acestea sunt responsabilități conceptuale, nu servicii sau clase obligatorii. Ele pot fi exprimate printr-o reprezentare funcțională, bazată pe obiecte sau relațională.
:::

---

# Verificați rezultatele operațiilor

- Împrumut C1: creează un împrumut activ dacă nu există deja unul.
- Împrumut C1 din nou: respinge; păstrează împrumutul existent.
- Returnare C1: închide împrumutul activ; păstrează istoricul.
- Returnare C1 din nou: respinge; lasă istoricul neschimbat.
- Înregistrarea de două ori a aceleiași solicitări membru/titlu: respinge duplicatul.

Solicitările nu modifică disponibilitatea exemplarelor în această parte a sistemului.

::: notes
Legați fiecare rezultat de R2–R5. Referința completă explică comportamentul din S1–S5. Aceste parcurgeri nu demonstrează că orice cod implementează corect proiectarea.
:::

---

# Revizuire pregătită: două afirmații

**Afirmația A:** „Varianta A nu poate identifica exemplarul returnat când un titlu are mai multe exemplare.”

**Afirmația B:** „Proiectarea de referință este greșită deoarece solicitările nu blochează împrumuturile.”

Care afirmație este susținută de dovezi?

Pentru fiecare, citați o regulă și un scenariu.

::: notes
Ambele afirmații sunt create pentru acest exercițiu. A este susținută de R1–R3 și S1/S4: un împrumut asociat doar titlului pierde identitatea necesară a exemplarului. B contrazice R5 și S2. Nu le acceptați pe amândouă doar fiindcă apar într-o revizuire.
:::

---

# Decideți cum tratați o constatare

| Constatare | Dovezi | Decizie |
|---|---|---|
| Lipsește identitatea exemplarului | R1–R3; S1/S4 | Corectați proiectarea |
| Solicitările trebuie să blocheze împrumuturile | Contrazisă de R5; S2 | Nu o acceptați ca defect |
| Încercări concurente de împrumut | R6 presupune operații pe rând | Consemnați ca extindere |

Agentul de revizuire ajută la examinarea lucrării. Voi evaluați constatarea.

::: notes
Întrebarea despre concurență devine importantă dacă extindem domeniul de lucru. Explicați că delimitarea exemplului nu rezolvă o viitoare implementare concurentă.
:::

---

# Dacă varianta inițială ar fi fost corectă

Am fi întrebat în continuare:

- Ce scenariu arată identitatea independentă a exemplarelor?
- Cine păstrează regula împrumutului activ?
- Ce păstrează returnarea?
- Ce alegeri rămân în afara domeniului de lucru?
- Ce ar schimba rezervările cu exemplare alocate?

Un rezultat corect ne permite să explicăm de ce funcționează.

::: notes
Aceasta este ruta alternativă atunci când agentul din demonstrație produce o proiectare bună. Nu există o cotă de defecte și nu trebuie fabricat un eșec.
:::

---

# Ce ajunge în etapa următoare?

Un pachet compact:

- Enunțul convenit și delimitarea domeniului de lucru.
- Concepte, responsabilități, contracte și comportament.
- Verificări prin scenarii și întrebări deschise.
- Constatările revizuirii și motivele acceptării sau respingerii lor.

Urmează: un plan detaliat pentru această parte, cu limitele păstrate.

::: notes
Reveniți la curs. Fluxul de lucru stabilește o specificație și o proiectare substanțiale înainte de implementare. Predarea sarcinii din demonstrație privește o parte delimitată, nu o aplicație de bibliotecă pregătită pentru producție.
:::
