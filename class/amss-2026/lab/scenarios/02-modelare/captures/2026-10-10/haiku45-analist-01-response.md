# Model de domeniu: Atelier comunitar de reparații

## Entități și identități

Modelul de domeniu conține patru entități principale:

1. **Aparat** — identitate: cod (A17, A18, etc.). Fiecare aparat fizic are un cod stabil atribuit de atelier, care servește ca cheie primară. Descriere și model sunt atribute descriptive.

2. **Vizită** — identitate: cod (J1, J2, J3, etc.). Fiecare vizită este înregistrare separată cu dată proprie și privește exact un aparat. Chiar și pentru același aparat, vizitele sunt distincte și păstrează independență reciprocă.

3. **Problemă raportată** — identitate: compusă din (cod vizită + ordine). Fiecare problemă aparține exact unei vizite și nu poate fi transferată. Textul problemei poate coincide între vizite diferite, dar înregistrările rămân distincte (P1 și P3 sunt diferite, deși ambele spun „Pârghia nu rămâne jos").

4. **Voluntar** — identitate: cod (M1, M2, etc.). Codul este stabilizator; numele nu este unic și poate coincide pentru mai mulți voluntari.

## Relații și cardinalități

| Relație | Cardinalitate | Explicație |
|---------|---------------|-----------|
| Aparat → Vizite | 1 : 0..* | Un aparat poate avea 0 vizite (nou înregistrat) sau multiple |
| Vizită → Aparat | N : 1 | Fiecare vizită se referă la exact un aparat |
| Vizită → Probleme | 1 : 1..* | Fiecare vizită conține cel puțin o problemă |
| Problemă → Vizită | N : 1 | Fiecare problemă aparține exact unei vizite |
| Vizită → Voluntar | N : 0..1 | O vizită poate să nu aibă responsabil sau să aibă exact unul |
| Voluntar → Vizite | 1 : 0..* | Un voluntar poate gestiona 0 sau mai multe vizite |

## Persistență la o nouă vizită

Conform R5, la o nouă vizită:

- **Se creează** o nouă înregistrare de vizită cu cod distinct (ex: J2 pentru A17)
- **Se păstrează** problemele raportate din vizitele anterioare (P1 rămâne în J1, nu se copiază în J2)
- **Se păstrează** responsabilii anteriori în vizitele lor (M1 rămâne responsabil pentru J1, dar J2 poate avea M2)
- **Se creează** noi probleme raportate doar pentru J2 (P2 este specifică acestei vizite)
- **Se permite** o nouă asociere voluntar-vizită independentă de istoricul precedent

*Exemplu concret:* A17 are J1 (3 sept, M1, P1) și J2 (8 oct, M2, P2) — sunt doi perechi voluntar-problemă distincte, niciunul ereditar.

**Cuvinte: 398**