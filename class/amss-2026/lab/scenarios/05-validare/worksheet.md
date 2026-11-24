# Sprijin facultativ pentru discuție — biletele de ordine

Folosiți [enunțul](scenario.md) la lucrul individual și la discuția în plen. Notițele sunt facultative, rămân la voi și nu se predau.

## Proprietăți

Pentru A1 (chemat o dată), A2 (fără blocaj) și A3 (așteptare limitată): ce stare sau execuție ar infirma-o? Ce ar stabili-o?

## Trasări

Pentru fiecare scenariu: la fiecare chemare, notați biletul chemat, biletele care rămân și de câte ori a fost depășit fiecare. Întrebări de verificare: pe cine depășește un bilet chemat? Poate fi depășit un bilet prioritar? Ce își amintește regula „Doi la rând” de la o chemare la alta?

## Ce stabilește o explorare

Scrieți în cuvinte ce am aflat dintr-o explorare fără contraexemplu cu N = 2. Ce nu am aflat? Ce ar trebui să facem pentru orice N?

## Atelierul de diagrame

Realizați diagrama de clase cu interfață a variantei L (registrul numără depășirile și cheamă cel mai vechi bilet când a fost depășit de două ori; altfel întreabă regula de alegere) după [specificație](../../diagrame/clase-interfata.md) și verificați-o punct cu punct. Întrebări de verificare: cine ține depășirile? Ce primește `alege`? Poate o realizare să încalce A3 (așteptare limitată)? Cine fixează realizarea folosită?

## Exercițiu suplimentar, pentru studiu individual

Rulați `python explorare.py` din [model](model/explorare.py), apoi `python explorare.py doi_la_rand 2` și `python explorare.py doi_la_rand 3`. Adăugați o regulă a voastră în dicționarul `REGULI` (de exemplu, un singur prioritar, apoi un obișnuit; o regulă care folosește argumentul `serie` se adaugă și în `CU_SERIE`) și explorați-o cu N = 2, 3, 4. Verificați pas cu pas contraexemplul găsit, dacă există. Scrieți apoi argumentul pentru care registrul cu limită respectă A3 pentru orice N.
