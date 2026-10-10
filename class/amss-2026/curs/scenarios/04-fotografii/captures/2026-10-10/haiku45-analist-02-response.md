# Model de domeniu pentru arhiva fotografică

## Concepte și identități

Modelul se construiește pe două entități cu identitate stabilă:

1. **Fotografie** – identificator immutable (F1, F2) care persistă de-a lungul ciclului vieții unui bun fotografic.
2. **Versiune** – identificator immutable (V1, V2, V3) care marchează o stare a conținutului la un moment dat.

Un atribut modificabil, **Legenda**, aparține numai Fotografiei, nu versiunilor. Legenda se poate schimba fără să afecteze versiunile sau identitatea fotografiei.

## Relații și structură

**Relația fotografie–versiune**: Fiecare Versiune aparține exact unei Fotografii (N:1). Fiecare Fotografie are cel puțin o Versiune (invariant din R2).

**Relația de derivare (sursă)**: Fiecare Versiune are zero sau o Sursă (relație recursivă). Originalul (sursa nulă) este unica Versiune creată la catalogare; pentru fiecare Fotografie există exact un original (R3). O Versiune derivată are o Sursă din aceeași Fotografie (R4).

**Rezultat structural**: Fiecare Fotografie definește o pădure de versiuni cu rădăcina în original. Doi copaci independenți (V3 și V4 din V1) nu sunt definiți; modelul permite orice orice configurație DAG cu original ca sursă indirectă.

## Restricții fundamentale

- **Stabilitate identificatori**: Schimbarea Legendei nu modifică F, V sau relații de derivare.
- **Unicitatea originalului**: Fiecare Fotografie are exact o Versiune fără Sursă.
- **Izolarea versiunilor**: O Versiune nouă nu rescrie existente; editarea creează entitate distinctă.
- **Coerență fotografie**: Sursa unei Versiuni trebuie să aparțină aceleiași Fotografii.

## Explicația scenariilor

**S1** (legenda F1 → „Dimineață"): Legenda este atribut al Fotografiei, separat de Versiuni. F1, V1 rămân nemodificate. ✓

**S2** (V1 → V3): Creez o Versiune nouă V3 cu Sursă=V1, ambele în Fotografia F1. Conținutul lui V1 nu se schimbă. ✓

**S3** (V1 → V4 după S2): Ambele V3 și V4 au Sursă=V1, aparțin lui F1, sunt distincte (identificatori diferiți). Relația recursivă permite multiple derivări din aceeași sursă. ✓

**S4** (V5 pentru F2, Sursă=V1 din F1): Restricția coerență fotografie interzice: V5.fotografie (F2) ≠ V1.fotografie (F1). ✗

## Alegeri de reprezentare vs. cerințe

**Cerință**: O Fotografie are exact un original.
- *Alegere 1*: Flag boolean `esOriginal` pe Versiune.
- *Alegere 2*: Relație dedicată Fotografie→OriginalVersion.
- Ambele satisfac cerința; modelul nu prescrie.

**Cerință**: Legenda se modă fără impact pe versiuni.
- *Alegere*: Legenda e atribut simplu, nu entitate.

**Cerință**: Versiuni derivate formează structuri complexe.
- *Alegere 1*: Sursă ca pointer simplu (V→V).
- *Alegere 2*: Mulțime de derivări (V→{V}).
- Modelul susține ambele; S3 NU cere ordin liniar.

Modelul este independent de persistență (baze de date, fișiere, structuri de date în memorie). Satisface toate regulile fără să prefieze reprezentări concrete.