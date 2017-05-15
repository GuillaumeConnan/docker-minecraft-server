#!/bin/bash

MC_VOLUME=${MC_VOLUME:="/minecraft"}
MC_JAR=${MC_JAR:="$MC_VOLUME/minecraft_server.jar"}
MC_CONFIGFILE=${MC_CONFIGFILE:="$MC_VOLUME/server.properties"}

if [ ! -d "$MC_VOLUME" ]
then
    mkdir -p MC_VOLUME
fi

# Create/replace minecraft_server.jar
if [ -f "$MC_JAR" ]
then
    rm -f $MC_JAR
fi
cp -ruv /opt/minecraft_server.jar $MC_JAR

# Generate config if needed
if [ ! -f "$MC_CONFIGFILE" ]
then
    echo "allow-flight=${MC_ALLOWFLIGHT:=false}"                                   >  $MC_CONFIGFILE
    echo "allow-nether=${MC_ALLOWNETHER:=true}"                                    >> $MC_CONFIGFILE
    echo "announce-player-achievements=${MC_ANNOUNCEPLAYERACHIEVEMENTS:=true}"     >> $MC_CONFIGFILE
    echo "difficulty=${MC_DIFFICULTY:=1}"                                          >> $MC_CONFIGFILE
    echo "enable-command-block=${MC_ENABLECOMMANDBLOCK:=false}"                    >> $MC_CONFIGFILE
    echo "enable-query=${MC_ENABLEQUERY:=false}"                                   >> $MC_CONFIGFILE
    echo "enable-rcon=${MC_ENABLERCON:=false}"                                     >> $MC_CONFIGFILE
    echo "force-gamemode=${MC_FORCEGAMEMODE:=false}"                               >> $MC_CONFIGFILE
    echo "gamemode=${MC_GAMEMODE:=0}"                                              >> $MC_CONFIGFILE
    echo "generate-structures=${MC_GENERATESTRUCTURES:=true}"                      >> $MC_CONFIGFILE
    echo "generator-settings=$MC_GENERATORSETTINGS"                                >> $MC_CONFIGFILE
    echo "hardcore=${MC_HARDCORE:=false}"                                          >> $MC_CONFIGFILE
    echo "level-name=${MC_LEVELNAME:=world}"                                       >> $MC_CONFIGFILE
    echo "level-seed=$MC_LEVELSEED"                                                >> $MC_CONFIGFILE
    echo "level-type=${MC_LEVELTYPE:=DEFAULT}"                                     >> $MC_CONFIGFILE
    echo "max-build-height=${MC_MAXBUILDHEIGHT:=256}"                              >> $MC_CONFIGFILE
    echo "max-players=${MC_MAXPLAYERS:=20}"                                        >> $MC_CONFIGFILE
    echo "max-tick-time=${MC_MAXTICKTIME:=60000}"                                  >> $MC_CONFIGFILE
    echo "max-world-size=${MC_MAXWORLDSIZE:=29999984}"                             >> $MC_CONFIGFILE
    echo "motd=${MC_MOTD:=A Minecraft Server}"                                     >> $MC_CONFIGFILE
    echo "network-compression-threshold=${MC_NETWORKCOMPRESSIONTHRESHOLD:=256}"    >> $MC_CONFIGFILE
    echo "online-mode=${MC_ONLINEMODE:=true}"                                      >> $MC_CONFIGFILE
    echo "op-permission-level=${MC_OPPERMISSIONLEVEL:=4}"                          >> $MC_CONFIGFILE
    echo "player-idle-timeout=${MC_PLAYERIDLETIMEOUT:=0}"                          >> $MC_CONFIGFILE
    echo "prevent-proxy-connections=${MC_PREVENTPROXYCONNECTIONS:=false}"          >> $MC_CONFIGFILE
    echo "pvp=${MC_PVP:=true}"                                                     >> $MC_CONFIGFILE
    echo "resource-pack-sha1=$MC_RESOURCEPACKSHA1"                                 >> $MC_CONFIGFILE
    echo "resource-pack=$MC_RESOURCEPACK"                                          >> $MC_CONFIGFILE
    echo "server-ip="                                                              >> $MC_CONFIGFILE
    echo "server-port=25565"                                                       >> $MC_CONFIGFILE
    echo "snooper-enabled=${MC_SNOOPERENABLED:=true}"                              >> $MC_CONFIGFILE
    echo "spawn-animals=${MC_SPAWNANIMALS:=true}"                                  >> $MC_CONFIGFILE
    echo "spawn-monsters=${MC_SPAWNMONSTERS:=true}"                                >> $MC_CONFIGFILE
    echo "spawn-npcs=${MC_SPAWNNPCS:=true}"                                        >> $MC_CONFIGFILE
    echo "use-native-transport=${MC_USENATIVETRANSPORT:=true}"                     >> $MC_CONFIGFILE
    echo "view-distance=${MC_VIEWDISTANCE:=10}"                                    >> $MC_CONFIGFILE
    echo "white-list=${MC_WHITELIST:=false}"                                       >> $MC_CONFIGFILE
fi

if [ ! -f "$MC_VOLUME/eula.txt" ]
then
    echo "eula=true" > $MC_VOLUME/eula.txt
fi

chown -R minecraft:minecraft $MC_VOLUME

# Init
(                                                                    \
    cd $MC_VOLUME                                                 && \
    sudo -u minecraft /opt/jre/bin/java -Xms${MC_XMS:=1024M}         \
                                        -Xmx${MC_XMX:=$MC_XMS}       \
                                        -jar $MC_JAR                 \
                                        nogui                        \
)
