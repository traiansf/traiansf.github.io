# Evaluare propunere

## Ce propunerea validează corect

Propunerea structurează bine cele trei niveluri (interfață, logică, reguli) și validează scenariile S1–S5 contra regulilor R2–R4. Calculele sunt corecte; de exemplu, S2 și S4 sunt refuzate pentru motivele potrivite.

## Depășiri ale sarcinii analistului

Propunerea propune o arhitectură (centralizare, invocări) care merge dincolo de sarcină. Sarcina cere analiza responsabilităților și comparația cu regulile copiate, nu o soluție de design. Recomandarea este utilă, dar nu e cerută și nici nu adresează cum sistemul funcționează dacă regulile sunt copiate (ceea ce pare să fie premisa enunțului).

## Omisiuni în validare

1. **R5–R6 nu sunt verificate.** R5 cere comportament identic în ambele canale pentru aceeași intrare; propunerea nu demonstrează cum se onorează aceasta dacă regulile sunt separate. R6 (prioritatea motivelor de refuz nu e stabilită) nu se reflectă în scenarii; de exemplu, S4 (masa 0 g, cutie) ar putea fi refuzat pentru masă sau pentru tip ambalaj—propunerea nu discută aceasta.

2. **Interpretarea "copiate" vs "invocate".** Enunțul spune "aceleași reguli", nu neapărat că trebuie copiate textual. Propunerea le prezintă ca problemă, dar sarcina analistului pare să accepte copierea ca premisă ("Compară o operație comună cu regulile copiate").

## Omisiune critică: schimbarea C1

**Propunerea nu adresează cum se schimbă după C1.** Cerința evaluării este "verifică și ce trebuie să se schimbe în propunere după C1". 

După C1 (plic acceptat până la 1500 g, preț ≥1000 g rămâne 18 lei):
- S1 rămâne ✓
- **S2 devine ✓ (1001 g plic → acceptat, 18 lei, nu refuz)**
- S3 rămâne ✓
- S4 rămâne ✗
- S5 rămâne ✓

Propunerea trebuie să arate explicit această evoluție și cum R3 (redefinit) afectează validarea. Lipsa acestei analize face propunerea incompletă pentru evaluare.

## Recomandare

Propunerea are nucleul corect (trei niveluri, scenarii validate), dar trebuie:
1. Reducă recomandările arhitecturale; focalizează-se pe responsabilități și dependențe existente.
2. Evidențieze R5–R6 și implicațiile lor.
3. **Arate explicit cum scenariile se schimbă după C1 și ce trebuie actualizat în propunere.**