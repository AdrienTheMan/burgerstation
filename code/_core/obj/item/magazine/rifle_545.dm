/obj/item/magazine/rifle_545
	name = "\improper 5.45x39mm magazine"
	icon = 'icons/obj/items/magazine/545_rifle.dmi'
	icon_state = "545"
	bullet_count_max = 20

	weapon_whitelist = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/abakan = TRUE,
	)

	ammo = /obj/item/bullet_cartridge/rifle_545mm

	bullet_length_min = 38
	bullet_length_best = 39
	bullet_length_max = 40

	bullet_diameter_min = 5.4
	bullet_diameter_best = 5.45
	bullet_diameter_max = 5.46

	size = SIZE_2
	weight = WEIGHT_2

/obj/item/magazine/rifle_545/update_icon()
	if(length(stored_bullets))
		icon_state = "[initial(icon_state)]_1"
	else
		icon_state = "[initial(icon_state)]_0"

	..()