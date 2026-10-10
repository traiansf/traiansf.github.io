# Sesizări despre defecțiuni în campus — enunț consolidat

Material pentru pregătirea Cursului 3. Scenariu didactic redactat pentru curs; administrația și răspunsurile sale sunt fictive. În sală, prezentarea principală include toate datele necesare și dezvăluie răspunsurile progresiv.

## Cererea inițială

> „Acum primim sesizări despre defecțiuni prin mesaje și telefon. Studenții revin să întrebe dacă s-a făcut ceva. Vrem să poată raporta o problemă și să-i vadă rapid starea.”

Problema urmărită: studentul nu poate afla starea sesizării fără să întrebe din nou. Obiectivul versiunii: înregistrarea sesizării și consultarea stării înregistrate de administrație. Nu promitem reducerea timpului de reparație.

## Limite și reguli convenite în scenariu

Identitatea și rolul utilizatorului sunt deja cunoscute. Rolurile sunt student și personal al administrației. Exemplele de actualizare pornesc din stările indicate și nu analizează concurența actualizărilor. Încărcarea Q1 privește consultări.

- **R1 — Înregistrare:** studentul identificat trimite locul și o descriere nevidă a defecțiunii. La acceptare, sistemul creează o sesizare cu număr unic, autorul respectiv și starea „înregistrată”; afișează numărul și starea. Dacă lipsește locul sau descrierea, indică informația lipsă și nu creează sesizarea. Nu impunem un format al numărului sau o numerotare consecutivă. Nu dezvoltăm validarea avansată a câmpurilor în acest exercițiu.
- **R2 — Acces:** studentul poate consulta numai propriile sesizări și nu le schimbă starea. Administrația poate consulta toate sesizările și actualiza starea conform R4.
- **R3 — Sesizări repetate:** fiecare sesizare se păstrează separat, chiar dacă descrie aceeași defecțiune. Nu se reunesc și nu se resping automat sesizările repetate. O sesizare nouă nu modifică autorul, identificatorul sau starea uneia existente. Administrația actualizează separat sesizările, chiar dacă privesc aceeași intervenție.
- **R4 — Stare:** numai administrația poate schimba „înregistrată” în „în lucru”, apoi „în lucru” în „rezolvată”. Orice altă cerere de schimbare este respinsă, cu motiv și fără modificarea stării. Inclusiv repetarea stării curente este respinsă. „Rezolvată” consemnează declarația administrației că reparația este încheiată; sistemul nu constată fizic reparația.
- **Q1 — Timpul de consultare:** măsurăm de la acțiunea de consultare în browser la afișarea stării. În rețeaua campusului, cu 10.000 de sesizări existente și 20 de consultări simultane, cel puțin 950 dintr-un lot de 1.000 de consultări valide ale propriilor sesizări afișează starea corectă în cel mult 2 secunde. Valorile sunt convenite pentru exercițiu, nu provin din măsurători sau din cererea inițială. Toate consultările rămân supuse cerințelor funcționale și de acces; pragul nu permite rezultate incorecte pentru celelalte 50. Un protocol executabil ar mai fixa dispozitivele, browserul, profilul cererilor, setul de date și condițiile rețelei; acestea nu au fost stabilite sau executate aici.

Sunt excluse: autentificarea, fotografiile, notificările, prioritizarea, repartizarea echipelor, termenele de reparație și redeschiderea. Cererea ulterioară de redeschidere este o propunere de schimbare care nu modifică regulile până la clarificare și acceptare.

## Situațiile discutate

Fiecare situație sau ramură pornește independent de la starea indicată; nu înlănțuim automat rândurile.

1. **Politica sesizărilor repetate:** Ana și Bogdan raportează același robinet din A12. Înainte de comunicarea R3, comparăm păstrarea separată cu asocierea lui Bogdan la sesizarea Anei. R3 stabilește prima variantă.
2. **Actualizare:** S41, a Anei, este „înregistrată”. Separat: Daria din administrație cere „în lucru”; Ana cere „în lucru”; Daria cere direct „rezolvată”.
3. **O nouă sesizare:** S41, a Anei, este „în lucru”. Bogdan raportează valid același robinet. Verificăm noua sesizare și păstrarea lui S41.
4. **Calitate:** în condițiile Q1, lotul A are 950 de consultări reușite la timp și 50 corecte în 3 secunde; lotul B are 949 la timp și 51 corecte în 3 secunde. Loturile sunt date didactice independente, nu măsurători executate.
5. **Schimbare propusă:** „Uneori reparația nu ține. Studentul ar trebui să poată redeschide sesizarea.” Drepturile, intervalul permis și starea rezultată rămân de clarificat.

Exercițiul final folosește separat înscrierea la consultații, cu toate datele pe slide; nu face parte din acest sistem.
