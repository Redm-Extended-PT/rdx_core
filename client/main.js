RegisterNetEvent('rdx:displayShowHelpNotification')
AddEventHandler('rdx:displayShowHelpNotification', DisplayShowHelpNotification)

function DisplayShowHelpNotification(text, location, duration){
	const string = CreateVarString(10, "LITERAL_STRING", location);
	const string2 = CreateVarString(10, "LITERAL_STRING", text);

	const struct1 = new DataView(new ArrayBuffer(48));
	struct1.setInt32(0, duration, true);

	const struct2 = new DataView(new ArrayBuffer(24));
	struct2.setBigInt64(8, BigInt(string), true);
	struct2.setBigInt64(16, BigInt(string2), true);
	Citizen.invokeNative("0xD05590C1AB38F068", struct1, struct2, 1, 1);
}


RegisterNetEvent('rdx:displayShowNotification')
AddEventHandler('rdx:displayShowNotification', DisplayShowNotification)

function DisplayShowNotification(text, duration) {
	const str = CreateVarString(10, "LITERAL_STRING", text);

	const struct1 = new DataView(new ArrayBuffer(48));
	struct1.setUint32(0, duration, true);

	const struct2 = new DataView(new ArrayBuffer(16));
	struct2.setBigUint64(8, BigInt(str), true);

	Citizen.invokeNative("0x049D5C615BD38BAD", struct1, struct2, 1);

}

RegisterNetEvent('rdx:displayTopCenterNotification')
AddEventHandler('rdx:displayTopCenterNotification', DisplayTopCenterNotification)

function DisplayTopCenterNotification(text, duration, town) {
    const struct1 = new DataView(new ArrayBuffer(4 * 4));

    struct1.setInt32(0, duration, true);

    const string = CreateVarString(10, "LITERAL_STRING", town);
    const string2 = CreateVarString(10, "LITERAL_STRING", text);
    const struct2 = new DataView(new ArrayBuffer(24));

    struct2.setBigInt64(8, BigInt(string), true);
    struct2.setBigInt64(16, BigInt(string2), true);

    Citizen.invokeNative("0xD05590C1AB38F068", struct1, struct2, 1, 1);
}

RegisterNetEvent('rdx:displayLeftNotification')
AddEventHandler('rdx:displayLeftNotification', DisplayLeftNotification)

function DisplayLeftNotification(title, subTitle, dict, icon, duration) {
	const struct1 = new DataView(new ArrayBuffer(48));
	struct1.setInt32(0, duration, true);

	const string1 = CreateVarString(10, "LITERAL_STRING", title);
	const string2 = CreateVarString(10, "LITERAL_STRING", subTitle);
	const struct2 = new DataView(new ArrayBuffer(56));
	struct2.setBigInt64(8, BigInt(string1), true);
	struct2.setBigInt64(16, BigInt(string2), true);
	struct2.setBigInt64(32, BigInt(GetHashKey(dict)), true);
	struct2.setBigInt64(40, BigInt(GetHashKey(icon)), true);
	struct2.setBigInt64(48, BigInt(GetHashKey("COLOR_WHITE")), true);

	Citizen.invokeNative("0x26E87218390E6729", struct1, struct2, 1, 1);
}

RegisterNetEvent('rdx:displayShowAdvancedNotification')
AddEventHandler('rdx:displayShowAdvancedNotification', DisplayShowAdvancedNotification)

function DisplayShowAdvancedNotification(text, dict, icon, text_color, duration) {
	const _text = CreateVarString(10, "LITERAL_STRING", text);
	const _dict = CreateVarString(10, "LITERAL_STRING", dict);
	const sdict = CreateVarString(10, "LITERAL_STRING", "Transaction_Feed_Sounds");
	const sound = CreateVarString(10, "LITERAL_STRING", "Transaction_Positive");

	const struct1 = new DataView(new ArrayBuffer(48));
	struct1.setInt32(0, duration, true);
	struct1.setBigInt64(8, BigInt(sdict), true);
	struct1.setBigInt64(16, BigInt(sound), true);


	const struct2 = new DataView(new ArrayBuffer(76));
	struct2.setBigInt64(8, BigInt(_text), true);
	struct2.setBigInt64(16, BigInt(_dict), true);
	struct2.setBigInt64(24, BigInt(GetHashKey(icon)), true);
	struct2.setBigInt64(40, BigInt(GetHashKey(text_color)), true);
	struct2.setInt32(48, 0, true); // quality stars or something works without icon

	Citizen.invokeNative("0xB249EBCB30DD88E0", struct1, struct2, 1);
}
