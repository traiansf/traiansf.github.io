# Verificare propunere — Estimarea costului expedierii

## Afirmații susținute și corecte

Propunerea identifică corect:
- **Trei niveluri de responsabilitate** (interfață, logică estimare, reguli): separarea e validă și reflectă R5 (ambele canale, aceleași reguli).
- **Dependența critică**: formularea că "ambele canale depind de aceeași logică și reguli" este directă din R5.
- **Validarea scenariilor S1–S5**: toate verificările sunt corecte pentru versiunea inițială (S1 și S3, S5a acceptate; S2, S4, S5b refuzate).

## Omisiune relevantă — Schimbarea C1

Propunerea **nu menționa explicit ce se schimbă după C1**. Instrucțiunile de evaluare cer verificarea "ce trebuie să se schimbe în propunere după C1". După schimbarea din C1:

| Scenariu | Versiune inițială | După C1 |
|---|---|---|
| **S2** — 1001g plic | ✗ Refuz (R3: plic ≤1000) | ✓ Acceptare, 18 lei (R3 nou: plic ≤1500; R4: >1000g→18 lei) |

Propunerea ar trebui să precizeze: „S2 devine acceptare la 18 lei după C1, pentru că plic devine acceptat până la 1500g, iar preț rămâne >1000g→18 lei."

## Alegerile prezentate ca cerințe

Propunerea propune **centralizarea regulilor** și critică copierea:
- Enunțul (R5) cere doar că **rezultatul** să fie același în ambele canale, nu **implementarea**. 
- Observația DRY și „dificultate în testare" sunt bune, dar **depășesc sarcina analistului**, care nu cere o soluție de cod sau arhitectură.
- Fraza „regulile și logica estimării trebuie centralizate" e recomandare, nu cerință din enunț.

**Fragmentul**: „Soluție conceptuală: regulile și logica estimării trebuie **centralizate**..."

## Conformitate cu sarcina

Propunerea răspunde sarcinii analistului (responsabilități, dependențe, verificare scenarii), dar:
1. Merge dincolo cu sugestii de implementare (DRY, centralizare).
2. Nu actualizează scenariile pentru C1.
3. Textul e clar și bine structurat (sub 350 cuvinte ✓).

## Recomandare

Propunerea necesită **o adăugare**: clarificare că S2 se transformă în acceptare (18 lei) după C1, și precizarea că „centralizarea" e o observație de design, nu o cerință din sarcină.