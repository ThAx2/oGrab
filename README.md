# oGrab

Herramienta de línea de comandos que lee la salida de `nmap -oG` (formato grepable), muestra los puertos abiertos con su servicio y copia la lista al clipboard, lista para pegarla en otro comando (`22,80,443`).

## Instalación

```bash
git clone <url-de-tu-repo> ograb
cd ograb
./install.sh
```

El instalador copia `ograb` a `/usr/local/bin` (con `sudo`) o, si prefieres, a `~/.local/bin`:

```bash
./install.sh --user
```

Requisitos: Python 3. Para copiar al clipboard necesitas alguno de: `pbcopy` (macOS), `clip.exe` (WSL), `wl-copy`, `xclip` o `xsel` (Linux), o `pip install pyperclip`.

## Uso

```bash
nmap -oG escaneo 10.0.0.5
ograb escaneo
```

Funciona con cualquier nombre de archivo; no importa la extensión.

Ejemplo de salida:

```
=== escaneo ===

  10.0.0.5 (srv1)
       22/tcp  ssh  OpenSSH 8.9
       80/tcp  http  nginx
      443/tcp  https

Puertos: 22,80,443
[+] Copiado al clipboard
```

### Opciones

| Opción | Descripción |
|---|---|
| `--all` | Incluye también puertos closed y filtered |
| `--no-copy` | No copia al clipboard |

Se pueden pasar varios archivos a la vez; los puertos se juntan en una sola lista sin repetirse y ordenados:

```bash
ograb scan1 scan2 scan3
```

## Desinstalar

```bash
sudo rm /usr/local/bin/ograb
# o, si instalaste con --user:
rm ~/.local/bin/ograb
```
