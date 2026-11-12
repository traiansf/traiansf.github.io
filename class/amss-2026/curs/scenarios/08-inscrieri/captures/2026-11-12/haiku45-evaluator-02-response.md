# Evaluare propunere — Tabelul interacțiunii pentru `inscrie`

## Afirmații corecte confirmate

**Ordinea pașilor este logică și consistentă cu regulile.**
- Pasul 2 (verificare c) și Pasul 3 (verificare eligibilitate) separă corect identificarea reîncercării de validarea condiției R3.
- Pasul 4 respectă R4: *după* o acceptare (înregistrare), registrul apelează expeditorul; eșecul confirmării nu anulează înscrierea. ✓
- Pasul 5 implementează R5: reîncercarea cu c cunoscut returnează `acceptat` fără loc suplimentar; reapelează expeditorul doar dacă stare = `netrimisă`. ✓
- Pasul 6 (refuz) nu apelează expeditorul, conform R3. ✓

**Repartizarea responsabilităților este clară și completă.** Site generează c unic, registrul memorizează și verifică, expeditor răspunde la apel. ✓

**Scenariile S1–S6 sunt corect verificate:** consumul de locuri, înregistrările și stările de confirmare urmează regulile în fiecare caz. ✓

---

## Observații critice

### 1. Protecție ne-modelată în Pasul 5
Propunerea adaugă: *Dacă (p, a) ≠ (p', a') → Pasul 6 (refuz pentru protecție)*.

**Problemă:** Enunțul (R2, R5) nu modelează cazul în care site-ul trimite identificatorul c cu alte valori (p, a) decât original. R2 spune că c este unic „pentru fiecare încercare nouă a participantului", dar nu defineşte ce se întâmplă dacă site-ul refolosește c cu alt (p, a).

**Implicații:** 
- Propunerea **presupune** că acesta este o greşeală de site care trebuie refuzată.
- Enunțul ar fi trebuit să spună explicit: „c se refolosește doar pentru reîncercări ale aceleiași (p, a)", sau „dacă c este reasociat cu (p', a') diferit, registrul refuzează".
- Fără această clarificare, protecția e rezonabilă dar **depășeşte specificația**.

### 2. Redundanță minoră în Pasul 3
Pasul 3 verifică „c nu a fost înregistrat anterior", deşi Pasul 2 deja determină că c este necunoscut. Verificarea nu este greşită, ci o confirmație în context — acceptabil, dar inutilă din punct de vedere logic.

### 3. Interpretare a „poate" din R5
R5 zice: „Dacă confirmarea ... este `netrimisă`, registrul **poate** cere din nou". Propunerea interpretează aceasta ca o comportare deterministă (registrul *va* reapela). 

**Precizare:** Propunerea oferă o semantică concretă ("va"), care simplifica implementarea. Enunțul permite discreție, dar propunerea e o opțiune validă și rezonabilă.

---

## Concluzie

Propunerea e **în esență corectă** și acoperă toate scenariile. Singura abatere de la enunț este protecția în Pasul 5 pentru cazul (p, a) ≠ (p', a'), care e **plauzibilă dar non-specificată**. Dacă această situație nu face parte din scopul sistemului, protecția poate fi eliminată cu menționarea că site-ul responsabil nu va refolosii c cu alte (p, a).