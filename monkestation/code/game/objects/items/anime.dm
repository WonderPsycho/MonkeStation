//for anime
/obj/item/anime
	name = "anime dermal implant"
	desc = "You should not be seeing this item!"
	icon = 'monkestation/icons/obj/device.dmi'
	icon_state = "anime"
	var/obj/item/organ/ears/ears = null
	var/obj/item/organ/tail/tail = null

/obj/item/anime/attack_self(mob/user)
	if(ears)
		ears.Insert(user)
	if(tail)
		tail.Insert(user)
	var/msg = "<span class=danger>You feel the power of God and Anime flow through you!</span>"
	to_chat(user, msg)
	qdel(src)


/obj/item/anime/cat
	name = "anime cat dermal implant"
	desc = "It smells of ammonia"
	icon_state= "cat"
	ears = new /obj/item/organ/ears/cat
	tail = new /obj/item/organ/tail/cat


/obj/item/choice_beacon/anime // for anime trait
	name = "anime dermal implant kit"
	desc = "Summon your spirit animal."
	icon_state = "gangtool-red"

/obj/item/choice_beacon/anime/spawn_option(obj/choice, mob/living/carbon/human/M)//overwrites choice proc
	var/obj/new_item = new choice()
	var/msg = "<span class=danger>Your dermal implant box produces your chosen persona.</span>"
	to_chat(M, msg)
	var/list/slots = list (
		"backpack" = ITEM_SLOT_BACKPACK,
		"hands" = ITEM_SLOT_HANDS,
	)
	M.equip_in_one_of_slots(new_item, slots , qdel_on_fail = TRUE)

/obj/item/choice_beacon/anime/generate_display_names()
	var/static/list/personas
	if(!personas)
		personas = list()
		var/list/templist = list(/obj/item/anime/cat
							)
		for(var/V in templist)
			var/atom/A = V
			personas[initial(A.name)] = A
	return personas
