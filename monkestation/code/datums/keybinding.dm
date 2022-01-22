/datum/keybinding/human/equip_swap
	key = "Ctrl+E"
	name = "equip_swap"
	full_name = "Quick-Swap Equipment"
	description = ""
	keybind_signal = COMSIG_KB_HUMAN_EQUIPSWAP_DOWN

/datum/keybinding/human/equip_swap/down(client/user)
	. = ..()
	if(.)
		return
	var/mob/living/carbon/human/H = user.mob
	H.equip_swap()
	return TRUE
