"""Builds the multiple_choice_exam (mcexam) bank from the sample paper.

The paper (model-examen.md) and its key (model-examen-barem.md) stay the
single source: this script reads the cases, stems, questions and options
from the paper, the correct letters and domains from the key's summary
table, and writes model-examen-mcexam.md in mcexam's format v2: one section
per assessed domain, each case a '###' unit with its stem and '####'
questions, so a variant keeps a case's questions together and shuffles only
the options. See https://github.com/traiansf/multiple_choice_exam.

Usage (from exam/):  python mcexam-bank.py
Then:                mcexam lint --input model-examen-mcexam.md
"""

import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
PAPER = HERE / "model-examen.md"
KEY = HERE / "model-examen-barem.md"
OUT = HERE / "model-examen-mcexam.md"

CASE_RE = re.compile(r"^# Cazul ([A-Z]) — (.+)$")
QUESTION_RE = re.compile(r"^\*\*(\d+)\.\*\* (.+)$")
OPTION_RE = re.compile(r"^([A-D])\. (.+)$")
# | A — terenuri de tenis | Încadrarea problemei și cerințe | 1–4 | D, A, C, A |
KEY_ROW_RE = re.compile(r"^\| ([A-Z]) — [^|]+\| ([^|]+?) \| (\d+)–(\d+) \| ([A-D](?:, [A-D])*) \|$")


def fail(message: str) -> None:
    sys.exit(f"mcexam-bank.py: {message}")


def read_key() -> tuple[dict[str, str], dict[int, str]]:
    """Domain per case letter and correct letter per question number."""
    domains: dict[str, str] = {}
    answers: dict[int, str] = {}
    for line in KEY.read_text(encoding="utf-8").splitlines():
        match = KEY_ROW_RE.match(line)
        if not match:
            continue
        case, domain, first, last, letters = match.groups()
        letters = letters.split(", ")
        numbers = range(int(first), int(last) + 1)
        if len(letters) != len(numbers):
            fail(f"key row for case {case}: {len(letters)} letters for {len(numbers)} questions")
        domains[case] = domain
        answers.update(zip(numbers, letters, strict=True))
    return domains, answers


def read_paper() -> list[dict]:
    """Cases in paper order: letter, title, stem lines, questions."""
    cases: list[dict] = []
    question: dict | None = None
    for line in PAPER.read_text(encoding="utf-8").splitlines():
        if line.startswith("# "):
            match = CASE_RE.match(line)
            cases.append({"letter": match[1], "title": match[2], "stem": [], "questions": []}
                         if match else None)
            question = None
            continue
        case = cases[-1] if cases else None
        if case is None or line == "---":
            continue
        if match := QUESTION_RE.match(line):
            question = {"number": int(match[1]), "prompt": match[2], "options": []}
            case["questions"].append(question)
        elif match := OPTION_RE.match(line):
            if question is None:
                fail(f"option outside a question: {line}")
            question["options"].append((match[1], match[2]))
        elif question is None:
            case["stem"].append(line)
        elif line.strip():
            fail(f"question {question['number']}: unexpected line: {line}")
    return [case for case in cases if case is not None]


def main() -> None:
    domains, answers = read_key()
    cases = read_paper()
    title = "AMSS 2026/2027 — Model de examen"
    lines = [f"# {title}"]
    for case in cases:
        domain = domains.get(case["letter"])
        if domain is None:
            fail(f"case {case['letter']} is missing from the key table")
        lines += ["", f"## {domain}", "", f"### {case['title']}", ""]
        lines += [line for line in "\n".join(case["stem"]).strip("\n").splitlines()]
        for question in case["questions"]:
            number = question["number"]
            letters = [letter for letter, _ in question["options"]]
            if letters != ["A", "B", "C", "D"]:
                fail(f"question {number}: options {letters}, expected A–D")
            if number not in answers:
                fail(f"question {number} has no answer in the key table")
            lines += ["", f"#### {question['prompt']}"]
            for letter, text in question["options"]:
                mark = "x" if letter == answers[number] else " "
                lines.append(f"- [{mark}] {text}")
    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")
    total = sum(len(case["questions"]) for case in cases)
    print(f"wrote {OUT.name}: {len(cases)} cases, {total} questions")


if __name__ == "__main__":
    main()
