# Inštalácia Linuxu na 312 Počítačoch

Tento projekt poskytuje rôzne možnosti, ako nainštalovať Linux na 312 počítačoch. Pre rôzne prípady použitia sú tu opísané rôzne metódy: PXE boot, VirtualBox, WSL, Bootable USB, Cloning a Docker.

## Obsah
- [Úvod](#úvod)
- [Možnosti inštalácie](#možnosti-inštalácie)
  - [PXE Boot](#pxe-boot)
  - [VirtualBox](#virtualbox)
  - [WSL](#wsl)
  - [Bootable USB](#bootable-usb)
  - [Cloning](#cloning)
  - [Docker](#docker)
- [Správa a údržba](#správa-a-údržba)
- [Záver](#záver)

## Úvod

Tento dokument poskytuje prehľad o možnostiach nasadenia Linuxu na viac ako 300 počítačoch.

## Možnosti inštalácie

### Prehľad možností inštalácie

| Možnosť inštalácie   | Popis                                                           | Výhody                                                                 | Nevýhody                                                    |
|----------------------|-----------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------|
| **PXE Boot**         | Inštalácia cez sieť (nepotrebujete USB ani CD).                 | Rýchla inštalácia na viacerých počítačoch, centrálna správa.            | Potrebuje nastavený sieťový server a špecifické nastavenie BIOS-u. |
| **VirtualBox**       | Virtuálne stroje na hosťovaní Linuxu.                           | Jednoduché nastavenie, rýchla konfigurácia.                           | Vyžaduje silný hardware, náročné na zdroje.                 |
| **WSL (Windows Subsystem for Linux)** | Spustenie Linuxu priamo na Windows systéme.              | Nevyžaduje dual-boot, rýchle a jednoduché nastavenie.                   | Nie je plný Linux, obmedzená kompatibilita s niektorými nástrojmi. |
| **Bootable USB**     | Vytvorenie bootovateľného USB kľúča a inštalácia na každý počítač.| Jednoduché a efektívne pre malé až stredné nasadenia.                   | Vyžaduje manuálnu inštaláciu na každý počítač.               |
| **Cloning (Clonezilla/Fog)** | Použitie obrazu systému pre viaceré počítače.              | Rýchla inštalácia na veľký počet počítačov.                            | Komplikovaná príprava a konfigurácia, závislé na hardvérovej kompatibilite. |
| **Docker**           | Nasadenie Linux kontajnerov na serveroch.                      | Efektívna správa systémov, rýchla distribúcia aplikácií.                | Vyžaduje podporu virtualizácie, nie je plný OS.             |

---

### Detaily inštalácie podľa metódy

#### PXE Boot

| Krok       | Popis                                                                                       |
|------------|---------------------------------------------------------------------------------------------|
| 1. Nastavenie DHCP servera | Nastavte **DHCP server** na poskytovanie IP adries pre počítače. |
| 2. Nastavenie TFTP servera | Rozbaľte inštalačné ISO a nastavte **TFTP server** na distribúciu súborov. |
| 3. Konfigurácia BIOS | Uistite sa, že počítače podporujú bootovanie cez sieť (PXE boot) a povolte túto možnosť v BIOS-e. |
| 4. Automatizácia inštalácie | Použite **preseed** (v Ubuntu) alebo **kickstart** (v Red Hat) pre automatizovanú inštaláciu. |

#### VirtualBox

| Krok       | Popis                                                                                       |
|------------|---------------------------------------------------------------------------------------------|
| 1. Inštalácia VirtualBoxu | Stiahnite a nainštalujte **VirtualBox** na hosťovacie systémy. |
| 2. Vytvorenie virtuálneho stroja | Vytvorte virtuálne stroje pre každý počítač so zvolenou distribúciou Linuxu. |
| 3. Konfigurácia VM | Nastavte parametre VM (RAM, CPU, disk), aby vyhovovali požiadavkám Linuxu. |
| 4. Nasadenie a testovanie | Po spustení VM nainštalujte a otestujte Linux. |

#### WSL (Windows Subsystem for Linux)

| Krok       | Popis                                                                                       |
|------------|---------------------------------------------------------------------------------------------|
| 1. Aktivácia WSL | Spustite **PowerShell** a zadajte príkaz: `wsl --install` na aktiváciu WSL. |
| 2. Výber distribúcie | Nainštalujte požadovanú distribúciu (napr. Ubuntu) cez **Microsoft Store**. |
| 3. Spustenie Linuxu | Po inštalácii distribúcie ju spustite príkazom `wsl` a začnite používať Linux. |

#### Bootable USB

| Krok       | Popis                                                                                       |
|------------|---------------------------------------------------------------------------------------------|
| 1. Stiahnutie ISO | Stiahnite ISO obraz požadovanej distribúcie (napr. Ubuntu). |
| 2. Vytvorenie bootovateľného USB | Použite nástroj ako **Rufus** alebo **Etcher** na vytvorenie bootovateľného USB kľúča. |
| 3. Nastavenie BIOS | Uistite sa, že počítač bootuje z USB a spustite inštaláciu Linuxu. |
| 4. Inštalácia na každý počítač | Na každý počítač spustite inštaláciu a dokončite konfiguráciu. |

#### Cloning (Clonezilla)

| Krok       | Popis                                                                                       |
|------------|---------------------------------------------------------------------------------------------|
| 1. Vytvorenie obrazu | Na počítači, ktorý má požadovaný systém, vytvorte obraz pomocou **Clonezilla**. |
| 2. Rozšírenie obrazu | Pomocou **Fog Project** alebo **Clonezilla** distribuujte obraz na ostatné počítače. |
| 3. Otestovanie | Uistite sa, že všetky počítače majú rovnaký obraz systému a fungujú správne. |

#### Docker

| Krok       | Popis                                                                                       |
|------------|---------------------------------------------------------------------------------------------|
| 1. Inštalácia Dockeru | Na serveroch nainštalujte **Docker** pomocou príkazu: `sudo apt install docker.io`. |
| 2. Vytvorenie kontajnerov | Vytvorte Docker kontajnery s požiadavkami na Linux aplikácie. |
| 3. Nasadenie kontajnerov | Pomocou príkazu `docker run` spustite kontajnery na serveroch a distribuujte aplikácie. |

---

## Správa a údržba

Pre spravovanie Linuxu na 312 počítačoch môžete využiť nástroje ako:

| Nástroj            | Popis                                                                 |
|--------------------|-----------------------------------------------------------------------|
| **Ansible**        | Automatizácia inštalácií a konfigurácií na viacerých počítačoch.      |
| **Puppet**         | Automatizované spravovanie konfigurácií a softvéru na viacerých počítačoch. |
| **Nagios**         | Monitorovanie stavu počítačov a serverov.                            |
| **Zabbix**         | Pokročilé monitorovanie a správa infraštruktúry.                      |

---

## Záver

Tento dokument poskytol prehľad rôznych možností inštalácie a správy Linuxu na 312 počítačoch. Výber správnej metódy závisí od vašich požiadaviek na efektivitu, rýchlosť inštalácie a typ prostredia.
