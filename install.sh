#!/usr/bin/env bash
# Instala ograb en el PATH.
#   ./install.sh          -> /usr/local/bin (usa sudo)
#   ./install.sh --user   -> ~/.local/bin   (sin sudo)
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$DIR/ograb"

if [ ! -f "$SRC" ]; then
    echo "[!] No encuentro $SRC" >&2
    exit 1
fi

chmod +x "$SRC"

if [ "$1" = "--user" ]; then
    DEST="$HOME/.local/bin"
    mkdir -p "$DEST"
    cp "$SRC" "$DEST/ograb"
    echo "[+] Instalado en $DEST/ograb"
    case ":$PATH:" in
        *":$DEST:"*) ;;
        *) echo "[!] $DEST no está en tu PATH. Agrega esto a tu ~/.bashrc o ~/.zshrc:"
           echo "    export PATH=\"\$HOME/.local/bin:\$PATH\"" ;;
    esac
else
    DEST="/usr/local/bin"
    sudo cp "$SRC" "$DEST/ograb"
    echo "[+] Instalado en $DEST/ograb"
fi

echo "Listo. Prueba con: ograb <archivo>"
