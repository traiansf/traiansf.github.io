# Evaluare: Model de domeniu pentru atelier de reparații

## Observații

### ✓ Afirmații corecte

**Entități și cardinalități**: Propunerea aliniază entitățile și relațiile la context. Exemplu: „Aparat → Vizite: 1 : 0..*" reflectă corect R2 (aparat se poate înregistra fără vizite și poate reveni în mai multe vizite). Interpretarea R4 pentru Voluntar (cod stabil, nume nu e unic) este exactă. Cardinalitățile pentru Vizită → Problemă (1 : 1..*) și Vizită → Voluntar (N : 0..1) sunt susținute explicit de R3 și R4.

**Persistență**: Propunerea explicitează corect R5 — problemele și responsabilii vizitelor anterioare se păstrează, nu se copiază automat, iar noile asocieri voluntar-vizită sunt independente. Exemplul concret (J1 și J2 pentru A17) demonstrează înțelegerea.

---

### ⚠ Alegere prezentată ca cerință

**Identitate compusă pentru Problemă: (cod vizită + ordine)**

*Fragment*: „Problemă raportată — identitate: compusă din (cod vizită + ordine)."

*Observație*: Contextul (R3) stabilește că o problemă „aparține exact unei vizite" și că textul poate coincide între vizite, dar **nu precizează componenta a doua a identității**. Propunerea alege „ordine" (P1, P2, P3 implicite), dar aceasta nu este derivată din context — este o alegere de design rezonabilă. Alte opțiuni ar putea fi un cod de problemă independent (P1, P2, P3 globali) sau un timestamp. Alegerea nu contrazice regula, dar nu este obligatorie din textul dat.

---

### ✓ Interpretări corecte ale R5

Propunerea detalies bine că J1 și J2 sunt perechile distincte voluntar-problemă. Aceasta confirmă că reutilizarea unui voluntar pentru acelaşi aparat nu este presumare: M1 și M2 sunt independenți per vizită.

---

## Concluzie

Modelul este corect și complet față de context. Singura deviație este alegerea componentei „ordine" pentru identitatea problemei, care este rezonabilă dar opțională — merită clarificare dacă ordinea dintr-o vizită este parte a semnificației sau dacă problemele ar putea fi identificate altfel (de ex., prin cod global).