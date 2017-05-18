# docker-minecraft-server

A Docker container for Minecraft Server configured with environment variables.

## Installation

```sh
docker pull silenthunter44/docker-minecraft-server:latest
```

## Run

Run the default configuration with the following:

```sh
docker run --detach --name minecraft-server --publish 25565 silenthunter44/docker-minecraft-server:latest
```

Alternatively, you can use an external volume for data and configuration, and/or environment variables:

```sh
docker run --detach --name minecraft-server  \
  --volume /local-path-to-minecraft:/minecraft \
  --publish 25565 \
  --env MC_XMS=1024M \
  --env MC_XMX=4096M \
  silenthunter44/docker-minecraft-server:latest
```

## Ports

- `25565`: Minecraft Server listening TCP port

## Volumes

- `/minecraft`: data, configuration and logfiles

## Configuration

This Minecraft Server container can be configured with the following environment variables:

- Global:
  - `MC_XMS`: initial memory allocation pool for the JVM (default to `1024M`)
  - `MC_XMX`: maximum memory allocation pool for the JVM (default to `$MC_XMS`)
  - `MC_JAR`: path to the `minecraft-server.jar` file  (default to `/minecraft/minecraft_server.jar`)
  - `MC_CONFIGFILE`: path to the `server.properties` file  (default to `/minecraft/server.properties`)
  - `MC_SAVEINTERVAL`: minutes between 2 `/save-all` invocation (default to `30`)

- Minecraft Server's `server.properties` file:
  - `MC_ALLOWFLIGHT`: allows users to use flight on your server while in Survival mode, if they have a mod that provides flight installed (default to `false`)
  - `MC_ALLOWNETHER`: allows players to travel to the Nether (default to `true`)
  - `MC_ANNOUNCEPLAYERACHIEVEMENTS`: allows server to announce when a player gets an achievement (default to `true`)
  - `MC_DIFFICULTY`: fefines the difficulty of the server (default to `1`)
  - `MC_ENABLECOMMANDBLOCK`: enables command blocks (default to `false`)
  - `MC_ENABLEQUERY`: enables GameSpy4 protocol server listener (default to `false`)
  - `MC_ENABLERCON`: enables remote access to the server console (default to `false`)
  - `MC_FORCEGAMEMODE`: force players to join in the default game mode (default to `false`)
  - `MC_GAMEMODE`: defines the mode of gameplay (default to `0`)
  - `MC_GENERATESTRUCTURES`: defines whether structures (such as villages) will be generated (default to `true`)
  - `MC_GENERATORSETTINGS`: the settings used to customize world generation
  - `MC_HARDCORE`: if set to true, players will be set to spectator mode if they die (default to `false`)
  - `MC_LEVELNAME`: the "level-name" value will be used as the world name and its folder name (default to `world`)
  - `MC_LEVELSEED`: add a seed for your world
  - `MC_LEVELTYPE`: determines the type of map that is generated (default to `DEFAULT`)
  - `MC_MAXBUILDHEIGHT`: the maximum height in which building is allowed (default to `256`)
  - `MC_MAXPLAYERS`: the maximum number of players that can play on the server at the same time (default to `20`)
  - `MC_MAXTICKTIME`: the maximum number of milliseconds a single tick may take (default to `60000`)
  - `MC_MAXWORLDSIZE`: this sets the maximum possible size in blocks, expressed as a radius, that the world border can obtain (default to `29999984`)
  - `MC_MOTD`: this is the message that is displayed in the server list of the client, below the name (default to `A Minecraft Server`)
  - `MC_NETWORKCOMPRESSIONTHRESHOLD`: by default it allows packets that are n-1 bytes big to go normally, but a packet that n bytes or more will be compressed down (default to `256`)
  - `MC_ONLINEMODE`: server checks connecting players against Minecraft's account database (default to `true`)
  - `MC_OPPERMISSIONLEVEL`: sets the default permission level for ops when using `/op` (default to `4`)
  - `MC_PLAYERIDLETIMEOUT`: if non-zero, players are kicked from the server if they are idle for more than that many minutes (default to `0`)
  - `MC_PREVENTPROXYCONNECTIONS`: if the ISP/AS sent from the server is different from the one from Mojang's authentication server, the player is kicked (default to `false`)
  - `MC_PVP`: enable PvP on the server (default to `true`)
  - `MC_RESOURCEPACKSHA1`: optional SHA-1 digest of the resource pack, in lowercase hexadecimal
  - `MC_RESOURCEPACK`: optional URI to a resource pack
  - `MC_SNOOPERENABLED`: sets whether the server sends snoop data regularly to [http://snoop.minecraft.net](http://snoop.minecraft.net) (default to `true`)
  - `MC_SPAWNANIMALS`: determines if animals will be able to spawn (default to `true`)
  - `MC_SPAWNMONSTERS`: determines if monsters will be spawned (default to `true`)
  - `MC_SPAWNNPCS`: determines whether villagers will be spawned (default to `true`)
  - `MC_SPAWNPROTECTION`: determines the radius of the spawn protection as (x*2)+1 (default to `16`)
  - `MC_USENATIVETRANSPORT`: Linux server performance improvements: optimized packet sending/receiving on Linux (default to `true`)
  - `MC_VIEWDISTANCE`: sets the amount of world data the server sends the client, measured in chunks in each direction of the player (default to `10`)
  - `MC_WHITELIST`: enables a whitelist on the server (default to `false`)

For more information, see [http://minecraft.gamepedia.com/Server.properties](http://minecraft.gamepedia.com/Server.properties)
