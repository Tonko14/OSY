# Cvičenie 6: Aktualizácia, zabezpečenie OS Windows a systémové politiky

## Úloha 1: Windows Update

### 1.1 Pojmy

1. Čo je Windows Update a na čo slúži?

   →Windows Update je služba systému Windows, ktorá automaticky sťahuje a inštaluje aktualizácie systému, bezpečnostné opravy, ovládače a nové funkcie.

2. Čo znamená označenie KB (napr. KB5034441)?

   →KB znamená Knowledge Base. Je to identifikačné číslo konkrétnej aktualizácie v databáze Microsoftu.

3. Vysvetlite rozdiel medzi aktualizáciou kvality (Quality) a aktualizáciou funkcií (Feature):

   →Quality update – menšie aktualizácie, ktoré opravujú chyby a bezpečnostné zraniteľnosti.

   Feature update – veľká aktualizácia systému, ktorá pridáva nové funkcie alebo zmeny v systéme.

4. Prečo je nebezpečné neaktualizovať systém? Uveďte reálny príklad:

   →Neaktualizovaný systém môže obsahovať bezpečnostné chyby, ktoré môžu hackeri zneužiť.
    Príklad: útok WannaCry ransomware, ktorý využil zraniteľnosť vo Windows a zašifroval súbory tisícom počítačov.

### 1.2 Praktická časť

**Otvorte** Nastavenia → Windows Update:

| Otázka | Odpoveď |
|--------|---------|
| Je systém aktuálny? (Áno/Nie) |nie |
| Koľko aktualizácií čaká na inštaláciu? | 4 |
| Dátum poslednej nainštalovanej aktualizácie |2025-11 |
| KB číslo poslednej aktualizácie |(KB5071959) |

**Spustite v CMD:** `wmic qfe list brief /format:table`

| Otázka | Odpoveď |
|--------|---------|
| Koľko aktualizácií vidíte vo výpise? |18 |
| HotFixID poslednej aktualizácie |KB5066790 |

**Otvorte** `services.msc` a nájdite službu Windows Update:

| Otázka | Odpoveď |
|--------|---------|
| Stav služby (Spustená/Zastavená) |spustená |
| Typ spustenia (Automaticky/Ručne/Zakázané) |ručne |

5. Čo by sa stalo, keby ste typ spustenia služby Windows Update zmenili na "Zakázané"?

   →Systém by prestal automaticky sťahovať a inštalovať aktualizácie, čím by bol menej bezpečný.

---

## Úloha 2: Zabezpečenie Windows

### 2.1 Pojmy

1. Čo je Windows Defender?

   →Windows Defender je zabudovaný antivírusový program vo Windows, ktorý chráni počítač pred vírusmi a malware.

2. Aký je rozdiel medzi rýchlym a úplným skenovaním?

   →Rýchle skenovanie kontroluje len najohrozenejšie oblasti systému, zatiaľ čo úplné skenovanie prehľadá všetky súbory a disky.

3. Čo je firewall a na čo slúži? Vysvetlite vlastnými slovami:

   →Ochrana, ktorá kontroluje sieťovú komunikáciu a blokuje nebezpečné pripojenia aby chránil počítač

4. Windows firewall má 3 profily – vymenujte ich a napíšte, kedy sa ktorý aktivuje:

 Doménový: aktivuje sa, keď je počítač pripojený k firemnej sieti s doménou.

 Súkromný: aktivuje sa v dôveryhodnej domácej alebo pracovnej sieti.

 Verejný: aktivuje sa v nedôveryhodných sieťach, napr. verejná Wi-Fi.

5. Čo znamená príkaz `wf.msc` a čo `firewall.cpl`? Aký je medzi nimi rozdiel?

   →wf.msc otvorí pokročilé nastavenia Windows Firewallu (pravidlá a profily), zatiaľ čo firewall.cpl otvorí základné grafické nastavenia firewallu; rozdiel je teda v úrovni detailov a možnostiach konfigurácie.

### 2.2 Praktická časť

**Otvorte** Zabezpečenie systému Windows a zapíšte stav:

| Komponent | Stav (OK / Varovanie / Chyba) |
|-----------|-------------------------------|
| Ochrana pred vírusmi a hrozbami |varovanie |
| Firewall a ochrana siete | ok|

**Spustite v CMD:** `netsh advfirewall show allprofiles state`

| Profil | Stav (ON/OFF) |
|--------|---------------|
| Doménový |on |
| Súkromný | on|
| Verejný | on|

6. Prečo by ste nemali firewall vypínať, aj keď vám niečo nefunguje? Čo by ste mali urobiť namiesto toho?

   →Firewall chráni počítač pred útokmi namiesto vypnutia vytvorte výnimku pre aplikáciu.

---

## Úloha 3: Lokálne politiky – gpedit.msc

### 3.1 Pojmy

1. Čo je gpedit.msc a na čo slúži?

   →gpedit.msc je nástroj na správu lokálnych politík vo Windows, ktorý umožňuje nastavovať bezpečnosť a systémové pravidlá.


2. Aký je rozdiel medzi lokálnou politikou a doménovou politikou?

   → Lokálna politika platí len pre jeden počítač, zatiaľ čo doménová politika sa aplikuje na všetky počítače pripojené k doméne.


3. Čo robí príkaz `gpupdate /force`? Kedy ho musíte spustiť?

   →→ gpupdate /force okamžite aplikuje všetky zmeny skupinových politík a spúšťa sa po ich úprave, aby sa prejavili ihneď.


4. Čo robí príkaz `gpresult /r`?

   → gpresult /r zobrazí, ktoré skupinové politiky sú aktuálne aplikované na používateľa a počítač.


5. Vysvetlite, čo je politika uzamknutia účtu a proti akému typu útoku chráni:

   →Politika uzamknutia účtu automaticky zablokuje účet po viacerých neúspešných prihláseniach a chráni tak pred Brute Force útokmi.

### 3.2 Praktická časť – politiky hesiel

**Otvorte** `gpedit.msc` → Konfigurácia počítača → Nastavenia systému Windows → Nastavenia zabezpečenia → Politiky účtov → Politika hesiel

Zapíšte aktuálne hodnoty:

| Politika | Aktuálna hodnota |
|----------|-------------------|
| Minimálna dĺžka hesla | 0 characters |
| Maximálny vek hesla |42 days |
| Heslo musí spĺňať požiadavky na zložitosť |Disabled |
| Vynútiť históriu hesiel | 0 passwords remembered |

6. Prečo je dôležité vynútiť históriu hesiel? Čo by sa stalo bez nej?

   → Vynútenie histórie hesiel zabraňuje opakovanému používaniu starých hesiel; bez nej by používateľ mohol stále používať rovnaké heslo.


### 3.3 Praktická časť – uzamknutie účtu a CMD

**Nastavte politiku uzamknutia účtu:**

1. Prah uzamknutia → **5 pokusov**
2. Potvrďte dobu uzamknutia **30 minút**
3. Spustite `gpupdate /force`

Hotovo

**Vyskúšajte zakázať CMD:**

Cesta: Konfigurácia používateľa → Šablóny pre správu → Systém → Zabrániť prístupu k príkazovému riadku

1. Zapnite politiku → spustite `gpupdate /force` → skúste otvoriť CMD

| Otázka | Odpoveď |
|--------|---------|
| Čo sa stalo po pokuse otvoriť CMD? |Prístup bol zablokovaný a CMD sa neotvorilo |
| Funguje PowerShell naďalej? (Áno/Nie) |Áno  |

2. **DÔLEŽITÉ:** Vráťte politiku späť na **Nekonfigurované** a spustite `gpupdate /force`!

Vrátené

---

## Bonusové scenáre (nepovinné)

### Scenár 1: Ransomware útok

*Kolega zavolá, že na obrazovke sa objavila správa: "Vaše súbory boli zašifrované."*

1. Čo mal mať zapnuté, aby sa tomu predišlo? (2 veci)

   →

2. Aký typ skenovania by ste spustili na ostatných PC?

   →

### Scenár 2: Nový zamestnanec

*Šéf chce: žiadny CMD, žiadne registre, heslo aspoň 10 znakov.*

1. Aký nástroj použijete? (_____.msc)

   →

2. Napíšte celú cestu v gpedit.msc k politike minimálnej dĺžky hesla:

   →

3. Napíšte celú cestu k politike zakázania CMD:

   →

4. Aký príkaz spustíte po zmene politík?

   →

### Scenár 3: Podozrivá aktivita

*V logoch je 50 neúspešných prihlásení na jeden účet za 10 minút.*

1. O aký typ útoku ide?

   →

2. Aká politika by tomu zabránila a aké hodnoty by ste nastavili?

   →