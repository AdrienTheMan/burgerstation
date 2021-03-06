/obj/item/weapon/ranged/bullet/magazine/pistol/
	override_icon_state = TRUE

/obj/item/weapon/ranged/bullet/magazine/pistol/update_icon()

	icon_state = initial(icon_state)

	if(!chambered_bullet)
		icon_state = "[icon_state]_unloaded"

	if(!stored_magazine)
		icon_state = "[icon_state]_open"

	return ..()

/obj/item/weapon/ranged/bullet/magazine/pistol/get_static_spread() //Base spread
	return 0.01

/obj/item/weapon/ranged/bullet/magazine/pistol/get_skill_spread(var/mob/living/L) //Base spread
	return 0.03 - (0.03 * L.get_skill_power(SKILL_RANGED))

/obj/item/weapon/ranged/bullet/magazine/pistol/get_movement_spread(var/mob/living/L)
	return ..() * 0.5

/obj/item/weapon/ranged/bullet/magazine/pistol/get_cock_sound(var/direction="both")
	switch(direction)
		if("both")
			return 'sounds/weapons/gun/pistol/rack.ogg'
		if("forward")
			return 'sounds/weapons/gun/pistol/slide_drop.ogg'
		if("back")
			return 'sounds/weapons/gun/pistol/slide_lock.ogg'