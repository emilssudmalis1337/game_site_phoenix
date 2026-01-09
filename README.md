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

<img width="2560" height="1323" alt="image" src="https://github.com/user-attachments/assets/f2f25a1d-cb8e-4df1-baa7-963cd19be95d" />

Galvenais "GameSite" skats, kurā redzama tabula ar visām pievienotajām spēlēm.
...
Jaunas spēles pievienošanas skats.
...
Spēles rediģēšanas skats.
...
Skats, kurā, vienam lietotājam pievienojot jaunu spēli, tā uzreiz parādās arī citam lietotājam.

Izmantoto bibliotēku saraksts:

Projektā nav izmantotas trešo pušu bibliotēkas, taču ir izmantotas iebūvētie moduļi un programmatūra, kas nepieciešama koda darbībai: Phoenix, PostgreSql un Ecto_sql.

Arhitektūras diagramma un apraksts:

...
...

Salīdzinājuma tabula:

...
