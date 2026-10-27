# Contractele pentru `atribuie` și `elibereaza`

## **Precondițiile asumate (R1)**
- Identificatorii vizitatorilor și dulapurilor sunt valizi și cunoscuți
- Registrul inițial este valid (respectă R2: relație injectivă)
- Operațiile se desfășoară secvențial, pornind din stare coerentă

---

## **Operația `atribuie(v, d)`**

### Condiție de succes
- Vizitatorul `v` **nu are dulap alocat**  
- Dulapul `d` **este liber** (nealocate niciunui vizitator)

### Postcondiție la succes (returnează `atribuit`)
- Asocierea `(v, d)` se adaugă la registru
- `v` devine proprietar al `d`
- `d` devine ocupat de `v`
- Toate celelalte asocieri rămân intacte

### Postcondiție la eșec (returnează `refuz`)
- **Registrul rămâne identic** — nicio modificare
- Situații de refuz: `v` are deja dulap, `d` este ocupat, sau ambele

---

## **Operația `elibereaza(v)`**

### Precondițiile
- Niciuna specifică dincolo de R1 (nu se impune ca `v` să aibă dulap)

### Postcondiție la succes (returnează `eliberat`)
- Asocierea dintre `v` și dulapul anterior este eliminată
- `v` nu mai are dulap; dulapul devine din nou liber
- Toate celelalte asocieri rămân intacte

### Postcondiție la eșec (returnează `fara_dulap`)
- **Registrul rămâne identic** — nicio modificare
- Situație: `v` nu are (nu avea) dulap; repetarea nu este eroare

---

## **Invarianți (adevărați înainte și după succes)**
- **R2 persistent**: relație injectivă (maximum 1-la-1)
- **Conservare entități**: niciun vizitator/dulap nu apare sau dispare
- **Integritate**: registrul gol rămâne valid; seturile de vizitatori și dulapuri sunt fixe

---

## **Ceea ce rămâne neschimbat**
- La refuz: **întregul registru**
- La succes: **toate asocierile neprivind `v` (la `atribuie`)** sau **asocierile cu alți vizitatori (la `elibereaza`)**
- **Mulțimile de identificatori** ale vizitatorilor și dulapurilor

---

## **Verificarea scenariilor**

| Scenariu | Condiție | Rezultat | Stare finală |
|---|---|---|---|
| **S1** | V3 liber ✓, D3 liber ✓ | `atribuit` | B + V3–D3 |
| **S2** | V3 liber ✓, D2 ocupat ✗ | `refuz` | B (identic) |
| **S3** | V1 ocupat ✗, D3 liber ✓ | `refuz` | B (V1–D1 intact) |
| **S4** | V1 ocupat ✗, D2 ocupat ✗ | `refuz` | B (V1–D1 rămâne!) |
| **S5** | Prima: V1 ocupat ✓; a 2-a: V1 liber ✗ | `eliberat`, `fara_dulap` | {V2–D2} în ambele |
| **S6** | V1 ocupat ✗ (cu D1), chiar dacă D1 ar fi „liber" abstract | `refuz` | B (exact) |

**Contractul este o specificație comportamentală completă**: operațiile sunt idempotente și defensive, respectând invarianții și oferind o interfață deterministă prin coduri de ieșire și postcondiții clare pentru fiecare cale de execuție.