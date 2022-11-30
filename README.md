# SageMetaTool ![SMT_LOGO_SMALL](https://user-images.githubusercontent.com/26028969/204862762-d60eb930-4acc-4211-a5e4-4744f0ee100a.png)

A universal dll mod for most sage engine games that brings important engine updates and adds unique new features.

Key features:
- Fluent 60 fps with proper gamespeed - a dream finally come true
- Unlimited camera zoom (narrow and wide)
- Dozens of new unique universal gamemodes compatible with any map + live mod/config loader, all via a completely new skirmish setup sub menu
- First and third person mode with real WASD unit control (C&C renegade vibes)
- Free camera 'bird' Mode
- Meta control ingame sandbox menu to change countless different options including object spawner menu, unit colorizer, AI live adjusting/scripting
- Spawner menu auto loads all game objects available even from mods in BFME2, ROTWK and Zero Hour. 
- Powerfull ingame lua script console (Useable commands: https://pastebin.com/xHHGCVZ1)
- Heavy extension of the sage lua framework, fix of player and coordinate parameters, register of every object to be accessible via lua
- Complete Lua scripting framework for C&C generals zero hour (Useable commands: https://pastebin.com/M4wZcJKv)
- CNC Online and T3A Online implemented
- New Key remapping menu
- Skirmish/Campaign/Multiplayer support in most games with version 0.5+ (BFME1+2 Campaign WIP)
- Integrated mod launcher for Tiberium Wars, Kane's Wrath, Red Alert 3 mods plus Age of The Ring

Supported games (9/10 sage games, note: also works for all mods automatically):

![SuppprtedGames](https://user-images.githubusercontent.com/26028969/145710215-ffac9e00-9a3d-4dc6-ae7b-0cbf4d328c0a.PNG)
(Note: Origin and Retail/DVD game versions are now supported as well if you apply the compatibility pack patch. The download link for that is included in the main download.)
- Command and Conquer Generals Zero Hour (retail 1.04 or nocd, WIP)
- Lord of the Rings The Battle for Middle-earth 1 (retail nocd)
- Lord of the Rings The Battle for Middle-earth 2 (retail nocd)
- Lord of the Rings The Battle for Middle-earth 2 - Rise of the Witch-King (retail nocd)
- Command and Conquer 3 Tiberium Wars (steam)
- Command and Conquer 3 Kane's Wrath (steam)
- Command and Conquer Red Alert 3 (steam)
- Command and Conquer Red Alert 3 Uprising (steam)
- Command and Conquer 4 (all versions steam/origin) (WIP)

By using advanced signature (binary pattern) scanning methods all sub versions should be supported as well in the future.

Only the original Command and Conquer Generals is not yet supported in any way because I strongly believe most use zero hour anyway.

A special thanks goes to:

- all testers and patrons - especially hooten, darkyuri and all others

# Download

A early version can be downloaded [here](https://www.patreon.com/posts/53702342). Please be aware that bugs exist and it's a work in progress project.
I can't give any guarantee at this point. We have a large and helpfull [community](https://www.patreon.com/posts/52801927) playing and testing SMT currently that might be able to give help and support. Also check out the [wiki](https://github.com/MetaIdea/SageMetaTool/wiki#faq) and it's troubleshooting guide if you have issues using the tool. If you believe in my vision to enhance our beloved games your support is highly appreciated and makes a difference !

# Previews (click the links):

Launcher:

![preview](https://user-images.githubusercontent.com/26028969/125347144-dd0b5000-e35a-11eb-9f2a-9577563aceb7.JPG)

Works with all your favourite mods:

![Works with all your favourite mods](https://user-images.githubusercontent.com/26028969/204860800-02ffb7ff-7b86-42fa-94c3-70f4feff02ac.PNG)

Gamemode menu (video):

[![Video Preview 1](https://img.youtube.com/vi/hn2ikuj7288/0.jpg)](https://www.youtube.com/watch?v=hn2ikuj7288)

First person mode (video):

[![Video Preview 2](https://img.youtube.com/vi/iyZFXCaPxiU/0.jpg)](https://www.youtube.com/watch?v=iyZFXCaPxiU)

Demonstration of the extended lua scripting framework (video):

[![Video Preview 3](https://img.youtube.com/vi/sMp1uMzCIdk/0.jpg)](https://www.youtube.com/watch?v=sMp1uMzCIdk)

One of many new scripts: Nature generator for BFME2 and ROTWK:

![3](https://user-images.githubusercontent.com/26028969/123271899-8f40bc00-d501-11eb-9ba1-cf3d2df106f3.JPG)
![saddsa](https://user-images.githubusercontent.com/26028969/123271936-9962ba80-d501-11eb-9f5a-0ffdae52adf5.JPG)

Lua live script console in C&C generals zero hour:

![script console](https://user-images.githubusercontent.com/26028969/123272044-af707b00-d501-11eb-86ab-486bd4d24d6a.JPG)

Unit customizer/colorizer

![LiveColorizer](https://user-images.githubusercontent.com/26028969/145855539-22588b43-c8fd-4d02-948c-9002ddf58162.JPG)

Demonstration of the powerfull (gamemode-) scripting capabilities: Maze Generator !

![hugemaze](https://user-images.githubusercontent.com/26028969/145855806-e2f4a6a7-9ae3-4e44-8e20-909122cfa71f.JPG)

 Drone Swarm - from the intelligent drone swarm gamemode script.

 ![DroneSwarm2](https://user-images.githubusercontent.com/26028969/145855915-13852ab0-6e34-4ae6-926d-b5c690e2a79d.JPG)

 Defend the spiral spawner gamemode preview:

 ![Unbenannt3](https://user-images.githubusercontent.com/26028969/145856100-ba3cfb64-fe96-4078-a317-d1d75177fec5.JPG)

New skirmish setup config/gamemode/mod selector sub menu, here for red alert 3:

![Unbenannt](https://user-images.githubusercontent.com/26028969/145856224-103ede5d-6fff-4aab-96c7-5cc396c716f3.JPG)

Lua scripting in RA3:

![ra3](https://user-images.githubusercontent.com/26028969/145856291-79c88baf-66e8-4e8c-a774-ade5ea1c234f.PNG)

Quick access buttons ingame (appear when map started):

![3](https://user-images.githubusercontent.com/26028969/155856496-898c3df1-3313-4f24-93cc-4d7ba00fa710.PNG)

How to enable Competitive Multiplayer Mode:

![1111](https://user-images.githubusercontent.com/26028969/201093299-d5af8ae8-e072-4cc2-a3b1-6580a09e6d56.PNG)

Gamemode system and usage:

![smt-gamemodes](https://user-images.githubusercontent.com/26028969/145856442-aaf583da-d01e-4f18-8363-15f61b713620.jpg)

Simplified Venn diagram to see the relation of SMT to other sage engine related projetcs: 

![venn](https://user-images.githubusercontent.com/26028969/145856762-990a5387-37e8-4b12-8ca6-f6463dd5f231.png)

Syberts Preview of only the 60 FPS part of a early outdated prototype of the tool:

[![Video Preview Sybert](https://img.youtube.com/vi/atDykrfu-wU/0.jpg)](https://www.youtube.com/watch?v=atDykrfu-wU)

# More

[![Discord](https://discord.com/assets/ff41b628a47ef3141164bfedb04fb220.png)](https://discord.gg/3vEazayfaV)

Here you can become a Patron and support the project short - or longterm if you believe in my vision to enhance our beloved games:

[![Patreon](https://not2grand.co.uk/wp-content/uploads/2018/07/patreon-logo.png)](https://www.patreon.com/metaidea)
