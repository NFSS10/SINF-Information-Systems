-- CATEGORIAS
INSERT INTO categoria (idcategoria, nome) VALUES
  ('PC', 'Computer'),
  ('PS3', 'PlayStation 3'),
  ('PS4', 'PlayStation 4'),
  ('X360', 'XBOX 360'),
  ('XONE', 'XBOX ONE'),
  ('NDS', 'Nintendo DS'),
  ('N3DS', 'Nintendo 3DS'),
  ('NWIIU', 'Nintendo Wii U'),
  ('NSWI', 'Nintendo Switch');


-- GENERO
INSERT INTO genero (idGenero) VALUES
  ('Fight'),
  ('Car racing'),
  ('Battle royal'),
  ('Shoot them up'),
  ('RPG'),
  ('Stealth'),
  ('FPS'),
  ('Adventure'),
  ('Sport'),
  ('Platform');


-- UTILIZADORES
INSERT INTO utilizador (username, password, morada, cPostal, localidade, nome, email, dataRegisto, nif, dataNascimento, admin)
VALUES ('jahitko', '$2y$10$wQYH57AAp5nqTOKb65M6fu5iwTEcAaAJ7bYRi3dWlnZ9t.ielayBO', 'Rua do Mosteiro', '4750-792', 'Vila Cova', 'Pedro Lima', 'pdrima96@hotmail.com', '2017-12-01', '227585826', '1996-12-21', TRUE);

INSERT INTO utilizador (username, password, morada, cPostal, localidade, nome, email, dataRegisto, nif, dataNascimento, admin)
VALUES ('leave', '$2y$10$wQYH57AAp5nqTOKb65M6fu5iwTEcAaAJ7bYRi3dWlnZ9t.ielayBO', 'Rua de Silvares', '4560-835', 'Penafiel', 'Jorge Ferreira', 'jorge_17ferreira@hotmail.com', '2017-12-01', '229670253', '1994-10-22', TRUE);


-- PRODUTOS
INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0001', 'Injustice 2', 59.99, 0, 'resources/img/products/ps4/injustice2.jpg', 'resources/img/products/featured/injustice2.jpg', '2017-05-11', 'https://www.youtube.com/embed/aUOPG6UjTfI', 'Fight', 'Injustice 2 is the super-powered sequel to the hit game Injustice: Gods Among Us that allows players to build and power up the ultimate version of their favorite DC characters. Featuring a massive selection of DC Super Heroes and Super-Villains, players can personalize iconic DC characters with unique and powerful gear earned throughout the game. Additionally, for the first time, gamers can take control of how their characters look, fight and develop across a variety of game modes.', 'PS4');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0002', 'Injustice 2', 54.99, 0, 'resources/img/products/xboxone/injustice2.jpg', 'resources/img/products/featured/injustice2.jpg', '2017-05-11', 'https://www.youtube.com/embed/oDav-JfidL0',  'Fight', 'Injustice 2 is the super-powered sequel to the hit game Injustice: Gods Among Us that allows players to build and power up the ultimate version of their favorite DC characters. Featuring a massive selection of DC Super Heroes and Super-Villains, players can personalize iconic DC characters with unique and powerful gear earned throughout the game. Additionally, for the first time, gamers can take control of how their characters look, fight and develop across a variety of game modes.', 'XONE');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0003', 'Need for speed Payback', 59.99, 0, 'resources/img/products/ps4/nfspayback.jpg', 'resources/img/products/featured/nfspayback.jpg', '2017-11-10', 'https://www.youtube.com/embed/kc-OcOduEx0', 'Car racing', 'Set in the underworld of Fortune Valley, you and your crew are reunited by a search for vengeance against The House, a nefarious cartel that rules the city’s casinos, criminals, and cops.<br><br>Your car is at the center of everything you do. Craft unique rides with deeper performance and visual customization than ever before. From intense missions to high stakes car battles to jaw dropping set piece moments, Need for Speed Payback delivers an edge-of-your-seat, action-driving fantasy.', 'PS4');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria, requisitos)
VALUES ('G0004', 'Need for speed Payback', 44.99, 0, 'resources/img/products/pc/nfspayback.jpg', 'resources/img/products/featured/nfspayback.jpg', '2017-11-10', 'https://www.youtube.com/embed/kc-OcOduEx0', 'Car racing', 'Set in the underworld of Fortune Valley, you and your crew are reunited by a search for vengeance against The House, a nefarious cartel that rules the city’s casinos, criminals, and cops.<br><br>Your car is at the center of everything you do. Craft unique rides with deeper performance and visual customization than ever before. From intense missions to high stakes car battles to jaw dropping set piece moments, Need for Speed Payback delivers an edge-of-your-seat, action-driving fantasy.', 'PC', 'Need for Speed Payback system requirements (minimum)<br><ul><li>CPU: Intel i3 6300 @ 3.8GHz or AMD FX 8150 @ 3.6GHz with 4 hardware threads</li><li>RAM: 6 GB</li><li>OS: 64-bit Windows 7 or later</li><li>VIDEO CARD: Nvidia GeForce GTX 750 Ti, AMD Radeon HD 7850, or equivalent DX11 compatible GPU with 2GB of memory</li><li>FREE DISK SPACE: 30 GB</li></ul><br>Need for Speed Payback Recommended Requirements<br><ul><li>CPU: Intel i5 4690K @ 3.5GHz or AMD FX 8350 @ 4.0GHz with 4 hardware threads</li><li>RAM: 8 GB</li><li>OS: 64-bit Windows 10 or later</li><li>VIDEO CARD: AMD Radeon RX 480 4GB, NVIDIA GeForce GTX 1060 4GB, or equivalent DX11 compatible GPU with 4GB of memory</li><li>FREE DISK SPACE: 30 GB</li></ul>');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0005', 'Need for speed Payback', 59.99, 0, 'resources/img/products/xboxone/nfspayback.jpg', 'resources/img/products/featured/nfspayback.jpg', '2017-11-10', 'https://www.youtube.com/embed/kc-OcOduEx0', 'Car racing', 'Set in the underworld of Fortune Valley, you and your crew are reunited by a search for vengeance against The House, a nefarious cartel that rules the city’s casinos, criminals, and cops.<br><br>Your car is at the center of everything you do. Craft unique rides with deeper performance and visual customization than ever before. From intense missions to high stakes car battles to jaw dropping set piece moments, Need for Speed Payback delivers an edge-of-your-seat, action-driving fantasy.', 'XONE');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria, requisitos)
VALUES ('G0006', 'Playerunknowns Battlegrounds', 29.99, 10, 'resources/img/products/pc/pubg.jpg', 'resources/img/products/featured/pubg.jpg', '2017-03-23', 'https://www.youtube.com/embed/ODWCbu_cuqk', 'Battle royal', 'PLAYERUNKNOWNS BATTLEGROUNDS is a last-man-standing shooter being developed with community feedback. Starting with nothing, players must fight to locate weapons and supplies in a battle to be the lone survivor. This realistic, high tension game is set on a massive 8x8 km island with a level of detail that showcases Unreal Engine 4s capabilities. <br><br>PLAYERUNKNOWN aka Brendan Greene, is a pioneer of the Battle Royale genre. As the creator of the Battle Royale game-mode found in the ARMA series and H1Z1 : King of the Kill, Greene is co-developing the game with veteran team at Bluehole to create the most diverse and robust Battle Royale experience to date<br><br>Not Just a Game. This is BATTLE ROYALE', 'PC', 'PLAYERUNKNOWNS BATTLEGROUNDS system requirements (minimum)<br><ul><li>CPU: Intel Core i3 4340, AMD FX-6300</li><li>RAM: 6 GB</li><li>OS: 64-Bit Windows 7, Windows 8.1, Windows 10</li><li>VIDEO CARD: nVidia GeForce® GTX 660 2GB, AMD Radeon™ HD 7850 2GB</li><li>FREE DISK SPACE: 30 GB</li></ul>');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria, requisitos)
VALUES ('G0007', 'Cuphead', 15.99, 0, 'resources/img/products/pc/cuphead.jpg', 'resources/img/products/featured/cuphead.jpg', '2017-09-29', 'https://www.youtube.com/embed/D-1n15aIgsE', 'Shoot them up', 'Cuphead is a classic run and gun action game heavily focused on boss battles. Inspired by cartoons of the 1930s, the visuals and audio are painstakingly created with the same techniques of the era, i.e. traditional hand drawn cel animation, watercolor backgrounds, and original jazz recordings.<br><br>Play as Cuphead or Mugman (in single player or local co-op) as you traverse strange worlds, acquire new weapons, learn powerful super moves, and discover hidden secrets while you try to pay your debt back to the devil!', 'PC', 'Cuphead system requirements (minimum)<br><ul><li>CPU: Intel Core2 Duo E8400, 3.0GHz or AMD Athlon 64 X2 6000+, 3.0GHz or higher</li><li>RAM: 2 GB</li><li>OS: 7</li><li>VIDEO CARD: Geforce 9600 GT or AMD HD 3870 512MB or higher</li><li>FREE DISK SPACE: 20 GB</li></ul>');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria, requisitos)
VALUES ('G0008', 'Fallout 4', 30, 72, 'resources/img/products/pc/fallout4.jpg', '2015-11-10', 'https://www.youtube.com/embed/XW7Of3g2JME', 'RPG', 'Bethesda Game Studios, the award-winning creators of Fallout 3 and The Elder Scrolls V: Skyrim, welcome you to the world of Fallout 4 – their most ambitious game ever, and the next generation of open-world gaming.<br><br>As the sole survivor of Vault 111, you enter a world destroyed by nuclear war. Every second is a fight for survival, and every choice is yours. Only you can rebuild and determine the fate of the Wasteland. Welcome home.', 'PC', 'Fallout 4 system requirements (minimum)<br><ul><li>CPU: Intel Core i5-2300 2.8 GHz/AMD Phenom II X4 945 3.0 GHz or equivalent</li><li>RAM: 8 GB</li><li>OS: Windows 7/8/10 (64-bit OS required)</li><li>VIDEO CARD: NVIDIA GTX 550 Ti 2GB/AMD Radeon HD 7870 2GB or equivalent</li><li>FREE DISK SPACE: 30 GB</li></ul><br>Fallout 4 Recommended Requirements<br><ul><li>CPU: Intel Core i7 4790 3.6 GHz/AMD FX-9590 4.7 GHz or equivalent</li><li>RAM: 8 GB</li><li>OS: Windows 7/8/10 (64-bit OS required)</li><li>VIDEO CARD: NVIDIA GTX 780 3GB/AMD Radeon R9 290X 4GB or equivalent</li><li>FREE DISK SPACE: 30 GB</li></ul>');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0009', 'Assassins creed rogue', 19.99, 0, 'resources/img/products/ps3/ac_rogue.jpg', '2014-11-29', 'https://www.youtube.com/embed/RDeyI31pG8A', 'Stealth',  '18th century, North America. Amidst the chaos and violence of the French and Indian War, Shay Patrick Cormac, a fearless young member of the Brotherhood of Assassin’s, undergoes a dark transformation that will forever shape the future of the American colonies. After a dangerous mission gone tragically wrong, Shay turns his back on the Assassins who, in response, attempt to end his life. Cast aside by those he once called brothers, Shay sets out on a mission to wipe out all who turned against him and ultimately become the most feared Assassin hunter in history.<br><br>Introducing Assassin’s Creed® Rogue, the darkest chapter in the Assassin’s Creed franchise yet. As Shay, you will experience the slow transformation from Assassin to Assassin Hunter. Follow your own creed and set off on an extraordinary journey through New York City, the wild river valley, and far away to the icy cold waters of the North Atlantic in pursuit of your ultimate goal - bringing down the Assassins for good.', 'PS3');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0010', 'Battlefield 4', 59.99, 0, 'resources/img/products/xbox360/battlefield4.jpg', '2013-11-10', 'https://www.youtube.com/embed/hl-VV9loYLw', 'FPS', 'The story, according to the Battlefield website, follows American VIPs evacuation from Shanghai and an American squad struggling to make their way back home; however, still no information has been revealed about what branch of the United States military they are from, however MARPAT (MARine PATtern) camouflage can be seen on the characters throughout the trailer, as well an UH-1Y Venom leading one to assume they are US Marines. In the 17-minute gameplay trailer released on March 26, 2013, the player is seen engaging Russian special operators, confirming Russias return as a faction. In addition, China is confirmed as another faction as, at the trailers end, an unidentified caller can be heard going toward the east coast of China.<br>The trailer reveal showcased a campaign mission called "Fishing in Baku," Baku being the capital and largest city of Azerbaijan, which lies on the Caspian Seas coast.', 'X360');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0011', 'DragonBall Xenoverse 2', 59.99, 0, 'resources/img/products/switch/xenoverse2.jpg', '2016-10-25', 'https://www.youtube.com/embed/JnUbg-9v_bE', 'Fight', 'The game is very similar to its predecessor in terms of gameplay, it is mostly set in a series of 3D battle arenas mostly modeled after notable locations in the Dragon Ball universe, with the central hub being an expanded version of Toki-Toki City, called Conton City. As reported by the creators of the Game, Conton City is seven times larger than Toki-Toki City. Players are able to freely traverse this new hub world, and in some areas are even capable of flying around, however this feature will not be available from start, instead being unlocked. Players will also be able to travel to other hubs such as the Namekian Village and Friezas ship. Some skills will have to be learned through masters, like the previous game. However, some masters will be found exclusively in these extra hubs. Xenoverse 2 is the fourth Dragon Ball video game to feature character customization. Players are able to choose from the five races of the first game: Humans, Saiyans, Majins, Namekians and Friezas race. The game also features race-specific quests, minigames and transformations (the latter of which was only available to Saiyans in the first game, via the Super Saiyan forms). Players also have a much greater role in the story, as some decisions will have to be made by them. Multiplayer servers are now able to hold up to 300 players at once. The game also has a training mode called Training School. The player can use different kinds of ki blasts (Power, Homing, Rush, Paralyze and Bomb), and the ki blast type depends on the players race or Super Soul. Another interesting element in the game is that players will be able to transfer their previous data from Dragon Ball XV 2s predecessor, Dragon Ball Xenoverse. This results in the games details changing in a way that so players will be able to see the character known as the Toki Toki Citys "Hero" in the middle of the square. Players also have the choice not to do this, which results as the default character being the "Hero".', 'NSWI');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria, requisitos)
VALUES ('G0012', 'DragonBall Xenoverse 2', 39.99, 0, 'resources/img/products/pc/xenoverse2.jpg', '2016-10-25', 'https://www.youtube.com/embed/JnUbg-9v_bE', 'Fight', 'The game is very similar to its predecessor in terms of gameplay, it is mostly set in a series of 3D battle arenas mostly modeled after notable locations in the Dragon Ball universe, with the central hub being an expanded version of Toki-Toki City, called Conton City. As reported by the creators of the Game, Conton City is seven times larger than Toki-Toki City. Players are able to freely traverse this new hub world, and in some areas are even capable of flying around, however this feature will not be available from start, instead being unlocked. Players will also be able to travel to other hubs such as the Namekian Village and Friezas ship. Some skills will have to be learned through masters, like the previous game. However, some masters will be found exclusively in these extra hubs. Xenoverse 2 is the fourth Dragon Ball video game to feature character customization. Players are able to choose from the five races of the first game: Humans, Saiyans, Majins, Namekians and Friezas race. The game also features race-specific quests, minigames and transformations (the latter of which was only available to Saiyans in the first game, via the Super Saiyan forms). Players also have a much greater role in the story, as some decisions will have to be made by them. Multiplayer servers are now able to hold up to 300 players at once. The game also has a training mode called Training School. The player can use different kinds of ki blasts (Power, Homing, Rush, Paralyze and Bomb), and the ki blast type depends on the players race or Super Soul. Another interesting element in the game is that players will be able to transfer their previous data from Dragon Ball XV 2s predecessor, Dragon Ball Xenoverse. This results in the games details changing in a way that so players will be able to see the character known as the Toki Toki Citys "Hero" in the middle of the square. Players also have the choice not to do this, which results as the default character being the "Hero".', 'PC', 'DRAGON BALL XENOVERSE system requirements (minimum)<br><ul><li>CPU: Intel Core 2 Duo 2.4Ghz / AMD Athlon 64 X2 5200+, 2.6GHz</li><li>RAM: 1 GB</li><li>OS: Windows Vista (x64) / Windows 7 (x64)</li><li>VIDEO CARD: 512 MB Nvidia GeForce 8800 / ATI Radeon HD 3870</li><li>FREE DISK SPACE: 10 GB</li></ul><br>DRAGON BALL XENOVERSE Recommended Requirements<br><ul><li>CPU: Intel Core i3-530, 2.93 GHz / AMD Phenom II X4 940, 3.0GHz</li><li>RAM: 4 GB</li><li>OS: Windows Vista (x64) / Windows 7 (x64) / Windows 8 (x64)</li><li>VIDEO CARD: 1 GB Nvidia GeForce GTX 550 Ti / AMD Radeon HD 6790</li><li>FREE DISK SPACE: 10 GB</li></ul>');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0013', 'DragonBall Xenoverse 2', 49.99, 0, 'resources/img/products/xboxone/xenoverse2.jpg', '2016-10-25', 'https://www.youtube.com/embed/JnUbg-9v_bE', 'Fight', 'The game is very similar to its predecessor in terms of gameplay, it is mostly set in a series of 3D battle arenas mostly modeled after notable locations in the Dragon Ball universe, with the central hub being an expanded version of Toki-Toki City, called Conton City. As reported by the creators of the Game, Conton City is seven times larger than Toki-Toki City. Players are able to freely traverse this new hub world, and in some areas are even capable of flying around, however this feature will not be available from start, instead being unlocked. Players will also be able to travel to other hubs such as the Namekian Village and Friezas ship. Some skills will have to be learned through masters, like the previous game. However, some masters will be found exclusively in these extra hubs. Xenoverse 2 is the fourth Dragon Ball video game to feature character customization. Players are able to choose from the five races of the first game: Humans, Saiyans, Majins, Namekians and Friezas race. The game also features race-specific quests, minigames and transformations (the latter of which was only available to Saiyans in the first game, via the Super Saiyan forms). Players also have a much greater role in the story, as some decisions will have to be made by them. Multiplayer servers are now able to hold up to 300 players at once. The game also has a training mode called Training School. The player can use different kinds of ki blasts (Power, Homing, Rush, Paralyze and Bomb), and the ki blast type depends on the players race or Super Soul. Another interesting element in the game is that players will be able to transfer their previous data from Dragon Ball XV 2s predecessor, Dragon Ball Xenoverse. This results in the games details changing in a way that so players will be able to see the character known as the Toki Toki Citys "Hero" in the middle of the square. Players also have the choice not to do this, which results as the default character being the "Hero".', 'XONE');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0014', 'DragonBall Xenoverse 2', 49.99, 0, 'resources/img/products/ps4/xenoverse2.jpg', '2016-10-25', 'https://www.youtube.com/embed/JnUbg-9v_bE', 'Fight', 'The game is very similar to its predecessor in terms of gameplay, it is mostly set in a series of 3D battle arenas mostly modeled after notable locations in the Dragon Ball universe, with the central hub being an expanded version of Toki-Toki City, called Conton City. As reported by the creators of the Game, Conton City is seven times larger than Toki-Toki City. Players are able to freely traverse this new hub world, and in some areas are even capable of flying around, however this feature will not be available from start, instead being unlocked. Players will also be able to travel to other hubs such as the Namekian Village and Friezas ship. Some skills will have to be learned through masters, like the previous game. However, some masters will be found exclusively in these extra hubs. Xenoverse 2 is the fourth Dragon Ball video game to feature character customization. Players are able to choose from the five races of the first game: Humans, Saiyans, Majins, Namekians and Friezas race. The game also features race-specific quests, minigames and transformations (the latter of which was only available to Saiyans in the first game, via the Super Saiyan forms). Players also have a much greater role in the story, as some decisions will have to be made by them. Multiplayer servers are now able to hold up to 300 players at once. The game also has a training mode called Training School. The player can use different kinds of ki blasts (Power, Homing, Rush, Paralyze and Bomb), and the ki blast type depends on the players race or Super Soul. Another interesting element in the game is that players will be able to transfer their previous data from Dragon Ball XV 2s predecessor, Dragon Ball Xenoverse. This results in the games details changing in a way that so players will be able to see the character known as the Toki Toki Citys "Hero" in the middle of the square. Players also have the choice not to do this, which results as the default character being the "Hero".', 'PS4');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0015', 'Pokemon Alpha Sapphire', 44.99, 0, 'resources/img/products/n3ds/pokemon_alphasaphire.jpg', '2014-11-21', 'https://www.youtube.com/embed/wjT6OQknxX4', 'Adventure', 'Pokemon Omega Ruby and Alpha Sapphire features a massive number of Legendary Pokemon. Some can be found in both versions, and some are exclusive to a single version. Trade the Legends over to a single version, and even more Legendary Pokemon can be encountered and captured. The official site has stated “With Pokémon X, Pokémon Y, Pokémon Omega Ruby, and Pokémon Alpha Sapphire, every Legendary Pokémon discovered to date can be obtained!” Unfortunately, this is not true unless they release more methods or events with several very rare Pokemon like Jirachi, Arceus, Manaphy, and more.', 'N3DS');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0016', 'Pokemon Omega Ruby', 44.99, 0, 'resources/img/products/n3ds/pokemon_omegaruby.jpg', '2014-11-21', 'https://www.youtube.com/embed/wjT6OQknxX4', 'Adventure', 'Pokemon Omega Ruby and Alpha Sapphire features a massive number of Legendary Pokemon. Some can be found in both versions, and some are exclusive to a single version. Trade the Legends over to a single version, and even more Legendary Pokemon can be encountered and captured. The official site has stated “With Pokémon X, Pokémon Y, Pokémon Omega Ruby, and Pokémon Alpha Sapphire, every Legendary Pokémon discovered to date can be obtained!” Unfortunately, this is not true unless they release more methods or events with several very rare Pokemon like Jirachi, Arceus, Manaphy, and more.', 'N3DS');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0017', 'The Legend of Zelda Breath of the Wild', 69.99, 0, 'resources/img/products/switch/zelda_breathofthewild.jpg', '2017-03-03', 'https://www.youtube.com/embed/zw47_q9wbBE', 'Adventure', 'Forget everything you know about The Legend of Zelda games. Step into a world of discovery, exploration, and adventure in The Legend of Zelda: Breath of the Wild, a boundary-breaking new game in the acclaimed series. Travel across vast fields, through forests, and to mountain peaks as you discover what has become of the kingdom of Hyrule In this stunning Open-Air Adventure. Now on Nintendo Switch, your journey is freer and more open than ever. Take your system anywhere, and adventure as Link any way you like.', 'NSWI');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0018', 'FIFA 18', 59.99, 0, 'resources/img/products/ps3/fifa18.jpg', 'resources/img/products/featured/fifa18.jpg', '2017-09-29', 'https://www.youtube.com/embed/QV7PK8AVEKA', 'Sport', 'FIFA 18 is a football simulation video game in the FIFA series of video games, developed and published by Electronic Arts and was released worldwide on 29 September 2017 for Microsoft Windows, PlayStation 3, PlayStation 4, Xbox 360, Xbox One and Nintendo Switch. It is the 25th instalment in the FIFA series. Real Madrid forward Cristiano Ronaldo appears as the cover athlete.<br><br>FIFA 18 is the second instalment in the series to use the Frostbite 3 game engine, although some versions of the game use a different game engine. The PlayStation 4 and Xbox One versions include a continuation of "The Journey" a story-based mode that was originally in FIFA 17 entitled "The Journey: Hunter Returns". The PlayStation 3 and Xbox 360 versions, known as FIFA 18: Legacy Edition, do not contain any new gameplay features aside from updated kits and rosters.', 'PS3');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0019', 'FIFA 18', 49.99, 0, 'resources/img/products/ps4/fifa18.jpg', 'resources/img/products/featured/fifa18.jpg', '2017-09-29', 'https://www.youtube.com/embed/QV7PK8AVEKA', 'Sport', 'FIFA 18 is a football simulation video game in the FIFA series of video games, developed and published by Electronic Arts and was released worldwide on 29 September 2017 for Microsoft Windows, PlayStation 3, PlayStation 4, Xbox 360, Xbox One and Nintendo Switch. It is the 25th instalment in the FIFA series. Real Madrid forward Cristiano Ronaldo appears as the cover athlete.<br><br>FIFA 18 is the second instalment in the series to use the Frostbite 3 game engine, although some versions of the game use a different game engine. The PlayStation 4 and Xbox One versions include a continuation of "The Journey" a story-based mode that was originally in FIFA 17 entitled "The Journey: Hunter Returns". The PlayStation 3 and Xbox 360 versions, known as FIFA 18: Legacy Edition, do not contain any new gameplay features aside from updated kits and rosters.', 'PS4');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0020', 'FIFA 18', 54.99, 0, 'resources/img/products/xbox360/fifa18.jpg', 'resources/img/products/featured/fifa18.jpg', '2017-09-29', 'https://www.youtube.com/embed/QV7PK8AVEKA', 'Sport', 'FIFA 18 is a football simulation video game in the FIFA series of video games, developed and published by Electronic Arts and was released worldwide on 29 September 2017 for Microsoft Windows, PlayStation 3, PlayStation 4, Xbox 360, Xbox One and Nintendo Switch. It is the 25th instalment in the FIFA series. Real Madrid forward Cristiano Ronaldo appears as the cover athlete.<br><br>FIFA 18 is the second instalment in the series to use the Frostbite 3 game engine, although some versions of the game use a different game engine. The PlayStation 4 and Xbox One versions include a continuation of "The Journey" a story-based mode that was originally in FIFA 17 entitled "The Journey: Hunter Returns". The PlayStation 3 and Xbox 360 versions, known as FIFA 18: Legacy Edition, do not contain any new gameplay features aside from updated kits and rosters.', 'X360');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0021', 'FIFA 18', 64.00, 0, 'resources/img/products/xboxone/fifa18.jpg', 'resources/img/products/featured/fifa18.jpg', '2017-09-29', 'https://www.youtube.com/embed/QV7PK8AVEKA', 'Sport', 'FIFA 18 is a football simulation video game in the FIFA series of video games, developed and published by Electronic Arts and was released worldwide on 29 September 2017 for Microsoft Windows, PlayStation 3, PlayStation 4, Xbox 360, Xbox One and Nintendo Switch. It is the 25th instalment in the FIFA series. Real Madrid forward Cristiano Ronaldo appears as the cover athlete.<br><br>FIFA 18 is the second instalment in the series to use the Frostbite 3 game engine, although some versions of the game use a different game engine. The PlayStation 4 and Xbox One versions include a continuation of "The Journey" a story-based mode that was originally in FIFA 17 entitled "The Journey: Hunter Returns". The PlayStation 3 and Xbox 360 versions, known as FIFA 18: Legacy Edition, do not contain any new gameplay features aside from updated kits and rosters.', 'XONE');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0022', 'FIFA 18', 59.99, 0, 'resources/img/products/switch/fifa18.jpg', 'resources/img/products/featured/fifa18.jpg', '2017-09-29', 'https://www.youtube.com/embed/QV7PK8AVEKA', 'Sport', 'FIFA 18 is a football simulation video game in the FIFA series of video games, developed and published by Electronic Arts and was released worldwide on 29 September 2017 for Microsoft Windows, PlayStation 3, PlayStation 4, Xbox 360, Xbox One and Nintendo Switch. It is the 25th instalment in the FIFA series. Real Madrid forward Cristiano Ronaldo appears as the cover athlete.<br><br>FIFA 18 is the second instalment in the series to use the Frostbite 3 game engine, although some versions of the game use a different game engine. The PlayStation 4 and Xbox One versions include a continuation of "The Journey" a story-based mode that was originally in FIFA 17 entitled "The Journey: Hunter Returns". The PlayStation 3 and Xbox 360 versions, known as FIFA 18: Legacy Edition, do not contain any new gameplay features aside from updated kits and rosters.', 'NSWI');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria, requisitos)
VALUES ('G0023', 'FIFA 18', 39.99, 0, 'resources/img/products/pc/fifa18.jpg', 'resources/img/products/featured/fifa18.jpg', '2017-09-29', 'https://www.youtube.com/embed/QV7PK8AVEKA', 'Sport', 'FIFA 18 is a football simulation video game in the FIFA series of video games, developed and published by Electronic Arts and was released worldwide on 29 September 2017 for Microsoft Windows, PlayStation 3, PlayStation 4, Xbox 360, Xbox One and Nintendo Switch. It is the 25th instalment in the FIFA series. Real Madrid forward Cristiano Ronaldo appears as the cover athlete.<br><br>FIFA 18 is the second instalment in the series to use the Frostbite 3 game engine, although some versions of the game use a different game engine. The PlayStation 4 and Xbox One versions include a continuation of "The Journey" a story-based mode that was originally in FIFA 17 entitled "The Journey: Hunter Returns". The PlayStation 3 and Xbox 360 versions, known as FIFA 18: Legacy Edition, do not contain any new gameplay features aside from updated kits and rosters.', 'PC', 'FIFA 18 system requirements (minimum)<br><ul><li>CPU: Intel Core i3-2100 / AMD Phenom II X4 965 3.4 GHz</li><li>RAM: 8 GB</li><li>OS: 64-bit Windows 7</li><li>VIDEO CARD: Nvidia GeForce GTX 460 or AMD Radeon R7 260 (1 GB)</li><li>FREE DISK SPACE: 50 GB</li></ul><br>FIFA 18 Recommended Requirements<br><ul><li>CPU: Intel Core i3-6300T 3.3 GHz or AMD Athlon X4 870K 3.9 GHz</li><li>RAM: 8 GB</li><li>OS: 64-bit Windows 10</li><li>VIDEO CARD: Nvidia GeForce GTX 670 or AMD Radeon R9 270X (2 GB)</li><li>FREE DISK SPACE: 50 GB</li></ul>');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria, requisitos)
VALUES ('G0024', 'Grand Theft Auto V', 60, 66, 'resources/img/products/pc/gta5.jpg', '2015-04-14', 'https://www.youtube.com/embed/QkkoHAzjnUs', 'Adventure', 'Grand Theft Auto V for PC will take full advantage of the power of PC to deliver across-the-board enhancements including increased resolution and graphical detail, denser traffic, greater draw distances, upgraded AI, new wildlife, and advanced weather and damage effects for the ultimate open world experience.<br><br>Grand Theft Auto V for PC features the all-new First Person Mode, giving players the chance to explore the incredibly detailed world of Los Santos and Blaine County in an entirely new way across both Story Mode and Grand Theft Auto Online.<br><br>Los Santos: a sprawling sun-soaked metropolis full of self-help gurus, starlets and fading celebrities, once the envy of the Western world, now struggling to stay afloat in an era of economic uncertainty and cheap reality TV. Amidst the turmoil, three very different criminals risk everything in a series of daring and dangerous heists that could set them up for life.', 'PC', 'Grand Theft Auto V system requirements (minimum)<br><ul><li>CPU: Intel Core 2 Quad CPU Q6600 @ 2.40GHz (4 CPUs) / AMD Phenom 9850 Quad-Core Processor (4 CPUs) @ 2.5GHz</li><li>RAM: 4 GB</li><li>OS: Windows 10 64 Bit, Windows 8.1 64 Bit, Windows 8 64 Bit, Windows 7 64 Bit Service Pack 1, Windows Vista 64 Bit Service Pack 2*</li><li>VIDEO CARD: NVIDIA 9800 GT 1GB / AMD HD 4870 1GB (DX 10, 10.1, 11)</li><li>SOUND CARD: 100% DirectX 10 compatible</li><li>FREE DISK SPACE: 72 GB</li></ul><br>Grand Theft Auto V Recommended Requirements<br><ul><li>CPU: Intel Core i5 3470 @ 3.2GHz (4 CPUs) / AMD X8 FX-8350 @ 4GHz (8 CPUs)</li><li>RAM: 8 GB</li><li>OS: Windows 10 64 Bit, Windows 8.1 64 Bit, Windows 8 64 Bit, Windows 7 64 Bit Service Pack 1</li><li>VIDEO CARD: NVIDIA GTX 660 2GB / AMD HD 7870 2GB</li><li>SOUND CARD: 100% DirectX 10 compatible</li><li>FREE DISK SPACE: 72 GB</li></ul>');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria, requisitos)
VALUES ('G0025', 'Star Wars: Battlefront 2', 60, 37, 'resources/img/products/pc/battlefront_2.jpg', 'resources/img/products/featured/battlefront_2_featured.jpg', '2017-11-17', 'https://www.youtube.com/embed/FNUTWw17rkM', 'FPS', 'Embark on an endless Star Wars™ action experience from the bestselling Star Wars videogame franchise of all time.<br><br>Rush through waves of enemies on Starkiller Base with the power of your lightsaber in your hands. Storm through the jungle canopy of a hidden Rebel base on Yavin 4 with your fellow troopers, dispensing firepower from AT-STs. Line up your X-wing squadron from an attack on a mammoth First Order Star Destroyer in space. Or rise as a new Star Wars hero - Iden, an elite Imperial special forces soldier - and discover an emotional and gripping single-player story spanning thirty years.<br><br>Experience rich and living Star Wars multiplayer battlegrounds across all three eras: prequel, classic, and new trilogy. Customise and upgrade your heroes, starfighters, or troopers, each with unique abilities to exploit in battle. Ride tauntauns or take control of tanks and speeders. Down Star Destroyers the size of cities, use the Force to prove your worth against iconic characters such as Kylo Ren, Darth Maul, or Han Solo, as you play a part in a gaming experience inspired by 40 years of timeless Star Wars films.<br><br>You can become the master of your own Star Wars heros journey.', 'PC', 'Star Wars Battlefront 2 system requirements (minimum)<br><ul><li>CPU: AMD FX-6350 or Intel Core i5 6600K.</li><li>RAM: 8 GB</li><li>OS: 64-bit Windows 7 SP1, Windows 8.1 and Windows 10.</li><li>VIDEO CARD: AMD Radeon HD 7850 2GB or NVIDIA GeForce GTX 660 2GB</li><li>FREE DISK SPACE: 15 GB</li></ul><br>Star Wars Battlefront 2 Recommended Requirements<br><ul><li>CPU: AMD FX 8350 Wraith or Intel Core i7 6700 or equivalent</li><li>RAM: 16 GB</li><li>OS: 64-bit Windows 10 or later</li><li>VIDEO CARD: AMD Radeon RX 480 4GB or NVIDIA GeForce GTX 1060 3GB</li><li>FREE DISK SPACE: 15 GB</li></ul>');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria, requisitos)
VALUES ('G0026', 'H1Z1', 19.99, 0, 'resources/img/products/pc/h1z1.jpg', '2015-01-15', 'https://www.youtube.com/embed/nTMaXfEvyvw', 'Battle royal', 'H1Z1 is a battle royale game in which up to 150 players compete against each other in a last man standing deathmatch. Players can choose to play solo, in a duo, or in groups of five, with the goal of being the final person or final team remaining.<br> Players start each match by parachuting in from a random location above the map. Once they land, they must search for a way to defend themselves. This can take the form of anything from grabbing a weapon and actively hunting other players, to hiding while other players kill one another', 'PC', 'H1Z1 system requirements (minimum)<br><ul><li>CPU: Intel i3 Dual-Core with Hyper-Threading</li><li>RAM: 4 GB</li><li>OS: 64-bit Windows 7</li><li>VIDEO CARD: nVidia GeForce GTX 275 series or higher</li><li>FREE DISK SPACE:  20 GB</li></ul><br>H1Z1 Recommended Requirements<br><ul><li>CPU: Intel i5 Quad Core or higher / AMD Phenom II X6 or higher</li><li>RAM: 8 GB</li><li>OS: 64-bit Windows 7</li><li>VIDEO CARD: nVidia GeForce GTX 560 series or higher / AMD Radeon HD 6870 or higher</li><li>FREE DISK SPACE: 20 GB</li></ul>');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, imagemdestaque, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0027', 'Super Mario Odyssey', 59.9, 10, 'resources/img/products/switch/super_mario_odyssey.jpg', 'resources/img/products/featured/super_mario_odyssey_featured.jpg', '2017-10-27', 'https://www.youtube.com/embed/wGQHQc_3ycE', 'Platform', 'Super Mario Odyssey is a platform game in which players control the titular protagonist, Mario, as he travels across many worlds on the Odyssey, his hat-shaped ship, in an effort to rescue Princess Peach from Bowser, who plans to marry her. The game sees Mario traveling to various worlds known as "Kingdoms", which return to the free-roaming exploration-based level design featured in Super Mario 64 and Super Mario Sunshine, with each featuring unique designs ranging from photo-realistic cities to more fantasy-based worlds. Each kingdom has Mario searching for and clearing various objectives in order to obtain items known as Power Moons, which can power up the Odyssey and grant access to new worlds. Checkpoint flags littered throughout each world allow Mario to instantly warp to them once activated. Certain levels feature areas called "flat" zones, where Mario is placed in a side-scrolling environment similar to his appearance in the original Super Mario Bros.', 'NSWI');

INSERT INTO produto (idProduto, nome, preco, desconto, imagem, dataLancamento, video, genero, descricao, categoria)
VALUES ('G0028', 'Overwatch', 59.99, 53, 'resources/img/products/ps4/overwatch.jpg', '2016-05-24', 'https://www.youtube.com/embed/FqnKB22pOC0', 'FPS', 'Overwatch is a team-based multiplayer online first-person shooter video game developed and published by Blizzard Entertainment. It was released in May 2016 for Windows, PlayStation 4, and Xbox One. Overwatch assigns players into two teams of six, with each player selecting from a roster of over 20 characters, known in-game as "heroes", each with a unique style of play, whose roles are divided into four general categories: Offense, Defense, Tank, and Support. Players on a team work together to secure and defend control points on a map or escort a payload across the map in a limited amount of time', 'PS4');

-- LOJAS
INSERT INTO loja (idLoja, localidade) VALUES ('A1', 'Penafiel');
INSERT INTO loja (idLoja, localidade) VALUES ('A2', 'Porto');
INSERT INTO loja (idLoja, localidade) VALUES ('A3', 'Lisboa');
INSERT INTO loja (idLoja, localidade) VALUES ('A4', 'Barcelos');

-- PRODUTO-LOJA
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (20, 'G0001', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0001', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0001', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (9, 'G0001', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0002', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0002', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (12, 'G0002', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0002', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0003', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0003', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (6, 'G0003', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0003', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0004', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0004', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (20, 'G0004', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (1, 'G0004', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0005', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0005', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0005', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0005', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0006', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0006', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (7, 'G0006', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0006', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0007', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0007', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (4, 'G0007', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0007', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (3, 'G0008', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (6, 'G0008', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (9, 'G0008', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0008', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0009', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (10, 'G0009', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0009', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0009', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (3, 'G0010', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (3, 'G0010', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0010', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (1, 'G0010', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0011', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (3, 'G0011', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0011', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0011', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0012', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (4, 'G0012', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (3, 'G0012', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (10, 'G0012', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0013', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0013', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (3, 'G0013', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (7, 'G0013', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0014', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0014', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (3, 'G0014', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (1, 'G0014', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0015', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0015', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (3, 'G0015', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (1, 'G0015', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0016', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (3, 'G0016', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0016', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0016', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0017', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (9, 'G0017', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0017', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0017', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0018', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (9, 'G0018', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0018', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0018', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0019', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (9, 'G0019', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (1, 'G0019', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0019', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (1, 'G0020', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (9, 'G0020', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0020', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (6, 'G0020', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0021', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0021', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0021', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0021', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0022', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (9, 'G0022', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (10, 'G0022', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0022', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (6, 'G0023', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (9, 'G0023', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0023', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0023', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (7, 'G0024', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (4, 'G0024', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (7, 'G0024', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0024', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0025', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0025', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (9, 'G0025', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0025', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (3, 'G0026', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0026', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (15, 'G0026', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (2, 'G0026', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (3, 'G0027', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (7, 'G0027', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0027', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (4, 'G0027', 'A4');

INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0028', 'A1');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (0, 'G0028', 'A2');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (6, 'G0028', 'A3');
INSERT INTO produtoloja (unidades, idProduto, idLoja) VALUES (5, 'G0028', 'A4');

-- FAVORITOS
INSERT INTO favorito (idProduto, idUtilizador) VALUES ('G0002', 1);
INSERT INTO favorito (idProduto, idUtilizador) VALUES ('G0005', 1);
INSERT INTO favorito (idProduto, idUtilizador) VALUES ('G0006', 1);
INSERT INTO favorito (idProduto, idUtilizador) VALUES ('G0011', 1);
INSERT INTO favorito (idProduto, idUtilizador) VALUES ('G0002', 2);
INSERT INTO favorito (idProduto, idUtilizador) VALUES ('G0003', 2);
INSERT INTO favorito (idProduto, idUtilizador) VALUES ('G0018', 2);
INSERT INTO favorito (idProduto, idUtilizador) VALUES ('G0020', 2);


-- ORDEM
INSERT INTO ordem (idOrdem, comprador)
VALUES ('A1', 2);

-- REVIEWS
INSERT INTO review (idOrdem, idProduto, pontuacao)
VALUES ('A1', 'G0001', 5);

