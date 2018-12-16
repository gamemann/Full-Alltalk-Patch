#include <sourcemod>

public Plugin myinfo =
{
	name = "Full Alltalk Patch",
	author = "Roy (Christian Deacon)",
	description = "Logs when sv_full_alltalk changes and then sets it to one if it's 0.",
	version = "1.0.0",
	url = "GFLClan.com"
};

ConVar g_cvFullAlltalk = null;

public void OnPluginStart()
{
	g_cvFullAlltalk = FindConVar("sv_full_alltalk");
	HookConVarChange(g_cvFullAlltalk, CVarChanged);
}

public void CVarChanged(ConVar cvCVar, const char[] sOldV, const char[] sNewV)
{
	if (g_cvFullAlltalk == null)
	{
		LogError("[FAP] `g_cvFullAlltalk` is null... Aborting...");
	}
	
	int iValue = StringToInt(sNewV);
	
	// Check what the value is being set to. If 0, then change it back and log it.
	if (iValue == 0)
	{
		g_cvFullAlltalk.SetInt(1);
		LogMessage("[FAP] `sv_full_alltalk` was set to 0! Setting it back to 1. (Old value - %s, New value - %s)", sOldV, sNewV);
	}
}