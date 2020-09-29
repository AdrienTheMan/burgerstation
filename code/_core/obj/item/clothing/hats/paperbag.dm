/obj/item/clothing/head/hat/paperbag
	name = "paper bag"
	desc = "Put the MONEY in the BAG! PUT IT IN!"
	desc_extended = "Holds items but preferably food. Can be dyed. Can apply a logo by Alt-clicking on help intent nearby, background with disarm intent. Also a fashion statement when worn (must be empty)."
	icon = 'icons/obj/item/clothing/hats/paperbag.dmi'
	var/logo = 0
	var/logobg = 0
	dynamic_inventory_count = 7
	container_held_slots = 1
	container_max_size = SIZE_1

	size = SIZE_2
	is_container = TRUE

	value = 10

	defense_rating = list(
		ARCANE = 25
	)

	polymorphs = list(
		"base" = "#F9B583",
		"logo" = "#FFFFFF",
		"logobg" = "#FFFFFF"
	)

	dyeable = TRUE

	blocks_clothing = SLOT_FACE_WRAP | SLOT_HEAD

/obj/item/clothing/head/hat/paperbag/Finalize()
	. = ..()
	update_sprite()
	return .

/obj/item/clothing/head/hat/paperbag/save_item_data(var/save_inventory = TRUE)
	. = ..()
	SAVEVAR("logo")
	SAVEVAR("logobg")
	return .

/obj/item/clothing/head/hat/paperbag/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data)
	. = ..()
	LOADVAR("logo")
	LOADVAR("logobg")
	return .

/obj/item/clothing/head/hat/paperbag/click_on_object(var/mob/caller as mob,var/atom/object,location,control,params) //The src is used on the object

	var/mob/living/C = caller
	if(C.attack_flags & ATTACK_ALT)
		if(C.intent == INTENT_DISARM)
			if(logobg < 1)
				logobg++
				update_sprite()
				caller.to_chat(span("notice","You change \the pattern from \the [src.name]."))
				return TRUE
			else
				logobg = 0
				update_sprite()
				caller.to_chat(span("notice","You wipe \the pattern from \the [src.name]."))
				return TRUE
		if(C.intent == INTENT_HELP)
			if(logo < 5)
				logo++
				update_sprite()
				caller.to_chat(span("notice","You change \the logo from \the [src.name]."))
				return TRUE
			else
				logo = 0
				update_sprite()
				caller.to_chat(span("notice","You wipe \the logo from \the [src.name]."))
				return TRUE

/obj/item/clothing/head/hat/paperbag/pre_pickup(var/atom/old_location,var/obj/hud/inventory/new_location)

	. = ..()

	if(new_location.item_slot & SLOT_HEAD)
		dynamic_inventory_count = 0
		is_container = FALSE
		var/mob/living/advanced/A = inventory_user
		for(var/obj/hud/inventory/dynamic/B in A.inventory)
			B.alpha = 0
			B.mouse_opacity = 0
		for(var/obj/hud/button/close_inventory/B in A.buttons)
			B.alpha = 0
			B.mouse_opacity = 0
	else
		dynamic_inventory_count = 7
		is_container = TRUE
	return .

/obj/item/clothing/head/hat/paperbag/update_inventory()
	. = ..()
	var/filled_slots = 1
	for(var/k in src.inventories)
		var/obj/hud/inventory/I3 = k
		filled_slots += length(I3.held_objects)

	if(filled_slots == 1)
		item_slot = SLOT_HEAD
		icon_state = "[initial(icon_state)]1"
	else
		item_slot = SLOT_NONE
		icon_state = "[initial(icon_state)]2"
	update_sprite()
	update_overlays()
	return .

/obj/item/clothing/head/hat/paperbag/update_overlays()
	var/fs = 1
	for(var/k in src.inventories)
		var/obj/hud/inventory/I3 = k
		fs += length(I3.held_objects)
	var/image/I2 = new/image(initial(icon),"logobg[clamp(fs,1,2)][logobg]")
	I2.color = polymorphs["logobg"]
	add_overlay(I2)
	var/image/I = new/image(initial(icon),"logo[clamp(fs,1,2)][logo]")
	I.color = polymorphs["logo"]
	add_overlay(I)
	return ..()

/obj/item/clothing/head/hat/paperbag/nanotrasen
	logo = 1
	polymorphs = list(
		"base" = "#145180",
		"logo" = "#FFFFFF",
		"logobg" = "#FFFFFF"
	)

/obj/item/clothing/head/hat/paperbag/syndicate
	logo = 3
	logobg = 1
	polymorphs = list(
		"base" = "#AB0101",
		"logo" = "#FFFFFF",
		"logobg" = "#2A2A2A"
	)
