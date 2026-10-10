# Prezentare AMSS cu reveal.js

Același material poate fi prezentat în două moduri:

- **Un calculator, două ecrane:** prezentarea pe proiector; fereastra profesorului, cu note și cronometru, pe ecranul calculatorului. Funcționează fără internet după instalare și generare.
- **Două calculatoare:** fiecare deschide serviciul online în browser. Calculatorul proiectorului urmărește comenzile profesorului prin internet; nu este necesară comunicarea directă în rețeaua sălii.

Sursele sunt aceleași Markdown din `curs/` și `lab/`, inclusiv `::: notes` și `{.transition}`. Sunt generate numai prezentările din `RELEASED`; Laboratorul 0 rămâne document. HTML-urile publicate pentru consultare și PDF-urile Beamer își păstrează fluxul de generare. Nu editați fișierele din `dist/`.

Motorul de prezentare este proiectul independent [reveal-classroom](https://github.com/traiansf/reveal-classroom), fixat la o versiune în `package.json`; documentația lui completă este în `docs/` din acel depozit. Acest folder conține doar instanța cursului: `reveal-classroom.config.json` (limba română, lista `RELEASED`, filtrele Pandoc și sigla cursului), `theme.css`, `template.html` și scripturile serverului cs.unibuc.ro din `deploy/`. Modificările motorului se fac în reveal-classroom; aici se actualizează doar versiunea (vedeți [Actualizarea motorului](#actualizarea-motorului)).

## Instalare și generare

Sunt necesare Node.js 22 sau ulterior și instrumentele Pandoc/Mermaid descrise în [BUILD.md](../BUILD.md). Generarea se face pe calculatorul autorului; serverul Ubuntu nu are nevoie de Pandoc, TeX sau Mermaid.

Din `amss-2026/presentation`:

```powershell
npm.cmd ci
npm.cmd run build
npm.cmd start
```

Pe Linux folosiți `npm` în loc de `npm.cmd`. Deschideți <http://127.0.0.1:3000>. Opriți serviciul cu `Ctrl+C`. După modificarea materialelor, executați din nou `npm.cmd run build`. Dacă se schimbă lista `RELEASED`, reporniți și serviciul.

## Un calculator și un proiector

1. Alegeți prezentarea (implicit este selectat cel mai recent curs publicat) și apăsați **Deschide prezentarea**.
2. Apăsați **S** și permiteți fereastra suplimentară dacă browserul o blochează.
3. Folosiți modul **Extindere** al ecranelor (în Windows: `Win+P`).
4. Mutați fereastra slide-urilor pe proiector și activați ecranul complet; păstrați notele pe calculator.
5. Navigați din fereastra profesorului. Aceasta arată slide-ul curent, următorul slide și cronometrul. Reperele de timp sunt în notele tranzițiilor.

Toate resursele prezentării sunt locale. Nu deschideți HTML-ul prin `file://`: fereastra profesorului necesită serverul HTTP. Acest mod nu creează o sesiune de sincronizare și nu cere parolă.

## Două calculatoare prin internet

1. Deschideți adresa HTTPS a serviciului, alegeți prezentarea și introduceți parola profesorului.
2. Apăsați **Pornește sesiunea sincronizată**.
3. Pe calculatorul proiectorului sau pe dispozitivele participanților, deschideți **https://cs.unibuc.ro/~tserbanuta/amss/now** și afișați prezentarea pe tot ecranul. Aceeași adresă scurtă este afișată în interfață după pornirea sesiunii.
4. Pe calculatorul dumneavoastră, urmați linkul **Deschide prezentarea de control**, apoi apăsați **S** pentru note. Păstrați deschisă și prezentarea de control.

Pe telefon, deschideți același link de control: interfața afișează automat slide-ul, butoane mari **Înapoi / Înainte**, timpul scurs și notele profesorului pe același ecran. Cronometrul arată minutele și sferturile de minut (`23:45`), pornește la deschiderea linkului de control și nu se resetează la reîncărcarea paginii; atingeți-l pentru a-l reporni de la 0:00 când începe efectiv cursul. Sub cronometru apare **în ritm**, **mai încet** sau **mai repede**, cu diferența în minute dintre timpul scurs și intervalul planificat al slide-ului curent; toleranța este de 2 minute. În portret, notele sunt sub slide, iar butoanele și cronometrul în partea de jos a ecranului; în peisaj, notele și butoanele sunt alături de slide. Notele se pot derula separat, fără schimbarea slide-ului. Butoanele parcurg și aparițiile progresive. Glisarea orizontală pe slide trece la slide-ul următor sau anterior. Bara de progres de sub slide doar indică poziția: pe telefon, atingerea ei nu schimbă slide-ul. (În Reveal.js, un clic pe bara de progres sare la slide-ul corespunzător poziției clicului. Până la 10 octombrie 2026, butoanele erau imediat sub bară, iar o atingere puțin prea sus sărea mult înainte sau înapoi.) Nu este necesară o fereastră suplimentară pentru note. Modul de derulare verticală automată al Reveal.js este dezactivat, astfel încât proiecția și controlul folosesc aceeași navigare între slide-uri. Participanții care deschid `/now` văd numai proiecția, inclusiv pe mobil.

Planul de timp vine din marcaje ascunse în notele profesorului: `[]{.pace at=25}` fixează minutul de început al slide-ului, `[]{.pace dur=8}` durata lui, iar `of=100` (o singură dată pe prezentare) durata totală. Slide-urile fără marcaj împart egal timpul rămas până la următorul `at`. Marcajele nu apar în note, în PDF-ul cu note sau în HTML-ul publicat; o prezentare fără `of` nu afișează indicația de ritm. Nu folosiți ca nume de atribut un atribut HTML standard (de exemplu `min`): Pandoc îl păstrează fără prefixul `data-`, iar marcajul este ignorat.

Proiecția urmărește slide-ul, aparițiile progresive și ecranul de pauză. Comenzile de navigare sunt dezactivate în proiecție. Notele nu sunt incluse în răspunsul HTML pentru linkul de proiecție. Materialele sursă și prezentările obișnuite nu sunt tratate ca documente confidențiale.

`/now` redirecționează către proiecția ultimei sesiuni create cu parola profesorului, fără a divulga cheia de control. Dacă nu există o sesiune sau aceasta a expirat, apare o pagină de așteptare care verifică automat la fiecare 5 secunde. Pornirea unei sesiuni noi schimbă destinația pentru accesările următoare; cei aflați deja într-o prezentare rămân în sesiunea respectivă până când redeschid `/now`. După repornirea serviciului trebuie creată o sesiune nouă. Adresa funcționează și local, la `http://127.0.0.1:3000/now`.

O proiecție conectată mai târziu sau reîncărcată primește starea curentă. La pierderea conexiunii rămâne ultimul slide și apare un mesaj; după reconectare se recuperează starea. Controlul local continuă chiar dacă internetul se întrerupe. Sesiunile expiră după opt ore; repornirea serviciului le șterge și necesită o sesiune nouă. Linkul de control funcționează în fila în care a fost creat, deoarece cheia este păstrată în `sessionStorage`, nu în URL.

Pentru un test pe același calculator puteți folosi parola temporară afișată de `npm start` și un al doilea browser pentru proiecție.

## Găzduire pe Ubuntu

Destinația aleasă este **https://cs.unibuc.ro/~tserbanuta/amss/**, cu acces SSH ca `tserbanuta@cs.unibuc.ro`. Aplicația funcționează atât la rădăcina unui domeniu, cât și sub un prefix configurat prin `BASE_PATH`, inclusiv pentru conexiunile Socket.IO. Proxy-ul trebuie să păstreze prefixul în cererile către Node.

### Instalarea pe cs.unibuc.ro

Serviciul este instalat în `~/.local/share/amss-presentation/app` și rulează ca serviciu systemd al utilizatorului, pe `127.0.0.1:3107`, cu `BASE_PATH=/~tserbanuta/amss`. Are o copie proprie Node.js 24 în `~/.local/share/amss-presentation/runtime/node`; Node-ul sistemului nu a fost modificat. Parola generată este în `~/.config/amss-presentation/environment`, cu permisiuni `600`.

**Stare la 7 octombrie 2026:** serviciul public răspunde prin HTTPS, iar `linger` este activat. Sincronizarea, notele și reconectarea au fost verificate prin tunel SSH la instalare. Pasul administrativ de mai jos este deja efectuat pe acest server; rămâne documentat pentru reinstalare.

Dintr-un terminal interactiv:

```powershell
ssh -t tserbanuta@cs.unibuc.ro "sudo bash ~/.local/share/amss-presentation/app/deploy/enable-cs-apache.sh"
```

Introduceți parola sudo în terminal. [Scriptul](deploy/enable-cs-apache.sh) activează `proxy` și `proxy_http`, instalează [ruta AMSS](deploy/cs-apache.conf) numai în VirtualHost-ul HTTPS existent pentru `cs.unibuc.ro`, verifică sintaxa înainte de reîncărcare și activează `linger` pentru serviciul utilizatorului. Salvează configurația VirtualHost înainte de modificare. Nu este nevoie de un subdomeniu nou sau de un certificat nou.

După activare, verificați adresa publică, inclusiv `/~tserbanuta/amss/health`, și sincronizarea între două browsere. Pentru a afla parola profesorului, conectați-vă prin SSH și consultați fișierul `~/.config/amss-presentation/environment`; aceasta este diferită de parola sudo.

### Actualizare automată la push

HTML-urile de pe GitHub Pages folosesc tema statică a cursului. Cele pentru prezentarea sincronizată sunt generate separat pentru Reveal.js, din aceleași surse Markdown și aceeași listă `RELEASED`.

Workflow-ul [AMSS presentation on cs.unibuc.ro](../../../.github/workflows/amss-presentation.yml) rulează la fiecare push pe `main` și poate fi pornit manual din GitHub Actions. Instalează instrumentele de generare și reveal-classroom (versiunea din `package-lock.json`), construiește prezentările Reveal.js, creează pachetul (`reveal-classroom bundle`, cu `deploy/` al cursului), îl verifică pornind serverul din pachet (`/health`, `decks.json`) și îl publică în release-ul GitHub `amss-live`. Pe server, un timer systemd verifică release-ul la fiecare minut, descarcă pachetul prin HTTPS, verifică SHA-256 și instalează actualizarea. Acest flux nu cere acces SSH din infrastructura GitHub, de unde conexiunea către server este refuzată. Nu trebuie să generați sau să copiați manual `dist/` după push. Un build sau test eșuat oprește publicarea pachetului. Instalarea are loc de regulă în 1–2 minute după terminarea jobului CI; o eroare de descărcare sau de verificare a integrității păstrează versiunea existentă și este reîncercată la următoarea verificare.

Serverul servește copia din `~/.local/share/amss-presentation/app/dist/`; `decks.json` conține lista prezentărilor, iar `revision.txt` identifică commit-ul din pachet. `~/.local/share/amss-presentation/installed-revision` înregistrează ultima instalare încheiată cu succes. Fișierele nu sunt citite de pe GitHub Pages la fiecare acces. Publicarea Pages și actualizarea serviciului sunt două procese independente, urmărite separat în GitHub Actions.

**Actualizarea repornește serviciul și închide sesiunile de prezentare active.** După instalarea noii versiuni creați o sesiune nouă. Parola profesorului și configurația Apache sunt păstrate. Joburile de actualizare rulează pe rând.

Nu sunt necesare secrete SSH în GitHub Actions: CI folosește tokenul temporar al workflow-ului pentru publicarea release-ului, iar serverul descarcă un pachet public. Parola profesorului rămâne numai pe server. [pull-release.sh](deploy/pull-release.sh) verifică revizia și checksum-ul; [receive-ci.sh](deploy/receive-ci.sh) verifică structura arhivei înainte de instalare. Instalatorul configurează automat timerul la reinstalare.

Verificare prin SSH:

```bash
systemctl --user status amss-update.timer
journalctl --user -u amss-update.service -n 30 --no-pager
cat ~/.local/share/amss-presentation/installed-revision
```

Pentru o verificare imediată: `systemctl --user start amss-update.service`. Pentru a suspenda actualizările pe durata unei prezentări: `systemctl --user stop amss-update.timer`; la final: `systemctl --user start amss-update.timer`. O instalare deja pornită continuă. Nu opriți serviciul de prezentare pentru a suspenda actualizările.

Pentru actualizare manuală de rezervă, generați din nou `dist/`, creați pachetul cu `npm.cmd run bundle -- --out amss-presentation-deploy.tar.gz`, copiați arhiva în directorul personal de pe server și rulați [install-cs-user.sh](deploy/install-cs-user.sh) din pachet.

### Alte instalări

Pentru alt server, Docker sau găzduire statică cu relay public, vedeți [ghidul de deploy al reveal-classroom](https://github.com/traiansf/reveal-classroom/blob/main/docs/deployment.md). Scripturile din `deploy/` sunt cele instalate pe cs.unibuc.ro: pachetele le includ peste kitul generic al motorului, iar `receive-ci.sh`, deja instalat pe server, verifică structura arhivei (`dist/`, `deploy/`, `server.mjs`, `package.json`, `package-lock.json`) înainte de instalare. Nu le înlocuiți cu kitul generic fără o migrare planificată.

## Actualizarea motorului

1. În `package.json`, schimbați eticheta din `git+https://github.com/traiansf/reveal-classroom.git#vX.Y.Z` și rulați `npm.cmd install`.
2. Rulați `npm.cmd run build` și verificați în browser o prezentare: notele (**S**), controlul de pe telefon (fereastră sub 600 px), fragmentele și o sesiune între două browsere (`npm.cmd start`).
3. Faceți push în afara orelor: instalarea pe server repornește serviciul și închide sesiunile active.

Testele motorului (autentificare, izolarea sesiunilor, fragmente, reconectare, eliminarea notelor, relay, configurare) rulează în depozitul reveal-classroom; workflow-ul cursului verifică doar pachetul generat. reveal.js și Socket.IO folosesc licența MIT; licența reveal.js este copiată în pachetul generat. Documentație: [reveal-classroom](https://github.com/traiansf/reveal-classroom), [Speaker View](https://revealjs.com/speaker-view/), [API reveal.js](https://revealjs.com/api/).
