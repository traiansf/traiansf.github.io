## Paragraful pentru site

**Ce vă garantăm la înscriere**

Înscrierea dumneavoastră este acceptată imediat dacă atelierul are locuri disponibile și nu sunteți deja înscris la el. Locul este rezervat sub un identificator unic al cererii — dacă reîncercați aceeași înscrisoare, veți obține același răspuns fără a pierde locul. După acceptare, o confirmare este trimisă imediat serviciului de poștă. Chiar dacă confirmarea nu ajunge din cauze externe, înscrierea rămâne valabilă și locul vostru este asigurat. Dacă confirmarea se pierde, o puteți solicita din nou la operatorul centrului — nu va fi nevoie să vă înscrieti din nou.

---

## Justificarea tehnică pentru centru

**1. Garantia locului (R3):** Acceptarea depinde de starea registrului la momentul cererii — locul disponibil și participant neînscris. Sistemul consumă un loc exact la acceptare, ceea ce asigură că nu sunt depășite plafoanele.

**2. Confirmarea automată (R4):** Registrul apelează expeditorul imediat după fiecare acceptare. Rezultatul — `trimisă` sau `netrimisă` — este înregistrat fără a anula înscrierea. Aceasta separă locul garantat de livrarea mesajului.

**3. Idempotență la reîncercare (R5):** Identificatorul unic al cererii permite registrului să recunoască reîncercările. Aceeași cerere — același identificator — produce același răspuns, fără consum adițional de locuri. Sistemul nu apelează din nou expeditorul dacă confirmarea anterioară a fost `trimisă`, evitând mesaje duplicate. Dacă a fost `netrimisă`, reîncercarea declanșează din nou apelul expeditorului.

**4. Retrimitere controlată:** Operația `retrimite confirmările()` permite unui operator al centrului să reîncerce confirmări eșuate, fără a modifica înscrierea. Aceasta asigură redresarea după eșecuri temporare de comunicație cu expeditorul.