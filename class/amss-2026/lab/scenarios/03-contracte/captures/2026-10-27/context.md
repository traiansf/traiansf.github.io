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
