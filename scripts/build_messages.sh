#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "$0")/../mensajes" && pwd)"

# limpiar carpeta
rm -f "${DIR}"/*.md

# array: dow hh:mm mensaje
while IFS='|' read -r dow hm text; do
  fn="${DIR}/${dow}-${hm/:/-}.md"
  echo "$text" > "$fn"
done <<'TABLE'
mon|14:50|@everyone Lost City (World) – prepárense para entrar.
mon|18:20|@everyone Phantom Monastery abre en 10 min.
mon|19:50|@everyone Hoguera diario – reúnanse.
mon|20:20|@everyone Lost City (World) inicia en 10 min.
mon|20:50|@everyone Demon Realm (Abbys) abre en 10 min.
mon|21:20|@everyone Abbys Domination en 10 min.

tue|13:20|@everyone Phantom Monastery – 10 min.
tue|17:50|@everyone Lilith aparecerá en 10 min.
tue|19:50|@everyone Hoguera diario – reúnanse.
tue|20:20|@everyone Mu Ball inicia en 10 min.
tue|20:50|@everyone Lost Tower (World) abre en 10 min.
tue|21:20|@everyone Babel empieza en 10 min.

wed|14:50|@everyone Lost City (Abbys) – 10 min.
wed|17:50|@everyone Lilith aparecerá en 10 min.
wed|19:50|@everyone Hoguera diario – reúnanse.
wed|20:20|@everyone Lost City (Abbys) – 10 min.
wed|21:20|@everyone Roland City War (Asedio Abbys) inicia en 10 min.

thu|14:50|@everyone Kubera Mine fase 1 – 10 min.
thu|15:50|@everyone Kubera Mine fase 2 – 10 min.
thu|17:50|@everyone Lilith aparecerá en 10 min.
thu|18:50|@everyone Kubera Mine fase 3 – 10 min.
thu|19:50|@everyone Hoguera diario – reúnanse.
thu|20:20|@everyone Treasure Fayrland abre en 10 min.
thu|20:50|@everyone Lost Tower (Abbys) – 10 min.
thu|21:20|@everyone Babel empieza en 10 min.

fri|17:50|@everyone Lilith aparecerá en 10 min.
fri|19:50|@everyone Hoguera diario – reúnanse.
fri|20:20|@everyone Dragon Fort (GVG mundo) – 10 min.
fri|21:20|@everyone Abbys Domination en 10 min.
fri|22:20|@everyone Element Fayrland abre en 10 min.

sat|15:50|@everyone 3 vs 3 inicia en 10 min.
sat|17:50|@everyone Lilith aparecerá en 10 min.
sat|19:50|@everyone Hoguera diario – reúnanse.
sat|20:20|@everyone Dragon Fort (GVG abbys) – 10 min.

sun|13:20|@everyone Mu Stadium abre en 10 min.
sun|15:50|@everyone Element Competition – 10 min.
sun|17:50|@everyone Lilith aparecerá en 10 min.
sun|19:50|@everyone Hoguera diario – reúnanse.
sun|21:20|@everyone Roland City War (Asedio World) en 10 min.
sun|22:20|@everyone Element Competition – 10 min.
TABLE
