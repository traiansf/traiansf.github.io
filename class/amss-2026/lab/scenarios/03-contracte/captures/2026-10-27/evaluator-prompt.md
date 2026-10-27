Ești evaluator (agent AI de revizuire). Verifică propunerea față de enunț și sarcina de analiză. Pentru fiecare observație indică fragmentul, regula relevantă și un scenariu cu starea de pornire și rezultatul așteptat. Verifică responsabilitățile, cantitățile la ridicare, refuzurile, efectul asupra altor rezervări și istoricul. Confirmă și afirmațiile corecte. Nu presupune un număr de greșeli și nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

CONTEXT

# Enunț — rezervarea cantităților într-un depozit

Exemplu didactic pentru Laboratorul 3, după cursurile 5–6. Versiune: 27 octombrie 2026. Discutăm responsabilități, contracte și invarianți. Nu se cere aplicație sau diagramă de stări.

Un operator gestionează rezervările pentru 10 adaptoare identice. Clienții vin să ridice produsele rezervate. Cererile ajung prin formularul operatorului sau prin import; importul apelează aceleași operații pentru fiecare cerere.

## Reguli convenite

- **R1 — context:** un singur produs, 10 bucăți inițial; fără reaprovizionare, retururi sau expediere. Operațiile se desfășoară pe rând; registrul inițial este valid. Cantitățile primite sunt numere întregi; identificatorii rezervărilor sunt nenuli. Excludem erorile tehnice și concurența.
- **R2 — rezervare:** `rezerva(id, q)` acceptă exact când identificatorul nu a mai fost folosit, `q > 0` și există cel puțin q bucăți disponibile. Creează o rezervare activă de q bucăți; acestea devin indisponibile altora, dar rămân fizic în depozit. Altfel: `refuz`, fără nicio modificare.
- **R3 — ridicare:** `ridica(id)` acceptă numai o rezervare activă; ridică **întreaga** ei cantitate, o scade din stocul fizic și marchează rezervarea ca ridicată. Cantitatea disponibilă nu se schimbă. Pentru un identificator necunoscut ori o rezervare deja ridicată/anulată: `refuz`, fără modificări.
- **R4 — anulare:** `anuleaza(id)` acceptă numai o rezervare activă; o marchează anulată și redă întreaga cantitate disponibilului. Stocul fizic nu se schimbă. În celelalte situații: `refuz`, fără modificări.
- **R5 — istoric și efect limitat:** identificatorul și cantitatea fiecărei rezervări se păstrează, inclusiv după ridicare/anulare; identificatorul nu se reutilizează. O operație nu modifică alte rezervări. Formularul operatorului și importul de cereri folosesc aceleași reguli, prin operațiile registrului.

## Sensuri și starea de bază I

**F** = bucăți fizic în depozit; **R** = suma cantităților rezervărilor active; **D = F − R** = bucăți disponibile. O rezervare anulată nu contribuie la R. Prin `ridica(A)` înțelegem ridicarea tuturor produselor rezervate prin A; păstrăm în registru rezervarea, marcată ca ridicată.

**I:** F = 10; rezervarea A este activă pentru 4 bucăți; nicio alta. Deci R = 4, D = 6. I este obținută din registrul gol prin rezervarea a 4 bucăți.

Fiecare scenariu repornește din I, exceptând continuările explicit marcate:

| Scenariu | Acțiune |
|---|---|
| S1 | `rezerva(B, 6)` |
| S2 | `rezerva(B, 7)` |
| S3 | `ridica(A)` |
| S4 | `anuleaza(A)` |
| S5 | `ridica(A)`, apoi `anuleaza(A)` |
| S6 | `anuleaza(A)`, apoi `rezerva(A, 2)` |
| S7 | `rezerva(B, 0)` |

## Întrebările discuției

Cine are dreptul să schimbe registrul? Ce trebuie să promită fiecare operație? Ce rămâne identic la refuz? Ce relații trebuie să respecte toate stările valide? Cum verificăm aceeași cerere venită din formular și din import?

Puteți schița sau nota idei, fără documente de predat. Etapa AI este o singură analiză și o singură revizuire în plen, conduse de profesor; nu sunt necesare conturi AI pentru studenți.

SARCINA ANALISTULUI AI

Propune o repartizare a responsabilităților pentru modificarea registrului și formulează contractele operațiilor rezerva, ridica și anuleaza: precondiții, condiții de succes, efecte, refuzuri și invarianți. Calculează S2, S3 și S5. Compară pe scurt cu verificări separate în formular și import. Nu scrie cod. Răspunde în română, în maximum 450 de cuvinte.

PROPUNERE DE VERIFICAT

# Analiza responsabilităților, contractelor și invarianților

## Repartizarea responsabilităților

**Registrul** = administrator stării și sursa de adevăr. Este responsabil pentru:
- Validarea precondițiilor la fiecare operație
- Menținerea invarianților (F ≥ 0, R ≤ F, D = F − R ≥ 0)
- Înregistrarea istoricului complet (nici un identificator nu se reutilizează)
- Refuzul atomic: dacă precondițiile nu sunt îndeplinite, nicio modificare

**Formularul și importul** = clienți care apelează operații ale registrului. Aplicând aceleași proceduri, garantează comportament identic.

## Contractele operațiilor

### REZERVA(id, q)

| Aspect | Descriere |
|---|---|
| **Precondiții** | id ≠ 0; id nu apare deja în registru; q > 0; D ≥ q |
| **Succes** | Crează rezervare activă de q bucăți; R ← R+q; D ← D−q; F neschimbat |
| **Refuz** | Orice precondițiune încălcată ⇒ stare neschimbată |
| **Efect** | Id înregistrat permanent; nu se reutilizează |
| **Invarianți** | R ≤ F; D = F − R; fiecare id apare o singură dată |

### RIDICA(id)

| Aspect | Descriere |
|---|---|
| **Precondiții** | id în registru; rezervarea pentru id este activă; (F ≥ q garantat dacă invarianți respectați) |
| **Succes** | Marchează rezervare ca ridicată; F ← F−q; R ← R−q (devine inactiv); D nemodificat (se scade q din ambii termeni) |
| **Refuz** | Id necunoscut sau stare ≠ activă ⇒ nicio modificare |
| **Efect** | Id și cantitate se păstrează în istoric |
| **Invarianți** | R ≤ F; D = F − R; istoric complet |

### ANULEAZA(id)

| Aspect | Descriere |
|---|---|
| **Precondiții** | id în registru; rezervarea pentru id este activă |
| **Succes** | Marchează rezervare ca anulată; R ← R−q; F neschimbat; D ← D+q |
| **Refuz** | Id necunoscut sau stare ≠ activă ⇒ nicio modificare |
| **Efect** | Id și cantitate se păstrează; id nu se reutilizează |
| **Invarianți** | R ≤ F; D = F − R; acces complet la istoric |

## Calculele S2, S3, S5

**Stare inițială I:** F=10; A(activ, 4); R=4; D=6

**S2:** `rezerva(B, 7)` — Precondițiile: B nou ✓, q>0 ✓, dar **D=6 < 7** ✗ → **REFUZ**. Stare: F=10, R=4, D=6 (neschimbată)

**S3:** `ridica(A)` — A activ ✓ → Marcheaza A ridicată; F=10−4=**6**; R=4−4=**0**; D=6 (nemodificat). Stare finală: F=6, R=0, D=6

**S5:** `ridica(A)`, apoi `anuleaza(A)` — După ridica: F=6, A ridicată, R=0. Anuleaza(A): **A nu mai e activ** ✗ → **REFUZ**. Stare finală: F=6, R=0, D=6 (doar ridicata rămâne)

## Comparație: formular vs. import

Ambele canale folosesc aceleași operații și contracte. **Diferența:**
- **Formular:** feedback interactiv; validare înainte de afișare
- **Import:** apeluri secvențiale; validare în registru, refuzuri cumulate

**Avantaj abordării contractuale:** invarianții se mențin indiferent de sursă; o cerere refuzată are același efect (zero modificări) din ambele canale. Verificările nu sunt duplicate — registrul este singurul gatekeeper.
