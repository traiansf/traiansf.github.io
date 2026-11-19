# CONTRACT: Operația `atribuie`

## Precondițiile
- Identificatorii v și d sunt valizi și cunoscuți
- Registrul respectă invarianții inițiali

## Condiția de succes
- Dulapul d este liber la momentul verificării și operația se completează cu atribuit

## Postcondițiile

**Dacă rezultatul este `atribuit`:**
- Perechea (v, d) este adăugată în registru
- Orice asociere anterioară a vizitatorului v este eliminată
- Alte asocieri rămân inmodificate
- Vizitatorului v i se atribuie exact dulapul d

**Dacă rezultatul este `refuz`:**
- Dulapul d era ocupat în momentul verificării
- Orice asociere anterioară a vizitatorului v este eliminată
- Vizitatorului v nu i se atribuie un dulap
- Alte asocieri rămân inmodificate

## Invarianții
- Funcția v → d este parțial injectivă: fiecare vizitator are cel mult un dulap
- Funcția d → v este parțial injectivă: fiecare dulap are cel mult un vizitator
- Registrul conține doar perechi cu identificatori valizi

---

# TESTE (pornindu-se din B = {V1–D1, V2–D2})

**Test 1: Atribuire simplă la dulap liber**
- Dinainte: B
- Apel: atribuie(V3, D3)
- Rezultat așteptat: atribuit
- După: {V1–D1, V2–D2, V3–D3}

**Test 2: Refuz pentru dulap ocupat**
- Dinainte: B
- Apel: atribuie(V3, D1)
- Rezultat așteptat: refuz
- După: {V1–D1, V2–D2}

**Test 3: Realocare de vizitator la dulap liber**
- Dinainte: B
- Apel: atribuie(V1, D3)
- Rezultat așteptat: atribuit
- După: {V1–D3, V2–D2}

**Test 4: Refuz la realocare cu dulap ocupat**
- Dinainte: B
- Apel: atribuie(V1, D2)
- Rezultat așteptat: refuz
- După: {V2–D2}

**Test 5: Schimb indirect de dulapuri**
- Dinainte: {V1–D2, V2–D1}
- Apel: atribuie(V1, D3)
- Rezultat așteptat: atribuit
- După: {V1–D3, V2–D1}