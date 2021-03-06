/mob/living/handle_footsteps(var/turf/T,var/list/footsteps_to_use,var/enter=TRUE)

	if(enter)
		CALLBACK("enter_footstep_\ref[src]", TICKS_TO_DECISECONDS(move_delay)*0.5, src, .proc/do_footstep, T, footsteps_to_use)
		return FALSE

	do_footstep(T,footsteps_to_use,enter)

	return TRUE

/mob/living/proc/do_footstep(var/turf/T,var/list/footsteps_to_use,var/enter=TRUE)

	footstep_counter = (footstep_counter + 1) % footstep_mod

	if(!footstep_counter)
		footstep_left_right_counter = !footstep_left_right_counter

	for(var/k in footsteps_to_use)
		if(!k)
			continue
		var/footstep/F = SSfootstep.all_footsteps[k]
		if(F.has_footprints)
			var/type_to_use = enter ? /obj/effect/footprint/emboss/ : /obj/effect/footprint/emboss/exit
			var/obj/effect/footprint/emboss/P = new type_to_use(T,src.dir,TRUE,TRUE)
			P.color = F.footprint_color
			P.alpha = F.footprint_alpha
			INITIALIZE(P)
		if(!footstep_counter)
			var/footstep_volume = 50 * (move_mod-0.5)
			if(is_sneaking)
				footstep_volume *= 0.5
			if(length(F.footstep_sounds))
				var/footstep_sound = pick(F.footstep_sounds)
				play(footstep_sound,all_mobs_with_clients - src, T, volume = footstep_volume, sound_setting = SOUND_SETTING_FOOTSTEPS, pitch = 1 + RAND_PRECISE(-F.variation_pitch,F.variation_pitch))
				play(footstep_sound,src,volume = footstep_volume, sound_setting = SOUND_SETTING_FOOTSTEPS, pitch= 1 + RAND_PRECISE(-F.variation_pitch,F.variation_pitch))

/mob/living/get_footsteps(var/list/original_footsteps,var/enter=TRUE)
	return original_footsteps

/mob/living/Move(var/atom/NewLoc,Dir=0,desired_step_x=0,desired_step_y=0,var/silent=FALSE)

	if(is_sneaking)
		on_sneak()

	. = ..()

	if(.)
		climb_counter = 0

	if(ai)
		ai.on_move(.,NewLoc,Dir)

	if(stand)
		stand.on_move(.,NewLoc,Dir)

	return .

/mob/living/post_move(var/atom/old_loc)

	. = ..()

	if(.)
		if(chat_overlay)
			chat_overlay.glide_size = src.glide_size
			chat_overlay.force_move(src.loc)
		if(alert_overlay)
			alert_overlay.glide_size = src.glide_size
			alert_overlay.force_move(src.loc)
		if(fire_overlay)
			fire_overlay.glide_size = src.glide_size
			fire_overlay.force_move(src.loc)
	return .

/mob/living/Bump(var/atom/obstacle,var/Dir=0)

	if(is_living(obstacle))
		var/mob/living/L = obstacle
		if(L.mob_size > mob_size)
			return FALSE

	. = ..()

	if(ai)
		ai.Bump(obstacle)

	return .


/mob/living/handle_movement(var/adjust_delay = 1)

	if(move_delay <= 0 && ai)
		ai.handle_movement_reset()
		ai.handle_movement()

	if(dead)
		return FALSE

	if(has_status_effect(list(PARALYZE,SLEEP,STAGGER,STUN)))
		return FALSE

	if(has_status_effect(CONFUSED))
		move_dir = pick(DIRECTIONS_ALL)

	if(move_dir)
		if(buckled_object && !buckled_object.unbuckle(src))
			return FALSE

		if(move_dir && grabbing_hand)
			resist()
			return FALSE

		if(get_status_effect_magnitude(SLEEP) == -1)
			remove_status_effect(SLEEP)
			return FALSE

	. = ..()

	if(.)
		add_nutrition(-0.01,FALSE)
		add_hydration(-0.01,FALSE)

	return .

/mob/living/get_movement_delay()
	. = ..()

	if(horizontal)
		. *= 3

	if(is_sneaking)
		. *= (2 - stealth_mod*0.5)

	. *= (2 - (get_nutrition_mod() * get_hydration_mod()))

	return .


/mob/living/proc/toggle_sneak(var/on = TRUE)

	for(var/obj/hud/button/B in buttons)
		if(B.type == /obj/hud/button/sneak)
			var/obj/hud/button/sneak/S = B
			S.sneaking = on
			S.update_sprite()

	if(on)
		stealth_mod = get_skill_power(SKILL_SURVIVAL)
		is_sneaking = TRUE
		return TRUE
	else
		is_sneaking = FALSE
		return FALSE

/mob/living/proc/on_sneak()
	return TRUE

/mob/living/proc/update_alpha(var/desired_alpha)
	if(alpha != desired_alpha)
		animate(src, alpha = desired_alpha, color = rgb(desired_alpha,desired_alpha,desired_alpha), time = SECONDS_TO_DECISECONDS(1))
		return TRUE

	return FALSE

/*
/mob/living/Cross(var/atom/movable/M)

	var/area/A = get_area(src)

	if(!A.safe)
		var/turf/T = get_turf(M)

		var/count = 0
		for(var/mob/living/L in T.contents)
			count++

		if(count>1)
			return FALSE

	return ..()
*/



/mob/living/Cross(atom/movable/O,var/atom/NewLoc,var/atom/OldLoc)

	if(is_living(O))
		var/mob/living/L = O
		if(L.loyalty_tag == src.loyalty_tag)
			return TRUE

	return ..()