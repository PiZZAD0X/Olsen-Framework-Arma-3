// AUTHOR: StatusRed
//
//[this, "Insurgent_OP_SL"] call FNC_GearScript;
//[this, "Insurgent_OP_Marksman"] call FNC_GearScript;
//[this, "Insurgent_OP_MG"] call FNC_GearScript;
//[this, "Insurgent_OP_Rifleman"] call FNC_GearScript;
//[this, "Insurgent_IND_SL"] call FNC_GearScript;
//[this, "Insurgent_IND_Marksman"] call FNC_GearScript;
//[this, "Insurgent_IND_MG"] call FNC_GearScript;
//[this, "Insurgent_IND_Rifleman"] call FNC_GearScript;

#define package "Insurgent_"

SET_GROUP(OP_SL_UNIFORM)
  ["UK3CB_TKC_C_U_02_B"] call FNC_AddItem;
	["usm_headwrap_blk"] call FNC_AddItem;
END_GROUP;

SET_GROUP(OP_MARKSMAN_UNIFORM)
  ["UK3CB_TKC_C_U_02_D"] call FNC_AddItem;
	["UK3CB_TKC_H_Turban_06_1"] call FNC_AddItem;
END_GROUP;

SET_GROUP(OP_MG_UNIFORM)
  ["UK3CB_TKC_C_U_06_B"] call FNC_AddItem;
	["UK3CB_TKC_H_Turban_01_1"] call FNC_AddItem;
END_GROUP;

SET_GROUP(OP_RIFLEMAN_UNIFORM)
  ["UK3CB_TKC_C_U_03_C"] call FNC_AddItem;
END_GROUP;

SET_GROUP(IND_SL_UNIFORM)
  ["UK3CB_TKM_I_U_04"] call FNC_AddItem;
	["UK3CB_TKC_H_Turban_05_1"] call FNC_AddItem;
	["UK3CB_G_Face_Wrap_01"] call FNC_AddItem;
END_GROUP;

SET_GROUP(IND_MARKSMAN_UNIFORM)
  ["UK3CB_TKM_I_U_01_C"] call FNC_AddItem;
	["LOP_H_Turban_mask"] call FNC_AddItem;
END_GROUP;

SET_GROUP(IND_MG_UNIFORM)
  ["UK3CB_TKM_I_U_04"] call FNC_AddItem;
  ["UK3CB_TKC_H_Turban_04_1"] call FNC_AddItem;
END_GROUP;

SET_GROUP(IND_RIFLEMAN_UNIFORM)
  ["UK3CB_TKM_I_U_05_B"] call FNC_AddItem;
END_GROUP;

SET_GROUP(MEDS)
	["ACE_fieldDressing", 4, "uniform"] call FNC_AddItem;
	["ACE_elasticBandage", 1, "uniform"] call FNC_AddItem;
	["ACE_packingBandage", 1, "uniform"] call FNC_AddItem;
	["ACE_morphine", 2, "uniform"] call FNC_AddItem;
	["ACE_epinephrine", 2, "uniform"] call FNC_AddItem;
	["ACE_tourniquet", 1, "uniform"] call FNC_AddItem;
  ["ACE_splint", 1] call FNC_AddItem;
END_GROUP;

SET_GROUP(ITEMS)
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	["ACE_MapTools"] call FNC_AddItem;
	["ACE_earplugs"] call FNC_AddItem;
END_GROUP;

case (package + "OP_SL"): {
	["V_BandollierB_blk"] call FNC_AddItem;  // Vest

	ADD_GROUP(OP_SL_UNIFORM);
	ADD_GROUP(ITEMS);
  ADD_GROUP(MEDS);

	["rhs_mag_an_m8hc", 1] call FNC_AddItem; // White smoke
	["rhs_mag_m67", 1] call FNC_AddItem; // Frag grenade

  ["rhs_30Rnd_545x39_7N22_desert_AK", 6] call FNC_AddItem; // Magazines
	["10Rnd_9x21_Mag", 5]; // Pistol magazines

	["rhs_weap_ak74m_desert"] call FNC_AddItem; // Primary rifle
	["hgun_Pistol_01_F"] call FNC_AddItem; // Pistol

	["Binocular"] call FNC_AddItem; // Binoculars
	["ACRE_PRC343", 1] call FNC_AddItem; // 343 radio

};

case (package + "OP_Marksman"): {
	ADD_GROUP(OP_MARKSMAN_UNIFORM);
	ADD_GROUP(ITEMS);
  ADD_GROUP(MEDS);

	["rhs_mag_an_m8hc", 1] call FNC_AddItem; // White smoke

	["UK3CB_Enfield_Mag", 10] call FNC_AddItem; // Magazines

	["UK3CB_Enfield_Rail"] call FNC_AddItem; // Primary rifle

};

case (package + "OP_MG"): {
	["UK3CB_V_Belt_Rig_Lite_KHK"] call FNC_AddItem;  // Vest

	ADD_GROUP(OP_MG_UNIFORM);
	ADD_GROUP(ITEMS);
  ADD_GROUP(MEDS);

	["rhs_mag_an_m8hc", 1] call FNC_AddItem; // White smoke

	["rhs_100Rnd_762x54mmR", 2] call FNC_AddItem; // Magazines
  ["rhs_100Rnd_762x54mmR_green", 1] call FNC_AddItem; // Magazines

	["rhs_weap_pkm"] call FNC_AddItem; // Primary rifle

};

case (package + "OP_Rifleman"): {
	ADD_GROUP(OP_RIFLEMAN_UNIFORM);
	ADD_GROUP(ITEMS);
  ADD_GROUP(MEDS);

	["rhs_30Rnd_762x39mm_bakelite", 5] call FNC_AddItem; // Magazines
  ["rhs_30Rnd_762x39mm_bakelite_tracer", 2] call FNC_AddItem; // Magazines

	["rhs_weap_akms"] call FNC_AddItem; // Primary rifle

};

case (package + "IND_SL"): {
	["V_BandollierB_blk"] call FNC_AddItem;  // Vest

	ADD_GROUP(IND_SL_UNIFORM);
	ADD_GROUP(ITEMS);
  ADD_GROUP(MEDS);

	["rhs_mag_an_m8hc", 1] call FNC_AddItem; // White smoke
	["rhs_mag_m67", 1] call FNC_AddItem; // Frag grenade

  ["rhs_30Rnd_545x39_7N22_desert_AK", 6] call FNC_AddItem; // Magazines
	["10Rnd_9x21_Mag", 5]; // Pistol magazines

	["rhs_weap_ak74m_desert"] call FNC_AddItem; // Primary rifle
	["hgun_Pistol_01_F"] call FNC_AddItem; // Pistol

	["Binocular"] call FNC_AddItem; // Binoculars
	["ACRE_PRC343", 1] call FNC_AddItem; // 343 radio

};

case (package + "IND_Marksman"): {
	ADD_GROUP(IND_MARKSMAN_UNIFORM);
	ADD_GROUP(ITEMS);
  ADD_GROUP(MEDS);

	["rhs_mag_an_m8hc", 1] call FNC_AddItem; // White smoke

	["UK3CB_Enfield_Mag", 10] call FNC_AddItem; // Magazines

	["UK3CB_Enfield_Rail"] call FNC_AddItem; // Primary rifle

};

case (package + "IND_MG"): {
	["UK3CB_V_Belt_Rig_Lite_KHK"] call FNC_AddItem;  //Vest

	ADD_GROUP(IND_MG_UNIFORM);
	ADD_GROUP(ITEMS);
  ADD_GROUP(MEDS);

	["rhs_mag_an_m8hc", 1] call FNC_AddItem; // White smoke

	["rhs_100Rnd_762x54mmR", 2] call FNC_AddItem; // Magazines
  ["rhs_100Rnd_762x54mmR_green", 1] call FNC_AddItem; // Magazines

	["rhs_weap_pkm"] call FNC_AddItem; // Primary rifle

};

case (package + "IND_Rifleman"): {
	ADD_GROUP(IND_RIFLEMAN_UNIFORM);
	ADD_GROUP(ITEMS);
  ADD_GROUP(MEDS);

	["rhs_30Rnd_762x39mm_bakelite", 5] call FNC_AddItem; // Magazines
  ["rhs_30Rnd_762x39mm_bakelite_tracer", 2] call FNC_AddItem; // Magazines

	["rhs_weap_akms"] call FNC_AddItem; // Primary rifle

};
