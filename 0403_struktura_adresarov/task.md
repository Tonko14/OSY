Cvičenie: Štruktúra adresárov v Linuxe + POSIX
Vyplň odpovede pod každú otázku. Pri otázkach typu áno/nie zaškrtni - [x]. Výstupy z terminálu prilep do code blokov.
Dnes nič nemažeme ani nemeniame — iba pozeráme.

Úloha 1 — Programy v systéme
1.1 Spusti ls /bin | head a vymenuj 5 príkazov, ktoré poznáš:
cat

cp

ls

mkdir

mv

1.2 Spusti which ls. Kde reálne leží ls?
Bash
/usr/bin/ls
1.3 Spusti which s nejakým iným programom (napr. python3, nano, firefox):
Bash
which nano
Výstup:

Bash
/usr/bin/nano
1.4 Aký je rozdiel medzi /bin a /sbin?
/bin obsahuje príkazy pre všetkých používateľov, zatiaľ čo /sbin obsahuje systémové nástroje pre administrátora.

Úloha 2 — Konfigurácie a používatelia
2.1 Spusti cat /etc/hostname. Ako sa volá tvoj počítač?
Bash
skola-virtualbox
2.2 Spusti cat /etc/passwd | grep $USER. Skopíruj celý riadok:
Bash
student:x:1000:1000:student,,,:/home/student:/bin/bash
2.3 Z tohto riadku zisti:
UID: 1000

Shell: /bin/bash

Domov: /home/student

2.4 Aké používateľské meno má UID 0?
root

Úloha 3 — Prieskum systému
3.1 Aký máš procesor? Spusti:
Bash
cat /proc/cpuinfo | grep "model name" | head -1
Bash
model name : Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz
3.2 Koľko máš RAM? Spusti:
Bash
cat /proc/meminfo | head -3
Bash
MemTotal:        2034032 kB
MemFree:          785124 kB
MemAvailable:    1152340 kB
3.3 Ako dlho beží systém? Spusti uptime:
Bash
 10:15:22 up 1:24,  1 user,  load average: 0.12, 0.05, 0.01
3.4 Vymenuj 3 logy, ktoré nájdeš v /var/log/:
syslog

auth.log

kern.log

3.5 Aké disky / partície máš? Spusti:
Bash
ls /dev | grep sd
Bash
sda
sda1
sda2
sda5
3.6 Bonus — spusti uname -a a zapíš výstup:
Bash
Linux skola-virtualbox 5.15.0-72-generic #79-Ubuntu SMP Wed May 17 22:19:35 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
Úloha 4 — POSIX v praxi
4.1 Funguje ls -la aj na macOS?
[x] áno

[ ] nie

4.2 Funguje ls -la v CMD na Windowse (bez WSL)?
[ ] áno

[x] nie

4.3 Prečo rovnaký bash skript beží na Linuxe aj na MacBooku?
Oba systémy dodržiavajú štandard POSIX, ktorý zabezpečuje kompatibilitu základných príkazov a nástrojov.

4.4 Vymenuj 2 OS, ktoré sú POSIX-kompatibilné (okrem Linuxu):
macOS

FreeBSD

4.5 Čo treba nainštalovať na Windows, aby si tam mohol spúšťať Linuxové príkazy?
WSL (Windows Subsystem for Linux)

Úloha 5 — Orientácia v cudzom systéme
5.1 Aká je distribúcia? Spusti:
Bash
cat /etc/os-release | head -3
Bash
PRETTY_NAME="Ubuntu 22.04.2 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
5.2 Si root alebo bežný používateľ? Spusti whoami:
Bash
student
5.3 Koľko používateľov má účet v /home? Spusti ls /home:
Bash
student  ucitel
5.4 Aká verzia jadra beží? Spusti uname -r:
Bash
5.15.0-72-generic
5.5 Vlastnými slovami: aké 3 príkazy spustíš ako prvé na novom Linuxe, aby si zistil, kde si?
whoami

pwd

ls