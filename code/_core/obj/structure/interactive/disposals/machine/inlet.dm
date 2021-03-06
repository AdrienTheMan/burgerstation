/obj/structure/interactive/disposals/machine/inlet
	name = "disposals inlet"
	icon_state = "intake"

	collision_flags = FLAG_COLLISION_WALKING
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC

	collision_dir = 0x0

	plane = PLANE_OBJ

	bullet_block_chance = 50

/obj/structure/interactive/disposals/machine/inlet/set_dir(var/desired_dir,var/force = FALSE)

	. = ..()

	if(.)
		var/desired_c_dir = NORTH | EAST | SOUTH | WEST
		desired_c_dir &= ~dir
		update_collisions(c_dir = desired_c_dir)


	return .

/obj/structure/interactive/disposals/machine/inlet/Crossed(var/atom/movable/O,var/atom/new_loc,var/atom/old_loc)
	if(O.collision_flags & FLAG_COLLISION_ETHEREAL)
		return ..()
	enter_pipe(O)
	return ..()