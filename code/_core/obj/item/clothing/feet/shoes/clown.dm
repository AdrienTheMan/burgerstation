/obj/item/clothing/feet/shoes/clown
	name = "right clown shoe"
	rarity = RARITY_MYTHICAL
	icon_state = "inventory_right"
	icon_state_worn = "worn_right"

	icon = 'icons/obj/items/clothing/shoes/clown.dmi'

	item_slot = SLOT_FOOT_RIGHT
	protected_limbs = list(BODY_FOOT_RIGHT)

	defense_rating = list(
		BLUNT = 50,
		MAGIC = 50,
		HOLY = -50,
		DARK = 75
	)

	size = SIZE_2
	weight = WEIGHT_2

	value = 150

	slowdown_mul_worn = 1.1

/obj/item/clothing/feet/shoes/clown/get_footsteps(var/list/original_footsteps,var/enter=FALSE)
	original_footsteps += /footstep/clownstep
	return original_footsteps

/obj/item/clothing/feet/shoes/clown/left
	name = "left clown shoe"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)
	blocks_clothing = SLOT_FOOT_LEFT_U