/obj/item/clothing/feet/shoes/workboot
	name = "right workboot"
	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	icon = 'icons/obj/items/clothing/shoes/workboots.dmi'

	item_slot = SLOT_FOOT_RIGHT
	protected_limbs = list(BODY_FOOT_RIGHT)

	defense_rating = list(
		BLADE = 10,
		BLUNT = 50,
		PIERCE = 10,
		LASER = -25,
		MAGIC = -25,
		HEAT = 25,
		COLD = 25
	)

	size = SIZE_2
	weight = WEIGHT_3

	value = 30

	slowdown_mul_worn = 1.05

/obj/item/clothing/feet/shoes/workboot/left
	name = "left workboot"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)
	blocks_clothing = SLOT_FOOT_LEFT_U