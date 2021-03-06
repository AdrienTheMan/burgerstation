/obj/item/magazine/rifle_762_short
	name = "\improper 7.62x39mm Soviet magazine"
	icon = 'icons/obj/items/magazine/762_short_rifle.dmi'
	icon_state = "762"
	bullet_count_max = 30

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/russian = TRUE,
	)

	ammo = /obj/item/bullet_cartridge/rifle_308/short

	bullet_length_min = 38
	bullet_length_best = 39
	bullet_length_max = 40

	bullet_diameter_min = 7.6
	bullet_diameter_best = 7.62
	bullet_diameter_max = 7.7

	size = SIZE_2
	weight = WEIGHT_2

/obj/item/magazine/rifle_762_short/update_icon()
	if(length(stored_bullets))
		icon_state = "[initial(icon_state)]_1"
	else
		icon_state = "[initial(icon_state)]_0"

	..()