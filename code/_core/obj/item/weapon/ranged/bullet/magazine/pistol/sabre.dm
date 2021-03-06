/obj/item/weapon/ranged/bullet/magazine/pistol/high_calibre
	name = "\improper 12.7mm Sabre"
	desc = "12.7mm Sabre Pistol"
	desc_extended = "A very powerful semiautomatic pistol commonly used by high ranking Syndicate Operatives. The stopping power rivals the .50 Eagle guns."
	icon = 'icons/obj/items/weapons/ranged/pistol/12mm.dmi'
	icon_state = "inventory"
	value = 150

	shoot_delay = 3

	automatic = FALSE

	shoot_sounds = list('sounds/weapons/12/shoot.ogg')

	can_wield = FALSE

	view_punch = 6

	slowdown_mul_held = HELD_SLOWDOWN_PISTOL

	size = SIZE_2
	weight = WEIGHT_3

	heat_per_shot = 0.05
	heat_max = 0.10

	bullet_length_min = 27
	bullet_length_best = 33
	bullet_length_max = 34

	bullet_diameter_min = 12
	bullet_diameter_best = 12.7
	bullet_diameter_max = 13

/obj/item/weapon/ranged/bullet/magazine/pistol/high_calibre/get_static_spread() //Base spread
	return 0.0025

/obj/item/weapon/ranged/bullet/magazine/pistol/high_calibre/get_skill_spread(var/mob/living/L) //Base spread
	return max(0,0.03 - (0.04 * L.get_skill_power(SKILL_RANGED)))

/obj/item/weapon/ranged/bullet/magazine/pistol/high_calibre/mod
	name = "\improper 12.7mm Sabre MOD"
	icon = 'icons/obj/items/weapons/ranged/pistol/12mm_mod.dmi'
	desc_extended = "A modded variant very powerful semiautomatic pistol commonly used by the most elite high ranking Syndicate Operatives. \
	It is said that it is easier to become an elite syndicate operative than it is to actually obtain this weapon through other means."

	shoot_delay = 1
	view_punch = 4

	heat_per_shot = 0.04
	heat_max = 0.12

	value = 500

	shoot_sounds = list('sounds/weapons/12/shoot_mod.ogg')

	automatic = TRUE
	max_bursts = 3