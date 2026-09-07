# Anleitung: Aufbau & Wartung der Kurs-Website

Diese Datei erklärt, wie die Website technisch aufgebaut ist, wie sie mit GitHub zusammenhängt,
und wie man die häufigsten Änderungen macht — gedacht für dich selbst und für eine Nachfolge, die
die Seite ohne Quarto/R/Python-Kenntnisse pflegen soll.

---

## 1. Das Wichtigste zuerst: wie die Seite lebt

Es gibt **kein Backend mehr** (Supabase wurde entfernt, das Projekt existiert nicht mehr). Alles
läuft über zwei Dinge:

1. **Statische Dateien** — die Website ist am Ende nur HTML/CSS/JS, ausgeliefert von GitHub Pages.
2. **`localStorage` im Browser** — der Fortschritt (angehakte Videos, bestandene Quizze) wird nur
   lokal im Browser des jeweiligen Studierenden gespeichert. Es gibt keinen Server, der das
   speichert — wechselt jemand den Browser oder Rechner, ist der Fortschritt weg. Das ist bewusst
   so (einfach, kostenlos, kein Login nötig), sollte aber bekannt sein.

**Wichtig zu verstehen:** Es gibt zwei git-Branches im Repo:

- **`main`** — hier arbeitest du, hier liegt der Quellcode und ein bereits gerenderter Stand im
  Ordner `docs/`.
- **`gh-pages`** — das ist der Branch, von dem GitHub Pages die *tatsächlich live sichtbare* Seite
  ausliefert (`https://lisaduttenhoefer.github.io/data-analysis-course`).

**Ein `git push` auf `main` allein aktualisiert die Live-Seite NICHT!** Es gibt keine automatische
GitHub Action, die das übernimmt. Genau das war heute das Problem: die Live-Seite war 103 Commits
alt (von April) und zeigte noch die kaputte Supabase-Version. Um die Seite live zu aktualisieren,
brauchst du **immer** diesen Befehl im Terminal, im Projektordner:

```
quarto publish gh-pages --no-prompt --no-browser
```

Das rendert die Seite neu und pusht sie automatisch auf den `gh-pages`-Branch. Nach ein paar
Minuten ist die Änderung live (GitHub cached teils kurz — ggf. Browser-Reload mit Cache leeren).

**Faustregel:** Änderung gemacht → lokal testen → committen & pushen nach `main` (Backup /
Versionierung) → **zusätzlich** `quarto publish gh-pages` ausführen, damit es live sichtbar wird.

---

## 2. Ordnerstruktur

```
data-analysis-course/
├── 1_datentypen.qmd ... 9_regression_analysis.qmd   ← eine Datei pro Wochenseite (dünne Hüllen, s.u.)
├── index.qmd                                        ← Dashboard/Startseite
├── coding_basics.qmd, 0_markdown.qmd                ← weitere feste Seiten
│
├── week-loader.html          ← DAS Herzstück: lädt & rendert den Wocheninhalt zur Laufzeit
├── language-switch.html      ← R/Python-Umschalter oben auf jeder Seite
├── custom.scss                ← gemeinsames Design (Farben, Quiz-Karten, etc.)
├── _quarto.yml                ← Quarto-Konfiguration (Sidebar, welche Ordner mit ausgeliefert werden)
│
├── content/
│   └── week1/ ... week9/
│       ├── manifest.txt      ← DER Ort für: Titel, Videos, Folien, Download-Links, Datensatz-Hinweise
│       └── quiz.md           ← DER Ort für: Quizfragen, Antworten, Feedback-Texte
│
├── WEEK0/ ... WEEK8/          ← die tatsächlichen Rohmaterialien: .Rmd, .ipynb, .pdf
│                                  ACHTUNG: Nummerierung ist versetzt! Siehe Abschnitt 3.
│
└── docs/                      ← von Quarto generierte Ausgabe (die eigentliche Website als HTML).
                                   Wird bei jedem Render komplett neu geschrieben — nie von Hand bearbeiten!
```

### Die Wochen-Nummerierung ist absichtlich versetzt

Die Roh-Materialordner heißen `WEEK0`, `WEEK1`, ... `WEEK8` — aber die Website zeigt **„Week 1“ bis
„Week 9“**. Der Grund: „Week 0“ auf der Website ist die Einführungsseite (`0_markdown.qmd`), die
kein eigenes `WEEKN`-Material hat. Deshalb gilt durchgängig:

> **Roh-Ordner `WEEK{N}` entspricht Website „Week {N+1}“.**

Beispiel: `WEEK3/_03_unsupervised_learning.Rmd` gehört zu **Website Week 4** (Hierarchical
Clustering & PCA), referenziert in `content/week4/manifest.txt`. Das ist die Nummer-1-Fehlerquelle
beim Verwechseln — im Zweifel: in `content/weekN/manifest.txt` nachsehen, welcher `WEEK{N-1}`-Pfad
tatsächlich referenziert wird.

---

## 3. Wie eine Wochenseite technisch funktioniert

Jede Wochen-`.qmd`-Datei (z. B. `3_correlation_clustering.qmd`) ist bewusst winzig gehalten:

```markdown
---
title: "Week 3: Correlation & Clustering"
format:
  html:
    include-in-header:
      - language-switch.html
    include-after-body:
      - week-loader.html
---

<div id="week-app" data-week="3">Loading…</div>
```

Sie enthält **keinen** eigenen Inhalt. Stattdessen:

1. Der Browser lädt die Seite, sieht das leere `<div id="week-app" data-week="3">`.
2. `week-loader.html` (auf **jeder** Wochenseite gleich eingebunden) läuft automatisch los und lädt
   per `fetch()`:
   - `content/week3/manifest.txt` (Titel, Videos, Folien, Downloads, Datensatz-Hinweise)
   - `content/week3/quiz.md` (Quizfragen)
3. Daraus baut es die komplette Seite: Fortschrittsbalken, Schritt 1 (Videos/Folien), Schritt 2
   (R-Markdown/Python-Notebook Download), Schritt 3 (Quiz).

**Das bedeutet:** Um den Inhalt einer Woche zu ändern, bearbeitest du **fast nie** die `.qmd`-Datei
selbst — sondern `content/weekN/manifest.txt` bzw. `content/weekN/quiz.md`. Das kann man auch
direkt im GitHub-Webeditor tun (Datei im Browser auf github.com öffnen → Stift-Symbol „Edit“), ganz
ohne Quarto/R/Python zu installieren.

---

## 4. Das Format von `manifest.txt`

Einfaches `schlüssel: wert`-Format, eine Zeile pro Eintrag. Reihenfolge der Zeilen ist egal (außer
`video:`/`url:` müssen als Paar direkt hintereinander stehen). Beispiel (`content/week3/manifest.txt`):

```
title: Week 3: Correlation & Clustering
description: This week you will measure **associations between variables**...
topics: Pearson vs Spearman · Missing Data · Intro to Clustering · K-means
slides: WEEK2/week2_lecture_slides.pdf
slides_label: Week 3 – Correlation & Clustering (PDF slides)

video: 2.3 Correlations
url: https://youtu.be/l4spkWoXclw
video: 3. Dealing with missing data points
url: https://youtu.be/zJmp2SYoMts

markdown_r: WEEK2/_02_correlation_clustering.Rmd | Week 3 – Correlation & Clustering (R Markdown)
markdown_python: WEEK2/_02_correlation_clustering_python.ipynb | Week 3 – Correlation & Clustering (Python Notebook)

dataset_note: **Datasets:** This sheet reuses ...
bonus_note: **Bonus reference:** a plenum recap ...
bonus: WEEK2/_02_plenum.Rmd | Plenum Recap (R Markdown)
```

Alle möglichen Felder:

| Feld | Pflicht? | Bedeutung |
|---|---|---|
| `title` | ja | Seitentitel, erscheint oben |
| `description` | nein | Kurzer Einleitungstext (Markdown: `**fett**`, `` `code` ``, `[Link](url)` erlaubt) |
| `tip` | nein | Hinweis-Box (blockquote) unter der Beschreibung |
| `topics` | nein | Stichwortliste, nur informativ |
| `slides` | ja | Pfad zur PDF-Folien-Datei |
| `slides_label` | nein | Anzeigetext für den Folien-Link (sonst wird `title` benutzt) |
| `video:` + `url:` | nein, beliebig oft | **Immer im Paar!** Ein Video pro Zeilenpaar |
| `markdown_r:` | nein, beliebig oft (auch mehrfach pro Woche, z. B. Week 1) | Format: `Pfad \| Anzeigename \| optionale Notiz \| optionaler Datei-Name-Override` |
| `markdown_python:` | nein, beliebig oft | Gleiches Format. **Leer/fehlend = "Coming Soon"-Platzhalter wird automatisch angezeigt** |
| `markdown_python_note` | nein | Zusatztext unter den Python-Downloads (z. B. „Required packages: ...“) |
| `dataset_note` / `dataset_note_python` | nein | Hinweistext zum Datensatz (R- bzw. Python-Version) |
| `dataset_code_r` / `dataset_code_python` | nein | Mehrzeiliger Code-Block — **Folgezeilen müssen eingerückt sein** (siehe unten) |
| `warning_note` | nein | Auffällige Warn-Box (z. B. „Datei wird noch überarbeitet“) |
| `bonus_note` | nein | Text über den Bonus-Buttons |
| `bonus:` | nein, beliebig oft | Zusatzmaterial-Buttons, gleiches `Pfad \| Name \| ...`-Format. PDFs öffnen im neuen Tab, alles andere wird heruntergeladen |
| `reference:` | nein, beliebig oft | Referenz-PDF-Buttons |

**Mehrzeiliger Code-Block** (`dataset_code_r`/`dataset_code_python`): die erste Zeile nach dem
Doppelpunkt kann leer sein, alle folgenden **eingerückten** Zeilen gehören dazu, bis eine Leerzeile
kommt:

```
dataset_code_r:
    dat <- read.delim('https://...')
    head(dat)
```

**Pfad-Format** (`markdown_r`, `markdown_python`, `bonus`, `reference`): `Pfad | Anzeigename |
Notiz | Datei-Name-Override`. Nur `Pfad` ist Pflicht, der Rest optional. Der optionale 4. Teil wird
nur gebraucht, wenn der echte Dateiname Sonderzeichen enthält (Doppelpunkt, Umlaute), die man beim
Herunterladen vermeiden will — siehe `content/week8/manifest.txt` als Beispiel.

---

## 5. Das Format von `quiz.md`

```markdown
# Quiz: Correlation
id: correlation

## Q: What is the main difference between Pearson and Spearman correlation?
- [ ] They always return the exact same value
      Pearson = linear relationship on raw values. Spearman = monotonic relationship on ranks.
- [x] Pearson measures the linear relationship using raw values; Spearman uses ranks
      Correct! Pearson uses raw values, Spearman uses ranks.
- [ ] Pearson only works on categorical variables
      Spearman is rank-based — an extreme value only shifts a rank by one position.
```

Regeln:

- `# Quiz: <Titel>` startet eine neue Quiz-Karte (eine Wochenseite hat meist mehrere).
- `id: <slug>` **direkt danach** ist die eindeutige ID dieser Karte — wichtig für den gespeicherten
  Fortschritt! Wird `id:` geändert oder entfernt, **verlieren Studierende ihren gespeicherten
  Haken** für dieses Quiz (die ID ist Teil des `localStorage`-Schlüssels). Bei neuen Quizzen kann
  `id:` weggelassen werden (wird dann automatisch aus dem Titel generiert).
- `## Q: <Frage>` startet eine neue Frage innerhalb der aktuellen Karte.
- `- [x] <Text>` = richtige Antwort, `- [ ] <Text>` = falsche Antwort. **Genau eine** Antwort pro
  Frage sollte `[x]` sein.
- Die **eingerückte Zeile direkt danach** ist der Feedback-Text, der nach dem Beantworten
  angezeigt wird (für richtige wie falsche Antworten).
- `` `code` ``, `**fett**` und `[Text](url)` funktionieren auch hier.

**Eine neue Frage hinzufügen:** einfach einen weiteren `## Q: ...`-Block mit `- [ ]`/`- [x]`-Zeilen
in die passende Quiz-Karte einfügen. **Eine neue Quiz-Karte hinzufügen:** neuen `# Quiz: ...`-Block
ans Ende der Datei anhängen — aber **nicht vergessen**, die neue Quiz-`id` auch in `index.qmd` bei
der jeweiligen Woche in `quizIds` einzutragen (siehe Abschnitt 7.4), sonst zählt sie nicht in den
Gesamt-Fortschritt auf dem Dashboard.

---

## 6. Häufige Aufgaben — Schritt für Schritt

### 6.1 Einen Video-Link ändern

1. `content/weekN/manifest.txt` öffnen (im GitHub-Webeditor oder lokal).
2. Die passende `url:`-Zeile unter dem gesuchten `video:`-Titel ändern.
3. Speichern → committen → pushen → **`quarto publish gh-pages`** ausführen (Abschnitt 1).

### 6.2 Eine Quizfrage ändern oder hinzufügen

1. `content/weekN/quiz.md` öffnen.
2. Frage/Antworten/Feedback nach obigem Format anpassen bzw. neuen `## Q:`-Block einfügen.
3. **Nicht** die `id:` einer bestehenden Quiz-Karte ändern (sonst verlieren Studierende ihren
   Fortschritt für die Karte).
4. Speichern → committen → pushen → `quarto publish gh-pages`.

Diese beiden Aufgaben (6.1, 6.2) sind reine Textdatei-Änderungen — dafür muss **kein** Quarto/R/
Python installiert sein. Wer nur github.com im Browser benutzt, kann das direkt dort machen (Datei
öffnen → Stift-Symbol → Änderung → „Commit changes“). **Aber:** damit es live sichtbar wird, muss
danach trotzdem jemand mit lokalem Zugriff `quarto publish gh-pages` ausführen — das lässt sich
über den GitHub-Webeditor allein nicht auslösen.

### 6.3 Ein Python-Notebook für eine Woche hinzufügen (Platzhalter „Coming Soon“ ablösen)

1. Das `.ipynb` im passenden `WEEK{N-1}/`-Ordner ablegen (Namenskonvention:
   `_0X_thema_python.ipynb`, siehe bestehende Beispiele).
2. In `content/weekN/manifest.txt` eine `markdown_python:`-Zeile hinzufügen bzw. befüllen:
   ```
   markdown_python: WEEK2/_02_thema_python.ipynb | Week 3 – Thema (Python Notebook)
   ```
3. Fertig — der „Coming Soon“-Platzhalter verschwindet automatisch, sobald die Zeile einen Pfad
   enthält.

### 6.4 Eine ganz neue Woche hinzufügen (technischer, seltener)

1. Neue `.qmd`-Datei nach dem Muster der bestehenden anlegen (Abschnitt 3 — nur Frontmatter + `<div
   id="week-app" data-week="10">Loading…</div>`).
2. `content/week10/manifest.txt` + `content/week10/quiz.md` anlegen.
3. In `_quarto.yml` unter `sidebar: contents:` einen neuen Eintrag hinzufügen.
4. In `index.qmd` im `WEEKS`-Array einen neuen Eintrag anhängen — **hier müssen die `checkIds` und
   `quizIds` von Hand mit den tatsächlich generierten IDs übereinstimmen**:
   - `check_w10_slides`, `check_w10_vid1`, `check_w10_vid2`, ... (eine ID pro Video, in
     Manifest-Reihenfolge)
   - `check_w10_md` (nur R-Material) oder `check_w10_md_r` + `check_w10_md_python` (beide Sprachen
     vorhanden) — bei **mehreren** Dateien pro Sprache zusätzlich durchnummeriert:
     `check_w10_md1_r`, `check_w10_md2_r`, ...
   - `quizIds`: die volle Form `w10_q_<id>` für jede Quiz-Karten-`id` aus `quiz.md`
5. `quarto render` lokal zum Testen, dann `quarto publish gh-pages`.

Das Dashboard (`index.qmd`) wird **bewusst nicht automatisch** aus den Manifests generiert — das ist
eine Absicherung gegen Tippfehler, die die Startseite kaputt machen, und weil sich das Dashboard nur
selten ändert (neue Woche = seltenes Ereignis), im Gegensatz zu Text-/Fragen-Änderungen (häufig).

---

## 7. Lokal testen, bevor man live schaltet

Im Terminal, im Projektordner:

```
quarto preview --port 4848 --no-browser
```

Dann im Browser `http://localhost:4848` öffnen. **Wichtig:** die Seite lädt Inhalte per `fetch()`
nach — das funktioniert **nur** über einen echten lokalen Server wie `quarto preview`, **nicht**
wenn man die `docs/*.html`-Datei einfach per Doppelklick im Finder öffnet (Browser blockieren das
aus Sicherheitsgründen bei `file://`-Pfaden).

Vor dem Live-Schalten prüfen:
- Zeigt die geänderte Wochenseite den neuen Inhalt korrekt an?
- Bleibt der Fortschrittsbalken nach einem Reload erhalten?
- Falls eine neue Quiz-ID hinzugefügt wurde: taucht sie im Dashboard-Fortschritt mit auf?

**Falls Port 4848 schon belegt ist** (z. B. von einer vorherigen Preview-Session, die nicht sauber
beendet wurde): `lsof -ti:4848` zeigt die Prozess-ID(s), `kill <PID>` beendet sie.

---

## 8. Troubleshooting

**„Loading…“ bleibt stehen und lädt nie fertig:**
Meist ein falscher Pfad oder Tippfehler in `manifest.txt`/`quiz.md`, oder die Seite wurde nicht neu
gerendert. Browser-Konsole öffnen (Rechtsklick → Untersuchen → Console) — dort steht eine
Fehlermeldung mit Dateiname. Prüfen, ob `content/weekN/manifest.txt` wirklich existiert und die
Syntax stimmt (siehe Abschnitt 4/5).

**Änderung committed & gepusht, aber auf der Live-Seite nicht sichtbar:**
`quarto publish gh-pages` vergessen! Ein reiner `git push` auf `main` reicht nicht (siehe
Abschnitt 1). Danach ein paar Minuten warten und ggf. Browser-Cache leeren (Hard-Reload:
Cmd+Shift+R).

**Ein/e Studierende/r verliert ihren Fortschritt:**
Fortschritt liegt nur im `localStorage` des jeweiligen Browsers — kein Backend, kein Cloud-Sync.
Browser-Wechsel, Inkognito-Modus oder „Browserdaten löschen“ setzt den Fortschritt zurück. Das ist
eine bewusste Design-Entscheidung (kein Login-System mehr, seit Supabase entfernt wurde), kein Bug.

**Quiz-Fortschritt „verschwindet“ nach einer Content-Änderung:**
Vermutlich wurde eine `id:`-Zeile in `quiz.md` geändert oder eine `markdown_r`/`markdown_python`-
Zeile hinzugefügt/entfernt (verschiebt die automatisch generierten Checkbox-IDs). Siehe Abschnitt 5.

---

## 9. Was es nicht mehr gibt (und warum)

- **Supabase / Login über GitHub:** das Backend-Projekt existiert nicht mehr (DNS tot). Die Seite
  läuft komplett ohne Login, ohne Server, nur mit `localStorage`.
- **`admin.qmd`:** war die Verwaltungsoberfläche für Supabase, ergibt ohne Backend keinen Sinn mehr,
  wurde entfernt.
- **`weekN-script.html`-Dateien (eine pro Woche):** früher enthielt jede Woche eigenen,
  handgeschriebenen HTML/JS-Code. Das wurde durch das gemeinsame `week-loader.html` +
  `content/weekN/manifest.txt`+`quiz.md`-System ersetzt (siehe Abschnitt 3) — genau damit man
  Inhalte ändern kann, ohne Code zu schreiben.
