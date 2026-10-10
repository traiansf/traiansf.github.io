Analizează regulile pilotului. Propune o descriere concisă a conceptelor și explică rezultatele S2, S3, S5 și S8. Distinge regulile convenite de întrebările deschise. Nu scrie cod și nu decide în numele beneficiarului. Răspunde în română, în maximum 350 de cuvinte.

CONTEXТ

# Laboratorul 1 — fișă: programarea mașinilor de spălat din cămin

Acesta este un **scenariu didactic pregătit**. Informațiile de mai jos sunt cerințele convenite cu beneficiarul pentru exercițiu. Ele descriu un pilot cu limite clare, nu regulile unui cămin real.

## Scopul și informațiile convenite

Locatarii căminului trebuie să își poată programa o mașină de spălat din spălătoria comună și să afle dacă programarea a reușit.

| ID | Informație de la beneficiar |
|---|---|
| F1 | Pilotul include mașinile **Albastra** și **Verdea** din spălătoria căminului, într-o singură zi viitoare, **D**. Spălătoria este deschisă 08:00–22:00, în ora locală. Toate orele din exemple se referă la D. |
| F2 | Identitatea verificată a locatarului vine de la serviciul de cazare al căminului. Lista mașinilor și programul spălătoriei sunt deja configurate. Proiectarea autentificării sau a administrării mașinilor nu face parte din sarcină. |
| F3 | O cerere indică exact un locatar, o mașină din listă, o oră de început și una de sfârșit în D. Începutul trebuie să preceadă sfârșitul; intervalul trebuie să se încadreze în program. Pentru acest pilot, aplicați regulile convenite mai jos; nu adăugați restricții de eligibilitate neconvenite. |
| F4 | Două programări **confirmate** pentru **aceeași mașină** nu se pot suprapune. O programare poate începe exact când se termină alta. Programările pentru mașini diferite nu intră în conflict din punctul de vedere al disponibilității mașinii. |
| F5 | Regula F4 se aplică și cererilor simultane. Dacă două cereri altfel valide se suprapun și privesc aceeași mașină liberă, confirmați una și respingeți-o pe cealaltă pentru conflict. Beneficiarul nu a ales care cerere are prioritate. |
| F6 | Înainte de începutul programării, titularul ei o poate anula. Anularea reușită eliberează intervalul. Alt locatar nu o poate anula; o anulare respinsă lasă programarea neschimbată. Regulile anulării la ora de început sau după aceasta nu au fost convenite. |
| F7 | La o programare reușită se returnează un cod de programare. Răspunsul la o cerere respinsă explică ce regulă convenită a împiedicat-o. Nu s-au specificat nici formatul interfeței, nici o limită pentru timpul de răspuns. |
| F8 | Plățile, programările recurente, listele de așteptare, administrarea mașinilor, semnalarea defecțiunilor și notificările sunt excluse din pilot. |

O cerere obișnuită care satisface regulile convenite poate fi confirmată. Pentru cazurile deschise de mai jos, regulile trebuie decise explicit înainte de a afirma că proiectarea le acoperă complet.

## Întrebări încă deschise

- **Q1:** poate un locatar avea programări suprapuse pe mașini diferite? F4 privește disponibilitatea mașinii, nu această regulă. Până la rezolvarea Q1, folosiți locatari diferiți când testați disponibilitatea a două mașini.
- **Q2:** ce se întâmplă când titularul încearcă să anuleze la ora de început sau după aceasta?
- **Q3:** ar trebui pilotul să introducă ulterior o durată maximă, un număr maxim de programări pe locatar sau reguli pentru programarea în avans? Niciuna nu este convenită acum. O restricție propusă nu trebuie introdusă implicit în regulile actuale de acceptare.

Sunt binevenite și alte întrebări de care depinde o decizie. Separați întrebările care blochează comportamentul cerut azi de cele despre o extindere ulterioară. Un instrument nu poate juca rolul beneficiarului și nu își poate confirma singur regulile propuse.

## Exemple concrete de investigat

Toate identitățile de mai jos sunt verificate; cererile folosesc mașinile din listă în ziua D. **Fiecare scenariu este independent.** S1 și S5 încep fără programări. S2–S4 și S6–S8 încep fiecare doar cu programarea confirmată a Ioanei pentru Albastra 10:00–11:00 din S1. Ignorați modificările din orice alt scenariu; acțiunile din același scenariu se execută în ordinea precizată.

- **S1:** Ioana programează Albastra 10:00–11:00.
- **S2:** cu S1 confirmat, Radu cere Albastra 10:30–11:30.
- **S3:** cu S1 confirmat, Radu cere Albastra 11:00–12:00.
- **S4:** cu S1 confirmat, Radu cere Verdea 10:30–11:30.
- **S5:** Ioana și Radu cer simultan mașina liberă Albastra 13:00–14:00.
- **S6:** la 09:00, Ioana își anulează programarea confirmată pentru Albastra 10:00–11:00; Radu cere apoi exact acel interval.
- **S7:** la 09:00, Radu încearcă să anuleze programarea confirmată a Ioanei pentru Albastra 10:00–11:00.
- **S8:** cu S1 confirmat, Ioana cere Verdea 10:30–11:30. Ce întrebare trebuie rezolvată înainte de a promite un rezultat?

Pentru fiecare scenariu, precizați rezultatul așteptat sau decizia încă deschisă și citați sursa. Adăugați doar atâtea exemple suplimentare câte sunt necesare pentru a clarifica o regulă, de pildă un interval vid sau o cerere în afara programului.

## Cinci tipuri de afirmații

Folosiți aceleași cinci tipuri ca în cursul 2:

- **informație convenită:** dată sau confirmată de beneficiar (F1–F8);
- **consecință dedusă:** rezultă din informațiile convenite;
- **ipoteză:** răspuns provizoriu la o întrebare deschisă, etichetat ca atare, cu consecințele lui;
- **întrebare deschisă:** decizie pe care trebuie să o ia beneficiarul (de exemplu Q1–Q3);
- **propunere de proiectare:** o soluție aleasă de voi, care trebuie justificată.

