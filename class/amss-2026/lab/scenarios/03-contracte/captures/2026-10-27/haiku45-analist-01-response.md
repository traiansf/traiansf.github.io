# Analiza responsabilităților, contractelor și invarianților

## Repartizarea responsabilităților

**Registrul** = administrator stării și sursa de adevăr. Este responsabil pentru:
- Validarea precondițiilor la fiecare operație
- Menținerea invarianților (F ≥ 0, R ≤ F, D = F − R ≥ 0)
- Înregistrarea istoricului complet (nici un identificator nu se reutilizează)
- Refuzul atomic: dacă precondițiile nu sunt îndeplinite, nicio modificare

**Formularul și importul** = clienți care apelează operații ale registrului. Aplicând aceleași proceduri, garantează comportament identic.

## Contractele operațiilor

### REZERVA(id, q)

| Aspect | Descriere |
|---|---|
| **Precondiții** | id ≠ 0; id nu apare deja în registru; q > 0; D ≥ q |
| **Succes** | Crează rezervare activă de q bucăți; R ← R+q; D ← D−q; F neschimbat |
| **Refuz** | Orice precondițiune încălcată ⇒ stare neschimbată |
| **Efect** | Id înregistrat permanent; nu se reutilizează |
| **Invarianți** | R ≤ F; D = F − R; fiecare id apare o singură dată |

### RIDICA(id)

| Aspect | Descriere |
|---|---|
| **Precondiții** | id în registru; rezervarea pentru id este activă; (F ≥ q garantat dacă invarianți respectați) |
| **Succes** | Marchează rezervare ca ridicată; F ← F−q; R ← R−q (devine inactiv); D nemodificat (se scade q din ambii termeni) |
| **Refuz** | Id necunoscut sau stare ≠ activă ⇒ nicio modificare |
| **Efect** | Id și cantitate se păstrează în istoric |
| **Invarianți** | R ≤ F; D = F − R; istoric complet |

### ANULEAZA(id)

| Aspect | Descriere |
|---|---|
| **Precondiții** | id în registru; rezervarea pentru id este activă |
| **Succes** | Marchează rezervare ca anulată; R ← R−q; F neschimbat; D ← D+q |
| **Refuz** | Id necunoscut sau stare ≠ activă ⇒ nicio modificare |
| **Efect** | Id și cantitate se păstrează; id nu se reutilizează |
| **Invarianți** | R ≤ F; D = F − R; acces complet la istoric |

## Calculele S2, S3, S5

**Stare inițială I:** F=10; A(activ, 4); R=4; D=6

**S2:** `rezerva(B, 7)` — Precondițiile: B nou ✓, q>0 ✓, dar **D=6 < 7** ✗ → **REFUZ**. Stare: F=10, R=4, D=6 (neschimbată)

**S3:** `ridica(A)` — A activ ✓ → Marcheaza A ridicată; F=10−4=**6**; R=4−4=**0**; D=6 (nemodificat). Stare finală: F=6, R=0, D=6

**S5:** `ridica(A)`, apoi `anuleaza(A)` — După ridica: F=6, A ridicată, R=0. Anuleaza(A): **A nu mai e activ** ✗ → **REFUZ**. Stare finală: F=6, R=0, D=6 (doar ridicata rămâne)

## Comparație: formular vs. import

Ambele canale folosesc aceleași operații și contracte. **Diferența:**
- **Formular:** feedback interactiv; validare înainte de afișare
- **Import:** apeluri secvențiale; validare în registru, refuzuri cumulate

**Avantaj abordării contractuale:** invarianții se mențin indiferent de sursă; o cerere refuzată are același efect (zero modificări) din ambele canale. Verificările nu sunt duplicate — registrul este singurul gatekeeper.