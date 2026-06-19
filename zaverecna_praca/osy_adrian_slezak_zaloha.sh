#!/bin/bash
#
# osy_slezak_zaloha.sh — jednoduchy zalohovaci skript
# Zabali zvoleny priecinok do .tar.gz archivu s datumom v nazve.
#
# Pouzitie:
#   chmod +x osy_slezak_zaloha.sh     # raz: sprav skript spustitelnym
#   ./osy_slezak_zaloha.sh            # spusti zalohu
#
# Vsetko je bezpecne: zdroj sa LEN cita, archiv sa uklada do /tmp/zalohy.

# --- Nastavenia -----------------------------------------------------------

# TODO 1: Doplň cestu k svojmu OSOBNEMU priecinku zo zadania:
# CESTA UPRAVENÁ PODĽA PRÍRUČKY (slezak-mint / pouzivatel: slezak)
ZDROJ="$HOME/zaloha_slezak"

# Kam ukladame archivy (nemusis menit).
CIEL="/tmp/zalohy"

# Datum v tvare RRRR-MM-DD — bude sucastou nazvu archivu.
DATUM=$(date +%Y-%m-%d)

# Cely nazov vysledneho archivu.
ARCHIV="$CIEL/zaloha-$DATUM.tar.gz"

# --- Kontroly -------------------------------------------------------------

# Ak zdrojovy priecinok neexistuje, skript skonci s chybou.
if [ ! -d "$ZDROJ" ]; then
    echo "CHYBA: zdrojovy priecinok '$ZDROJ' neexistuje."
    echo "Vytvor ho (mkdir $ZDROJ) alebo uprav premennu ZDROJ v skripte."
    exit 1
fi

# Ak cielovy priecinok na zalohy neexistuje, vytvorime ho.
mkdir -p "$CIEL"

# --- Zaloha ---------------------------------------------------------------

echo "Zalohujem '$ZDROJ' do '$ARCHIV' ..."

# c = create, z = gzip kompresia, f = nazov suboru.
tar -czf "$ARCHIV" "$ZDROJ"

# --- Vysledok -------------------------------------------------------------

echo "Hotovo. Archiv: $ARCHIV"
echo "Velkost:"
ls -lh "$ARCHIV"


# --- BONUS: Použitie rsync (Alternatíva k tar) ----------------------------
# TODO 2 (BONUS): Pre zrkadlenie namiesto archivácie odkomentuj riadok nižšie:
# rsync -av "$ZDROJ/" "$CIEL/zrkadlo/"
