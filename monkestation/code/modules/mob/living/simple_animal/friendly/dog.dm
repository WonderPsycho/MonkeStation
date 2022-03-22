/mob/living/simple_animal/pet/dog/australianshepherd
	name = "\improper australian shepherd"
	real_name = "australian shepherd"
	desc = "It's an australian shepherd."
	icon = 'monkestation/icons/mob/pets.dmi'
	icon_state = "australianshepherd"
	icon_living = "australianshepherd"
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/corgi = 1) //theres no generic dog meat type
	gold_core_spawnable = FRIENDLY_SPAWN
	worn_slot_flags = ITEM_SLOT_HEAD
	head_icon = 'monkestation/icons/mob/pets_held.dmi'
	held_state = "australianshepherd"

/mob/living/simple_animal/pet/dog/australianshepherd/captain
	name = "Captain"
	real_name = "Captain"
	gender = MALE
	desc = "Captain Butthole Nugget on deck!"
	gold_core_spawnable = NO_SPAWN
	unique_pet = TRUE
	speak = list("barks!", "woofs!", "borks!", "yips!", "burks!")

/mob/living/simple_animal/pet/dog/corgi/borgi
	name = "E-N"
	real_name = "E-N"
	desc = "It's a borgi."
	icon = 'monkestation/icons/mob/pets.dmi'
	icon_state = "borgi"
	icon_living = "borgi"
	icon_dead = "borgi_dead"
	var/emagged = FALSE
	minbodytemp = 0
	loot = list(/obj/effect/decal/cleanable/robot_debris)
	del_on_death = TRUE
	deathmessage = "blows apart!"
	animal_species = /mob/living/simple_animal/pet/dog/corgi/borgi
	nofur = TRUE
	var/next_beep
	var/beepsound = 'sound/items/timer.ogg'

/mob/living/simple_animal/pet/dog/corgi/borgi/emag_act(mob/user)
	if(!emagged)
		emagged = TRUE
		visible_message("<span class='warning'>[user] swipes a card through [src].</span>")
		visible_message("<span class='notice'>You overload [src]s internal reactor.</span>")
		addtimer(CALLBACK(src, .proc/explode), 10 SECONDS)

/mob/living/simple_animal/pet/dog/corgi/borgi/proc/explode()
	visible_message("<span class='reallybig warning'>[src] makes an odd whining noise.</span>")
	explosion(get_turf(src), 0, 1, 4, 7)
	death()

/mob/living/simple_animal/pet/dog/corgi/borgi/Life(seconds, times_fired)
	..()
	//spark for no reason
	if(prob(5))
		do_sparks(3, 1, src)
	if(emagged && (world.time + 2 SECONDS > next_beep))
		playsound(src.loc, beepsound, 50)
		next_beep = world.time
