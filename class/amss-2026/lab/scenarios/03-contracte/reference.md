# Raționament de referință — depozit

Material de pregătire pentru [enunț](scenario.md), construit didactic; nu captură AI.

## Responsabilități

Registrul deține rezervările și stocul fizic și decide operațiile care le modifică. Formularul și importul interpretează intrările și apelează aceleași operații. Disponibilul poate fi calculat din F și suma rezervărilor active; dacă este stocat separat, apare costul sincronizării lui. Nicio alegere de reprezentare nu elimină regulile.

O altă repartizare defensabilă a responsabilităților: o funcție de decizie primește o situație coerentă și propune modificarea, iar un coordonator o aplică integral înaintea următorului apel. Costul: coordonatorul trebuie să păstreze coerența dintre decizie și aplicare. Nu cerem microservicii, tranzacții distribuite sau teoria cursurilor 7–8 (stări, interacțiuni și granițe). „Activă”, „ridicată”, „anulată” sunt valori date în enunț, suficiente pentru condițiile operațiilor.

## Invarianți și contracte

Opțional, pentru verificarea stocului total, notăm cu P suma cantităților din rezervările ridicate; cele anulate nu contribuie la P.

Cantitățile rezervărilor sunt strict pozitive; identificatorii sunt unici. `0 ≤ R ≤ F ≤ 10`, `D = F − R ≥ 0`, `F + P = 10`. Ultima egalitate folosește absența reaprovizionării și retururilor. Istoricul cu cantitățile ridicate permite calcularea lui P. Păstrarea identificatorilor și cantităților de la o stare la alta este o responsabilitate a operațiilor, distinctă de unicitatea verificabilă într-o singură stare.

Precondiții comune: R1 (registru valid, apeluri seriale, cantitate întreagă unde există, identificator nevid). Cantitatea q strict pozitivă, disponibilitatea și identificatorul nefolosit sunt **condiții de succes**, nu precondiții care ar lăsa refuzul nespecificat.

| Operație acceptată | Efect asupra cantităților | Efect asupra registrului |
|---|---|---|
| `rezerva(id,q)` | F' = F; R' = R+q; D' = D−q; P' = P | Adaugă numai rezervarea activă nouă. |
| `ridica(id)` de q | F' = F−q; R' = R−q; D' = D; P' = P+q | Numai rezervarea vizată devine ridicată. |
| `anuleaza(id)` de q | F' = F; R' = R−q; D' = D+q; P' = P | Numai rezervarea vizată devine anulată. |

Spre deosebire de enunțul muzeului, R3–R4 specifică aici și refuzul pentru un identificator necunoscut. Nu importăm precondiția „identificator cunoscut” din curs. Prin istoric înțelegem păstrarea rezervărilor încheiate, cu identificatorul și cantitatea lor; nu cerem un jurnal separat al fiecărui apel.

La orice refuz, F și **întregul registru** se păstrează; în consecință se păstrează și R, D, P. La succes, toate celelalte rezervări sunt identice. Separăm păstrarea identităților/cantităților de actualizarea stării rezervării vizate.

## Rezultatele scenariilor

Toate pornesc din I: F=10, A activă(4), R=4, D=6, P=0.

| Scenariu | Verdict și stare finală |
|---|---|
| S1 | Acceptat; A activă(4), B activă(6); F=10, R=10, D=0, P=0. |
| S2 | Refuz; exact I. |
| S3 | Acceptat; A ridicată(4); F=6, R=0, D=6, P=4. |
| S4 | Acceptat; A anulată(4); F=10, R=0, D=10, P=0. |
| S5 | Ridicare acceptată ca S3; anulare refuzată; rămâne exact starea de după ridicare. |
| S6 | Anulare acceptată ca S4; reutilizarea lui A este refuzată; rămâne exact starea de după anulare. |
| S7 | Refuz; exact I. |

La ridicare, scăderea doar a lui F ar lăsa R=4 și D=2, deși rezervarea nu mai este activă. Scăderea doar a lui R ar crea D=10 fără ca cele patru bucăți ridicate să mai existe fizic. Corecția trebuie să păstreze simultan sensurile și egalitățile.

## Încheiere: verificare nouă

După S1 (A activă 4, B activă 6; F=10, R=10, D=0), anulăm A. Rezultat: A anulată 4, B activă 6; F=10, R=6, D=4. Apoi ridicăm B: F=4, R=0, D=4, P=6; A rămâne anulată. Sunt pași succesivi, diferiți de scenariile care repornesc din I.
