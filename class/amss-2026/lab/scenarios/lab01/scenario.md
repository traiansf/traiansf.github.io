# Laboratorul 1 — fișă: rezervarea sălilor de studiu din campus

Acesta este un **scenariu didactic pregătit**. Informațiile de mai jos reprezintă cerințele convenite cu beneficiarul pentru exercițiu. Ele descriu un pilot cu limite clare, nu regulile unei universități reale.

## Scopul și informațiile convenite

Studenții trebuie să poată rezerva o sală de studiu din campus și să afle dacă rezervarea a reușit.

| ID | Informație de la beneficiar |
|---|---|
| F1 | Pilotul include sălile **Alder** și **Birch** într-o singură zi viitoare, **D**. Ambele sunt deschise 09:00–17:00, în ora locală a campusului. Toate orele din exemple se referă la D. |
| F2 | Un serviciu al universității furnizează identitatea verificată a studentului. Lista sălilor și programul lor sunt deja configurate. Proiectarea autentificării sau a administrării sălilor nu face parte din sarcină. |
| F3 | O cerere indică exact un student, o sală din listă, o oră de început și una de sfârșit în D. Începutul trebuie să preceadă sfârșitul; intervalul trebuie să se încadreze în program. Pentru acest pilot, aplicați regulile convenite mai jos; nu adăugați restricții de eligibilitate neaprobate. |
| F4 | Două rezervări **confirmate** pentru **aceeași sală** nu se pot suprapune. O rezervare poate începe exact când se termină alta. Rezervările pentru săli diferite nu intră în conflict din punctul de vedere al disponibilității sălii. |
| F5 | Regula F4 se aplică și cererilor simultane. Pentru două cereri altfel valide, suprapuse, pentru o sală liberă, confirmați una și respingeți-o pe cealaltă pentru conflict. Beneficiarul nu a ales care cerere are prioritate. |
| F6 | Înainte de începutul rezervării, titularul ei o poate anula. Anularea reușită eliberează intervalul. Alt student nu o poate anula; o anulare respinsă lasă rezervarea neschimbată. Regulile anulării la ora de început sau după aceasta nu au fost convenite. |
| F7 | O rezervare reușită returnează un cod de rezervare. O cerere respinsă explică ce regulă convenită a împiedicat-o. Nu s-a specificat formatul interfeței sau o limită pentru timpul de răspuns. |
| F8 | Plățile, rezervările recurente, listele de așteptare, administrarea sălilor și notificările sunt excluse din pilot. |

O cerere obișnuită care satisface regulile convenite poate fi confirmată. Cazurile deschise de mai jos necesită o decizie explicită asupra regulilor înainte de a pretinde că proiectarea le acoperă complet.

## Întrebări încă deschise

- **Q1:** poate un student avea rezervări suprapuse în săli diferite? F4 stabilește disponibilitatea sălii, nu această regulă. Folosiți studenți diferiți când testați disponibilitatea a două săli până la rezolvarea Q1.
- **Q2:** ce se întâmplă când titularul încearcă să anuleze la ora de început sau după aceasta?
- **Q3:** ar trebui pilotul să introducă ulterior o durată maximă, un număr maxim de rezervări pe student sau reguli pentru rezervarea în avans? Niciuna nu este convenită acum. O restricție propusă nu trebuie introdusă implicit în regulile actuale de acceptare.

Sunt binevenite și alte întrebări relevante pentru o decizie. Separați întrebările care blochează comportamentul cerut azi de cele despre o extindere ulterioară. Un instrument nu poate juca rolul beneficiarului și nu își poate aproba singur regulile propuse.

## Exemple concrete de investigat

Toate identitățile de mai jos sunt verificate; cererile folosesc sălile din listă în ziua D. **Fiecare scenariu este independent.** S1 și S5 încep fără rezervări. S2–S4 și S6–S8 încep fiecare doar cu rezervarea confirmată a Anei pentru Alder 10:00–11:00 din S1. Ignorați modificările din orice alt scenariu; acțiunile din același scenariu se execută în ordinea precizată.

- **S1:** Ana rezervă Alder 10:00–11:00.
- **S2:** cu S1 confirmat, Ben cere Alder 10:30–11:30.
- **S3:** cu S1 confirmat, Ben cere Alder 11:00–12:00.
- **S4:** cu S1 confirmat, Ben cere Birch 10:30–11:30.
- **S5:** Ana și Ben cer simultan sala liberă Alder 13:00–14:00.
- **S6:** la 09:00, Ana își anulează rezervarea confirmată pentru Alder 10:00–11:00; Ben cere apoi exact acel interval.
- **S7:** la 09:00, Ben încearcă să anuleze rezervarea confirmată a Anei pentru Alder 10:00–11:00.
- **S8:** cu S1 confirmat, Ana cere Birch 10:30–11:30. Ce întrebare trebuie rezolvată înainte de a promite un rezultat?

Pentru fiecare scenariu, precizați rezultatul așteptat sau decizia încă deschisă și citați sursa. Folosiți numărul minim de exemple suplimentare necesare pentru a clarifica o regulă, precum un interval vid sau o cerere în afara programului.

## Sarcina voastră

1. Analizați individual cerințele înainte de a folosi AI. Păstrați notițele.
2. Pregătiți o descriere comună a problemei: concepte, reguli, scenarii de acceptare, informații/ipoteze/întrebări și o sarcină următoare de proiectare cu limite clare.
3. Obțineți o revizuire (review) într-un context separat, cu informațiile-sursă, o versiune fixată a variantei de lucru și criterii explicite.
4. Decideți ce afirmații ale revizuirii sunt susținute; modificați doar unde se justifică și explicați ce rămâne neclarificat.
5. Explicați individual o decizie și răspundeți la cerința nouă anunțată de cadrul didactic, fără AI.

Alegeți o reprezentare care face raționamentul clar. Nu se cere o aplicație executabilă. Folosiți [fișa de lucru](worksheet.md) pentru organizarea rezultatelor. Dacă instrumentele nu sunt disponibile, cadrul didactic va furniza [exemplul pregătit](prepared-fixture.md); notați această proveniență.
