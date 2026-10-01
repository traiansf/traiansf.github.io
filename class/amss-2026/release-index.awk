# Usage: awk -f release-index.awk RELEASED static/index.html > index.html
# A landing-page <li data-release="<dir>/<basename>"> whose id is not listed in
# RELEASED is replaced by its title without links. The page explains that such
# titles are not available yet; screen readers also get "(în curând)".

FNR == NR {
  sub(/\r$/, ""); sub(/#.*/, "")
  if (NF) released[$1] = 1
  next
}

/<li [^>]*data-release="/ {
  cr = sub(/\r$/, "") ? "\r" : ""
  match($0, /data-release="[^"]*"/)
  id = substr($0, RSTART + 14, RLENGTH - 15)
  if (!(id in released)) {
    match($0, /^[ \t]*/)
    indent = substr($0, 1, RLENGTH)
    title = $0
    sub(/^[^<]*<li[^>]*><a[^>]*>/, "", title)
    sub(/<\/a>.*/, "", title)
    print indent "<li class=\"locked\">" title "<span class=\"visually-hidden\"> (în curând)</span></li>" cr
    next
  }
  print $0 cr
  next
}

{ print }
