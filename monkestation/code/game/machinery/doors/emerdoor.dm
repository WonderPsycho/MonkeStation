/obj/machinery/door/emerdoor
	name = "Emergency Airlock"
	desc = "A convenable firelock. It has a card reader and a set of indicator lights on the side."
	icon = 'icons/obj/doors/doorhazard.dmi'
	icon_state = "door_open"
	opacity = FALSE
	density = FALSE
	max_integrity = 300
	resistance_flags = FIRE_PROOF
	heat_proof = TRUE
	glass = TRUE
	sub_door = TRUE
	explosion_block = 1
	safe = FALSE
	layer = BELOW_OPEN_DOOR_LAYER
	closingLayer = CLOSED_FIREDOOR_LAYER
	assemblytype = /obj/structure/firelock_frame
	armor = list("melee" = 30, "bullet" = 30, "laser" = 20, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 95, "acid" = 70, "stamina" = 0)
	interaction_flags_machine = INTERACT_MACHINE_WIRES_IF_OPEN | INTERACT_MACHINE_ALLOW_SILICON | INTERACT_MACHINE_OPEN_SILICON | INTERACT_MACHINE_REQUIRES_SILICON | INTERACT_MACHINE_OPEN
	air_tight = TRUE
	open_speed = 2
	req_one_access = list(ACCESS_ENGINE, ACCESS_ATMOSPHERICS)
	processing_flags = START_PROCESSING_MANUALLY
	var/emergency_close_timer = 0
	var/nextstate = null
	var/boltslocked = TRUE
	var/list/affecting_areas
	var/list/access_log
	var/process_ticker //Ratelimit process to one check ~5 process ticks
