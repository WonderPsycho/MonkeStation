/obj/item/organ/butt
	name = "butt"
	desc = "extremely treasured body part"
	worn_icon = 'monkestation/icons/obj/worn_butts.dmi' //Wearable on the head
	icon = 'monkestation/icons/obj/butts.dmi'
	icon_state = "ass"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_BUTT
	throw_speed = 1
	force = 4
	embedding = list("pain_mult" = 0, "jostle_pain_mult" = 0, "ignore_throwspeed_threshold" = TRUE, "embed_chance" = 20)
	hitsound = 'sound/misc/fart1.ogg'
	body_parts_covered = HEAD
	slot_flags = ITEM_SLOT_HEAD
	var/list/sound_effect  = list('sound/misc/fart1.ogg', 'monkestation/sound/effects/fart2.ogg', 'monkestation/sound/effects/fart3.ogg', 'monkestation/sound/effects/fart4.ogg')
	var/atmos_gas = "miasma=0.25;TEMP=310.15" //310.15 is body temperature
	var/fart_instability = 1 //Percent chance to lose your rear each fart.
	var/cooling_down = FALSE

//ADMIN ONLY ATOMIC ASS
/obj/item/organ/butt/atomic
	name = "Atomic Ass"
	desc = "A highly radioactive and unstable posterior. Anyone with this is a walking war crime."
	sound_effect = list("sound/items/geiger/low1.ogg", "sound/items/geiger/low2.ogg", "sound/items/geiger/low3.ogg", "sound/items/geiger/low4.ogg")
	fart_instability = 5
	atmos_gas = "tritium=5;TEMP=600"
	icon_state = "atomicass"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/organ/butt/atomic/On_Fart(mob/user)
	var/mob/living/carbon/human/Person = user
	var/turf/Location = get_turf(user)

	if(!cooling_down)
		cooling_down = TRUE
		user.audible_message("[user] <font color='green'>farts.</font>")
		if(prob(fart_instability))
			playsound(user, "sound/machines/alarm.ogg", 100, FALSE, 50, ignore_walls=TRUE, mixer_channel = CHANNEL_SOUND_EFFECTS)
			minor_announce("The detonation of a nuclear posterior has been detected in your area. All crew are required to exit the blast radius.", "Nanotrasen Atomics", 0)
			Person.Paralyze(120)
			Person.electrocution_animation(120)
			spawn(120)
				Location = get_turf(user)
				dyn_explosion(Location, 20,10)
				cooling_down = FALSE
		else
			playsound(user, pick(sound_effect), 50, TRUE, mixer_channel = CHANNEL_SOUND_EFFECTS)
			Location.atmos_spawn_air(atmos_gas)
			spawn(20)
				cooling_down = FALSE
	//Do NOT call parent on this.
	//Unique functionality.

//BLUESPACE ASS
/obj/item/organ/butt/bluespace
	name = "Bluespace Posterior"
	desc = "Science isn't about why, it's about why not!"
	fart_instability = 6
	atmos_gas = "water_vapor=0.75;TEMP=50"
	icon_state = "blueass"

//IPC ASS
/obj/item/organ/butt/cyber
	name = "Flatulence Simulator"
	desc = "Designed from the ground up to create advanced humor."
	icon_state = "roboass"
	sound_effect = list('sound/machines/buzz-sigh.ogg', 'sound/machines/buzz-two.ogg', 'sound/machines/terminal_error.ogg', 'sound/weapons/ring.ogg')
	atmos_gas = "co2=0.25;TEMP=310.15"

//CLOWN ASS
/obj/item/organ/butt/clown
	name = "Clown Butt"
	desc = "A poor clown has been separated with their most funny organ."
	fart_instability = 3
	atmos_gas = "n2o=0.25;TEMP=310.15"
	icon_state = "clownass"
	sound_effect = list('sound/items/party_horn.ogg', 'sound/items/bikehorn.ogg')

/obj/item/organ/butt/clown/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/slippery, 40)

/obj/item/organ/butt/clown/On_Fart(mob/user)
	if(!cooling_down)
		var/turf/Location = get_turf(user)
		if(!locate(/obj/effect/decal/cleanable/confetti) in Location)
			new /obj/effect/decal/cleanable/confetti(Location)
	..()

//PROSTHETIC ASS
/obj/item/organ/butt/iron
	name = "The Iron Butt"
	desc = "A prosthetic replacement posterior."
	icon_state = "ironass"
	sound_effect = list('sound/machines/clockcult/integration_cog_install.ogg', 'sound/effects/clang.ogg')

//SKELETAL ASS
/obj/item/organ/butt/skeletal
	name = "Skeletal Butt"
	desc = "You don't understand how this works!"
	atmos_gas = "o2=0.25;TEMP=310.15"
	sound_effect = list("monkestation/sound/voice/laugh/skeleton/skeleton_laugh.ogg")
	icon_state =  "skeleass"

//PLASMAMAN ASS
/obj/item/organ/butt/plasma
	name = "Plasmaman Butt"
	desc = "You REALLY don't understand how this works!"
	sound_effect = list("monkestation/sound/voice/laugh/skeleton/skeleton_laugh.ogg")
	fart_instability = 5
	atmos_gas = "plasma=0.25;TEMP=310.15"
	icon_state = "plasmaass"

/obj/item/organ/butt/plasma/On_Fart(mob/user)
	if(prob(15) && !cooling_down)
		user.visible_message("<span class='danger'>[user]'s gas catches fire!</span>")
		var/turf/Location = get_turf(user)
		new /obj/effect/hotspot(Location)
	..()

//XENOMORPH ASS
/obj/item/organ/butt/xeno
	name = "Xenomorph Butt"
	desc = "Truly, the trophy of champions."
	icon_state = "xenoass"

//IMMOVABLE ASS
/obj/effect/immovablerod/butt
	name = "immovable butt"
	desc = "No, really, what the fuck is that?"
	icon = 'monkestation/icons/obj/butts.dmi'
	icon_state = "ass"

/obj/effect/immovablerod/butt/Initialize()
	. = ..()
	src.SpinAnimation(5, -1)

/obj/effect/immovablerod/butt/Bump(atom/clong)
	playsound(src,'sound/misc/fart1.ogg', 100, TRUE, 10, pressure_affected = FALSE, mixer_channel = CHANNEL_SOUND_EFFECTS)
	..()

//ACTUAL FART PROC
/obj/item/organ/butt/proc/On_Fart(mob/user)
	//VARIABLE HANDLING
	var/turf/Location = get_turf(user)
	var/mob/living/carbon/human/Person = user //We know they are human already, it was in the emote check.
	var/volume = 40
	var/true_instability = fart_instability

	//TRAIT CHECKS
	if(Person.has_quirk(/datum/quirk/loud_ass))
		volume = volume*2
	if(Person.has_quirk(/datum/quirk/unstable_ass))
		true_instability = true_instability*2
	if(Person.has_quirk(/datum/quirk/stable_ass))
		true_instability = true_instability/2

	//BIBLEFART
	//This goes above all else because it's an instagib.
	for(var/obj/item/storage/book/bible/Holy in Location)
		if(Holy)
			cooling_down = TRUE
			var/turf/T = get_step(get_step(Person, NORTH), NORTH)
			T.Beam(Person, icon_state="lightning[rand(1,12)]", time = 15)
			Person.Paralyze(15)
			Person.visible_message("<span class='warning'>[Person] attempts to fart on the [Holy], uh oh.<span>","<span class='ratvar'>What a grand and intoxicating innocence. Perish.</span>")
			playsound(user,'sound/magic/lightningshock.ogg', 50, 1, mixer_channel = CHANNEL_SOUND_EFFECTS)
			playsound(user,	'monkestation/sound/misc/dagothgod.ogg', 80, mixer_channel = CHANNEL_SOUND_EFFECTS)
			Person.electrocution_animation(15)
			spawn(15)
				Person.gib()
				dyn_explosion(Location, 1, 0)
				cooling_down = FALSE
			return

	//EMOTE MESSAGE/MOB TARGETED FARTS
	var/hit_target = FALSE
	for(var/mob/living/Targeted in Location)
		if(Targeted != user)
			user.visible_message("[user] [pick(
										"farts in [Targeted]'s face!",
										"gives [Targeted] the silent but deadly treatment!",
										"rips mad ass in [Targeted]'s mug!",
										"releases the musical fruits of labor onto [Targeted]!",
										"commits an act of butthole bioterror all over [Targeted]!",
										"poots, singing [Targeted]'s eyebrows!",
										"humiliates [Targeted] like never before!",
										"gets real close to [Targeted]'s face and cuts the cheese!")]")
			hit_target = TRUE
			break
	if(!hit_target)
		user.audible_message("[pick(world.file2list("strings/farts.txt"))]", audible_message_flags = list(CHATMESSAGE_EMOTE = TRUE))


	//SOUND HANDLING
	playsound(user, pick(sound_effect), volume , use_reverb = TRUE, pressure_affected = FALSE, mixer_channel = CHANNEL_SOUND_EFFECTS)

	//GAS CREATION, ASS DETACHMENT & COOLDOWNS
	if(!cooling_down)
		cooling_down = TRUE
		user.newtonian_move(user.dir)
		Location.atmos_spawn_air(atmos_gas)
		if(prob(true_instability))
			user.visible_message("<span class='warning'>[user]'s butt goes flying off!</span>")
			new /obj/effect/decal/cleanable/blood(Location)
			user.nutrition = max(user.nutrition - rand(5, 20), NUTRITION_LEVEL_STARVING)
			src.Remove(user)
			src.forceMove(Location)
			for(var/mob/living/Struck in Location)
				if(Struck != user)
					user.visible_message("<span class='danger'>[Struck] is struck in the face by [user]'s flying ass!</span>")
					Struck.apply_damage(10, "brute", BODY_ZONE_HEAD)
					cooling_down = FALSE
					return

		spawn(15)
			cooling_down = FALSE

//Buttbot Production
/obj/item/organ/butt/attackby(obj/item/I, mob/living/user)
	if(istype(I, /obj/item/bodypart/l_arm/robot) || istype(I, /obj/item/bodypart/r_arm/robot))
		var/mob/living/simple_animal/bot/buttbot/new_butt = new(get_turf(src))
		qdel(I)
		switch(src.type) //A BUTTBOT FOR EVERYONE!
			if(/obj/item/organ/butt/atomic)
				new_butt.name = "Atomic Buttbot"
				new_butt.desc = "Science has gone too far."
				new_butt.icon_state = "buttbot_atomic"
			if(/obj/item/organ/butt/bluespace)
				new_butt.name = "Bluespace Buttbot"
				new_butt.desc = "The peak of Nanotrasen design."
				new_butt.icon_state = "buttbot_bluespace"
			if(/obj/item/organ/butt/clown)
				new_butt.name = "Bananium Buttbot"
				new_butt.desc = "Didn't you know clown asses were made out of Bananium?"
				new_butt.icon_state = "buttbot_clown"
				new_butt.AddComponent(/datum/component/slippery, 40)
			if(/obj/item/organ/butt/cyber)
				new_butt.name = "Cybernetic Buttbot"
				new_butt.desc = "LAW ONE: BUTT"
				new_butt.icon_state = "buttbot_cyber"
			if(/obj/item/organ/butt/iron)
				new_butt.name = "Iron Buttbot"
				new_butt.desc = "We can rebutt him, we have the technology."
				new_butt.icon_state = "buttbot_iron"
			if(/obj/item/organ/butt/plasma)
				new_butt.name = "Plasma Buttbot"
				new_butt.desc = "Safer here than on it's owner."
				new_butt.icon_state = "buttbot_plasma"
			if(/obj/item/organ/butt/skeletal)
				new_butt.name = "Skeletal Buttbot"
				new_butt.desc = "Rattle Me Booty!"
				new_butt.icon_state = "buttbot_skeleton"
			if(/obj/item/organ/butt/xeno)
				new_butt.name = "Xenomorph Buttbot"
				new_butt.desc = "hiss!"
				new_butt.icon_state = "buttbot_xeno"

		playsound(src, pick('sound/misc/fart1.ogg', 'monkestation/sound/effects/fart2.ogg', 'monkestation/sound/effects/fart3.ogg', 'monkestation/sound/effects/fart4.ogg'), 25 ,use_reverb = TRUE, mixer_channel = CHANNEL_SOUND_EFFECTS)
		qdel(src)

