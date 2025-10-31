# coding: utf-8

"""
cd carti/Faust
python combina.py

ebook-convert Faust.md Faust.azw3 \
    --language "ro" \
    --input-encoding utf-8 \
    --title "Faust" \
    --authors "Johann Wolfgang Goethe (traducere Lucian Blaga)" \
    --chapter "//*[(name()='h1' or name()='h2') or (name()='h3' or name()='h4')]" \
    --no-chapters-in-toc \
    --level1-toc "//*[name()='h2']" \
    --level2-toc "//*[name()='h3']" \
    --level3-toc "//*[name()='h4']" \
    --cover "4. Copertă.jpg"

ebook-convert Faust.md Faust.epub \
    --language "ro" \
    --input-encoding utf-8 \
    --title "Faust" \
    --authors "Johann Wolfgang Goethe (traducere Lucian Blaga)" \
    --chapter "//*[(name()='h1' or name()='h2') or (name()='h3' or name()='h4')]" \
    --no-chapters-in-toc \
    --level1-toc "//*[name()='h2']" \
    --level2-toc "//*[name()='h3']" \
    --level3-toc "//*[name()='h4']" \
    --cover "4. Copertă.jpg"

"""

import os

def main(args: list[str]) -> None:
    with open("Faust.md", "w", encoding="utf-8") as ofile:
        files: list[tuple[int, str]] = []
        for f in os.listdir("."):
            if not f[0] in "1234567890":
                continue
            if f.endswith(".py") or f.endswith(".md"):
                continue
            if "magine" in f and not f.endswith(".jpg"):
                continue
            files.append((int(f.split(".")[0]), f))
        files.sort()
        for (_, f) in files:
            print(f)
            if f.endswith(".jpg"):
                ofile.write(f"![imagine]({f})\n\n")
                continue
            with open(f, "r", encoding="utf-8") as ifile:
                precedenta_goala = True
                for line in ifile:
                    line = line.rstrip()
                    tabs = 0
                    while line.startswith("\t"):
                        tabs += 1
                        line = line[1:]
                    if line and not precedenta_goala:
                        ofile.write("<br>\n")
                    else:
                        ofile.write("\n")
                    precedenta_goala = not bool(line)
                    ofile.write("&emsp;" * tabs * 2)
                    ofile.write(line)
                ofile.write("\n\n")


if __name__ == "__main__":
    import sys
    main(sys.argv[1:])
