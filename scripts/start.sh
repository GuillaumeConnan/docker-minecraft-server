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
else
    if [ -f "$MC_CONFIGFILE" ]
    then
        if [ -n "$MC_ALLOWFLIGHT" ]; then
            sed -i 's/allow-flight=.*/allow-flight='$MC_ALLOWFLIGHT'/' $MC_CONFIGFILE
        fi
        if [ -n "$MC_ALLOWNETHER" ]; then
            sed -i 's/allow-nether=.*/allow-nether='$MC_ALLOWNETHER'/' $MC_CONFIGFILE
        fi
        if [ -n "$MC_ANNOUNCEPLAYERACHIEVEMENTS" ]; then
            sed -i 's/announce-player-achievements=.*/announce-player-achievements='$MC_ANNOUNCEPLAYERACHIEVEMENTS'/' $MC_CONFIGFILE
        fi
        if [ -n "$MC_DIFFICULTY" ]; then
            sed -i 's/difficulty=.*/difficulty='$MC_DIFFICULTY'/' $MC_CONFIGFILE
        fi
        if [ -n "$MC_ENABLECOMMANDBLOCK" ]; then
            sed -i 's/enable-command-block=.*/enable-command-block='$MC_ENABLECOMMANDBLOCK'/' $MC_CONFIGFILE
        fi
        if [ -n "$MC_ENABLEQUERY" ]; then
            sed -i 's/enable-query=.*/enable-query='$MC_ENABLEQUERY'/' $MC_CONFIGFILE
        fi
        if [ -n "$MC_ENABLERCON" ]; then
            sed -i 's/enable-rcon=.*/enable-rcon='$MC_ENABLERCON'/' $MC_CONFIGFILE
        fi
        if [ -n "$MC_FORCEGAMEMODE" ]; then
            sed -i 's/force-gamemode=.*/force-gamemode='$MC_FORCEGAMEMODE'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_GAMEMODE" ]; then
            sed -i 's/gamemode=.*/gamemode='$MC_GAMEMODE'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_GENERATESTRUCTURES" ]; then
            sed -i 's/generate-structures=.*/generate-structures='$MC_GENERATESTRUCTURES'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_GENERATORSETTINGS" ]; then
            sed -i 's/generator-settings=.*/generator-settings='$MC_GENERATORSETTINGS'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_HARDCORE" ]; then
            sed -i 's/hardcore=.*/hardcore='$MC_HARDCORE'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_LEVELNAME" ]; then
            sed -i 's/level-name=.*/level-name='$MC_LEVELNAME'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_LEVELSEED" ]; then
            sed -i 's/level-seed=.*/level-seed='$MC_LEVELSEED'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_LEVELTYPE" ]; then
            sed -i 's/level-type=.*/level-type='$MC_LEVELTYPE'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_MAXBUILDHEIGHT" ]; then
            sed -i 's/max-build-height=.*/max-build-height='$MC_MAXBUILDHEIGHT'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_MAXPLAYERS" ]; then
            sed -i 's/max-players=.*/max-players='$MC_MAXPLAYERS'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_MAXTICKTIME" ]; then
            sed -i 's/max-tick-time=.*/max-tick-time='$MC_MAXTICKTIME'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_MAXWORLDSIZE" ]; then
            sed -i 's/max-world-size=.*/max-world-size='$MC_MAXWORLDSIZE'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_MOTD" ]; then
            sed -i 's/motd=.*/motd='"$MC_MOTD"'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_NETWORKCOMPRESSIONTHRESHOLD" ]; then
            sed -i 's/network-compression-threshold=.*/network-compression-threshold='$MC_NETWORKCOMPRESSIONTHRESHOLD'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_ONLINEMODE" ]; then
            sed -i 's/online-mode=.*/online-mode='$MC_ONLINEMODE'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_OPPERMISSIONLEVEL" ]; then
            sed -i 's/op-permission-level=.*/op-permission-level='$MC_OPPERMISSIONLEVEL'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_PLAYERIDLETIMEOUT" ]; then
            sed -i 's/player-idle-timeout=.*/player-idle-timeout='$MC_PLAYERIDLETIMEOUT'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_PREVENTPROXYCONNECTIONS" ]; then
            sed -i 's/prevent-proxy-connections=.*/prevent-proxy-connections='$MC_PREVENTPROXYCONNECTIONS'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_PVP" ]; then
            sed -i 's/pvp=.*/pvp='$MC_PVP'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_RESOURCEPACKSHA1" ]; then
            sed -i 's/resource-pack-sha1=.*/resource-pack-sha1='$MC_RESOURCEPACKSHA1'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_RESOURCEPACK" ]; then
            sed -i 's/resource-pack=.*/resource-pack='$MC_RESOURCEPACK'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_SNOOPERENABLED" ]; then
            sed -i 's/snooper-enabled=.*/snooper-enabled='$MC_SNOOPERENABLED'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_SPAWNANIMALS" ]; then
            sed -i 's/spawn-animals=.*/spawn-animals='$MC_SPAWNANIMALS'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_SPAWNMONSTERS" ]; then
            sed -i 's/spawn-monsters=.*/spawn-monsters='$MC_SPAWNMONSTERS'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_SPAWNNPCS" ]; then
            sed -i 's/spawn-npcs=.*/spawn-npcs='$MC_SPAWNNPCS'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_USENATIVETRANSPORT" ]; then
            sed -i 's/use-native-transport=.*/use-native-transport='$MC_USENATIVETRANSPORT'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_VIEWDISTANCE" ]; then
            sed -i 's/view-distance=.*/view-distance='$MC_VIEWDISTANCE'/' $MC_CONFIGFILE
        fi
		if [ -n "$MC_WHITELIST" ]; then
            sed -i 's/white-list=.*/white-list='$MC_WHITELIST'/' $MC_CONFIGFILE
        fi
    fi
fi

# Accept EULA : https://account.mojang.com/documents/minecraft_eula
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
