#include <a_samp>

forward OnClientCheckResponse(playerid, actionid, memaddr, retndata);
native SendClientCheck(playerid, actionid, memaddr, memOffset, bytesCount);
enum(<<= 1)
{
        NULL = 0,
SOBEIT = 0x5E8606
};
public OnPlayerSpawn(playerid)
{
        SendClientCheck(playerid, 72, 0, 0, 2);
        SetTimerEx("sobeitcontrol", 100, true, "i", playerid);
        return 1;
}

public OnClientCheckResponse(playerid, actionid, memaddr, retndata)
{
        if (retndata != 192 && actionid != 72)
        {
            Kick(playerid);
        }

        return 1;
}
public sobeitcontrol(playerid)
{
    new actionid = 0x5, memaddr = SOBEIT, retndata = 0x4;
    SendClientCheck(playerid, actionid, memaddr, NULL, retndata);
    return 1;
}
