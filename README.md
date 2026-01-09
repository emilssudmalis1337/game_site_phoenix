Komandas dalībnieki: Berbeņovs, Sudmalis

Projekta nosaukums: Videospēļu datubāzes sistēma "GameSite" Phoenix ietvarā

Lietotnes apraksts: GameSite ir tīmekļa lietotne, kas ļauj lietotājiem:  

Apskatīt videospēļu katalogu, kā arī izveidot jaunas vai rediģēt esošas spēles, žanrus, platformas u.c.

Instalēšanas instrukcijas:  

Lejupielādēt projektu kā ZIP failu no GitHub;  
Atzipot mapi lietotājam ērtā lokācijā;  
Pārbaudīt, vai ir instalētas visas nepieciešamās programmas: Elixir, Erlang, Phoenix un PostgreSQL DBMS;   
Ja tās nav instalētas, nepieciešams tās uzinstalēt, aplūkojot attiecīgo dokumentāciju;  
Atzipotajā mapē atvērt failu dev.exs, izmantojot kādu tekstapstrādes rīku, piemēram, Notepad++ un nomainīt "password" un "database" vērtības uz paroles un datubāzes nosaukuma vērtībām, kādas tika norādītas instalācijas procesā;  
Atvērt cmd;  
Palaist komandu cd <atzipotās_mapes_lokācija>  
Palaist komandu mix phx.server  
Web aplikāciju iespējams lietot, pārlukprogrammā atverot URL localhost:4000/games

Ekrānšāviņi un īss apraksts:

<img width="2559" height="589" alt="image" src="https://github.com/user-attachments/assets/431a6394-b2fc-4ebf-a22f-92c758dbdc14" />


Galvenais "GameSite" skats, kurā redzama tabula ar visām pievienotajām spēlēm.
<img width="2560" height="770" alt="image" src="https://github.com/user-attachments/assets/663e6df6-ffee-4439-a74d-6a6d638cd7af" />

Jaunas spēles pievienošanas skats.
<img width="2560" height="724" alt="image" src="https://github.com/user-attachments/assets/8dabec8a-62c1-48a0-8722-366f3ba698f8" />

Spēles rediģēšanas skats.

![funkc_gif](https://github.com/user-attachments/assets/ea3bf81e-2b8c-4787-b692-ff5c4522ee42)

Skats, kurā, vienam lietotājam pievienojot jaunu spēli, tā uzreiz parādās arī citam lietotājam.

Izmantoto bibliotēku saraksts:

Projektā nav izmantotas trešo pušu bibliotēkas, taču ir izmantotas iebūvētie moduļi un programmatūra, kas nepieciešama koda darbībai: Phoenix, PostgreSql un Ecto_sql.

Arhitektūras diagramma un apraksts:

![IMG-20260109-WA0007](https://github.com/user-attachments/assets/c1d22810-8a00-4c37-8055-8ae957b67a49)

Var teikt, ka šīs mājaslapas darbība pamatā balstās uz 3 galvenajiem moduļiem: Phoenix Web daļu, Pašas spēles kontekstu, kā arī datubāzes datu pārvaldību. Pēc tam, kad caur Phoenix tiek izdarīts _backend_ darbs, dati tiek sūtīti uz spēles kontekstu, kur tiek izsauktas attiecīgās spēles pievienošanas, rediģēšanas vai dzēšanas funkcijas. Šis vaicājums pēc tam pāriet uz datubāzi, kurā ar SQL vaicājumu tiek veiktas IUD darbības.

Salīdzinājuma tabula:

|               | Phoenix       | Django        |
| ------------- | ------------- | ------------- |
| Content Cell  | Content Cell  | Content Cell  |
| Content Cell  | Content Cell  | Content Cell  |
