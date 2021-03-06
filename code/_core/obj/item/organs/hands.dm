/obj/item/organ/hand
	name = "right hand"
	id = BODY_HAND_RIGHT
	desc = "A right hand."
	icon_state = BODY_HAND_RIGHT
	worn_layer = LAYER_MOB_HANDS
	inventories = list(
		/obj/hud/inventory/organs/right_hand_worn,
		/obj/hud/inventory/organs/right_hand_held
	)
	break_threshold = 15
	//health_max = 25

	damage_type = /damagetype/unarmed/fists/

	attach_flag = BODY_ARM_RIGHT

	enable_wounds = TRUE

	hud_id = "body_hand_right"

	can_be_targeted = TRUE

	target_bounds_x_min = 8
	target_bounds_x_max = 11

	target_bounds_y_min = 11
	target_bounds_y_max = 15

	base_miss_chance = 20

	attack_delay = 8
	attack_delay_max = 15

	health_base = 25

	health_coefficient = 0.5

	block_difficulty = list( //Also affects parry. High values means more difficult to block. Generally 0 = level 0, 1 = level 100.
		ATTACK_TYPE_MELEE = 0.5,
		ATTACK_TYPE_RANGED = 0.95,
		ATTACK_TYPE_MAGIC = 0.75,
		ATTACK_TYPE_UNARMED = 0.25
	)

/obj/item/organ/hand/get_damage_type(var/atom/attacker,var/atom/victim,var/atom/target)

	if(is_living(attacker))
		var/mob/living/L = attacker
		switch(L.intent)
			if(INTENT_HARM)
				return /damagetype/unarmed/fists/
			if(INTENT_DISARM)
				return /damagetype/unarmed/fists/disarm
			if(INTENT_HELP)
				return /damagetype/unarmed/fists/help
			if(INTENT_GRAB)
				return /damagetype/unarmed/fists/grab

	return ..()

/obj/item/organ/hand/left
	name = "left hand"
	id = BODY_HAND_LEFT
	desc = "A left hand."
	icon_state = BODY_HAND_LEFT
	inventories = list(
		/obj/hud/inventory/organs/left_hand_worn,
		/obj/hud/inventory/organs/left_hand_held
	)

	attach_flag = BODY_ARM_LEFT

	hud_id = "body_hand_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 11
	target_bounds_y_max = 14

//Reptile Advanced
/obj/item/organ/hand/reptile
	name = "right reptile hand"
	icon = 'icons/mob/living/advanced/species/reptile.dmi'
	inventories = list(
		/obj/hud/inventory/organs/right_hand_worn,
		/obj/hud/inventory/organs/right_hand_held
	)


/obj/item/organ/hand/reptile/left
	name = "left reptile hand"
	id = BODY_HAND_LEFT
	icon_state = BODY_HAND_LEFT
	inventories = list(
		/obj/hud/inventory/organs/left_hand_worn,
		/obj/hud/inventory/organs/left_hand_held
	)

	attach_flag = BODY_ARM_LEFT

	hud_id = "body_hand_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 11
	target_bounds_y_max = 14

//Reptile Advanced
/obj/item/organ/hand/reptile_advanced
	name = "right advanced reptile hand"
	icon = 'icons/mob/living/advanced/species/reptile_advanced.dmi'
	inventories = list(
		/obj/hud/inventory/organs/right_hand_worn,
		/obj/hud/inventory/organs/right_hand_held
	)

/obj/item/organ/hand/reptile_advanced/left
	name = "left advanced reptile hand"
	id = BODY_HAND_LEFT
	icon_state = BODY_HAND_LEFT
	inventories = list(
		/obj/hud/inventory/organs/left_hand_worn,
		/obj/hud/inventory/organs/left_hand_held
	)

	attach_flag = BODY_ARM_LEFT

	hud_id = "body_hand_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 11
	target_bounds_y_max = 14


//Diona
/obj/item/organ/hand/diona
	name = "right diona hand"
	icon = 'icons/mob/living/advanced/species/diona.dmi'
	inventories = list(
		/obj/hud/inventory/organs/right_hand_worn,
		/obj/hud/inventory/organs/right_hand_held
	)

	enable_glow = TRUE
	enable_detail = TRUE


/obj/item/organ/hand/diona/left
	name = "left diona hand"
	id = BODY_HAND_LEFT
	icon_state = BODY_HAND_LEFT
	inventories = list(
		/obj/hud/inventory/organs/left_hand_worn,
		/obj/hud/inventory/organs/left_hand_held
	)

	attach_flag = BODY_ARM_LEFT

	hud_id = "body_hand_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 11
	target_bounds_y_max = 14


//Cyborg
/obj/item/organ/hand/cyborg
	name = "right cyborg hand"
	icon = 'icons/mob/living/advanced/species/cyborg.dmi'
	inventories = list(
		/obj/hud/inventory/organs/right_hand_worn,
		/obj/hud/inventory/organs/right_hand_held
	)

/obj/item/organ/hand/cyborg/left
	name = "left cyborg hand"
	id = BODY_HAND_LEFT
	icon_state = BODY_HAND_LEFT
	inventories = list(
		/obj/hud/inventory/organs/left_hand_worn,
		/obj/hud/inventory/organs/left_hand_held
	)

	attach_flag = BODY_ARM_LEFT

	hud_id = "body_hand_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 11
	target_bounds_y_max = 14


//Beefman
/obj/item/organ/hand/beefman
	name = "right beef hand"
	icon = 'icons/mob/living/advanced/species/beefman.dmi'
	inventories = list(
		/obj/hud/inventory/organs/right_hand_worn,
		/obj/hud/inventory/organs/right_hand_held
	)
	damage_type = /damagetype/unarmed/beef/

/obj/item/organ/hand/beefman/get_damage_type(var/atom/attacker,var/atom/victim,var/atom/target)
	return damage_type

/obj/item/organ/hand/beefman/left
	name = "left beef hand"
	id = BODY_HAND_LEFT
	icon_state = BODY_HAND_LEFT
	inventories = list(
		/obj/hud/inventory/organs/left_hand_worn,
		/obj/hud/inventory/organs/left_hand_held
	)

	attach_flag = BODY_ARM_LEFT

	hud_id = "body_hand_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 11
	target_bounds_y_max = 14

//Stand
/obj/item/organ/hand/stand
	name = "right fast hand"

	attack_delay = 1
	attack_delay_max = 4

/obj/item/organ/hand/stand/get_damage_type(var/atom/attacker,var/atom/victim,var/atom/target)
	return /damagetype/unarmed/fists/stand

/obj/item/organ/hand/stand/left
	name = "left fast hand"
	id = BODY_HAND_LEFT
	icon_state = BODY_HAND_LEFT
	inventories = list(
		/obj/hud/inventory/organs/left_hand_worn,
		/obj/hud/inventory/organs/left_hand_held
	)

	attach_flag = BODY_ARM_LEFT

	hud_id = "body_hand_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 11
	target_bounds_y_max = 14


//Skeleton
/obj/item/organ/hand/skeleton
	name = "right skeleton hand"
	icon = 'icons/mob/living/advanced/species/skeleton.dmi'
	inventories = list(
		/obj/hud/inventory/organs/right_hand_worn,
		/obj/hud/inventory/organs/right_hand_held
	)

/obj/item/organ/hand/skeleton/left
	name = "left skeleton hand"
	id = BODY_HAND_LEFT
	icon_state = BODY_HAND_LEFT
	inventories = list(
		/obj/hud/inventory/organs/left_hand_worn,
		/obj/hud/inventory/organs/left_hand_held
	)

	attach_flag = BODY_ARM_LEFT

	hud_id = "body_hand_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 11
	target_bounds_y_max = 14