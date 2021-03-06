/mob/living/proc/death_message()
	src.visible_message("\The [src.name] seizes up and falls limp, their eyes dead and lifeless...")
	return TRUE

/mob/living/proc/death()

	if(dead)
		return FALSE

	death_message()

	pre_death()

	for(var/mob/living/advanced/player/P in view(VIEW_RANGE,src.loc))
		if(P == src)
			continue
		P.to_chat(span("notice","<b>\The [src.name] dies!</b>"),CHAT_TYPE_COMBAT)

	src.to_chat(span("danger","<h1>You died!</h1>"),CHAT_TYPE_COMBAT)
	src.to_chat(span("danger","Your death is not the end. Someone may come along and revive you, or you can be cloned again by ghosting and loading your current character."))
	src.to_chat(span("danger","Be warned, if you choose to be cloned or you cannot be revived, you will lose all your items until they are retrieved!."))

	dead = TRUE
	time_of_death = world.time

	if(stand && stand.linked_stand)
		stand.linked_stand.set_enabled(FALSE)
		remove_stand()

	if(ai)
		ai.enabled = FALSE

	movement_flags = 0x0
	attack_flags = 0x0

	plane = PLANE_OBJ

	handle_horizontal()

	post_death()

	if(queue_delete_on_death)
		queue_delete(src,ITEM_DELETION_TIME_DROPPED,TRUE)

	return TRUE

/*
/mob/living/proc/do_loot_drop(var/atom/desired_loc)

	if(desired_loc && loot_drop && health)
		var/loot/L = all_loot[loot_drop]

		if(!isturf(desired_loc))
			return FALSE

		if(loot_drop_in_corpse)
			L.spawn_loot_corpse(desired_loc)
		else
			L.spawn_loot_turf(desired_loc)

		var/obj/item/currency/C = new(src.loc)
		C.value = 1 + FLOOR(health.health_max/10, 1)
		INITIALIZE(C)
		step_rand(C)
		return TRUE

	return FALSE
*/

/mob/living/proc/revive()
	movement_flags = 0x0
	attack_flags = 0x0
	dead = FALSE
	plane = initial(plane)
	remove_all_status_effects()
	if(health)
		health.update_health()
	if(ai)
		ai.enabled = TRUE
	return TRUE

/mob/living/proc/resurrect()
	if(health)
		health.health_current = health.health_max
	revive()
	return TRUE

/mob/living/proc/pre_death()
	alert_overlay.icon_state = "none"
	chat_overlay.icon_state = "none"
	return TRUE

/mob/living/proc/post_death()
	HOOK_CALL("post_death")
	return TRUE

/mob/living/can_attack(var/atom/victim,var/atom/weapon,var/params,var/damagetype/damage_type)

	if(dead)
		return FALSE

	if(has_status_effect(list(PARALYZE,SLEEP,STAGGER,FATIGUE,STUN)))
		return FALSE

	return ..()


/mob/living/can_use_controls(object,location,control,params)

	if(dead)
		return FALSE

	if(has_status_effect(list(PARALYZE,SLEEP,STAGGER,STUN)))
		return FALSE

	return ..()

/*
/mob/living/proc/check_status_effects()

	//Crit
	if(!(status & CRIT) && (crit_time > 0 || crit_time == -1))
		add_status(CRIT)
		on_crit()

	if(status & CRIT && crit_time <= 0 && crit_time != -1)
		remove_status_effect(CRIT)
		on_uncrit()

	//Fatigue
	if(!(status & FATIGUE) && (fatigue_time > 0 || fatigue_time == -1))
		add_status(FATIGUE)
		on_fatigued()

	if(status & FATIGUE && fatigue_time <= 0 && fatigue_time != -1)
		remove_status_effect(FATIGUE)
		on_unfatigued()

	//Rest
	if(!(status & REST) && (rest_time > 0 || rest_time == -1))
		add_status(REST)
		on_rest()

	if(status & REST && rest_time <= 0 && rest_time != -1)
		remove_status_effect(REST)
		on_unrest()

	//Sleep
	if(!(status & SLEEP) && (sleep_time > 0 || sleep_time == -1))
		add_status(SLEEP)
		on_sleeped()

	if(status & SLEEP && sleep_time <= 0 && sleep_time != -1)
		remove_status_effect(SLEEP)
		on_unsleeped()

	//Stun
	if(!(status & STUN) && (stun_time > 0 || stun_time == -1))
		add_status(STUN)
		on_stunned()

	if(status & STUN && stun_time <= 0 && stun_time != -1)
		remove_status_effect(STUN)
		on_unstunned()

	//Stagger
	if(!(status & STAGGER) && (stagger_time > 0 || stagger_time == -1))
		add_status(STAGGER)
		on_staggered()

	if(status & STAGGER && stagger_time <= 0 && stagger_time != -1)
		remove_status_effect(STAGGER)
		on_unstaggered()

	//Paralyze
	if(!(status & PARALYZE) && (paralyze_time > 0 || paralyze_time == -1))
		add_status(PARALYZE)
		on_paralyzed()

	if(status & PARALYZE && paralyze_time <= 0 && paralyze_time != -1)
		remove_status_effect(PARALYZE)
		on_unparalyzed()

	//Confuse
	if(!(status & CONFUSED) && (confuse_time > 0 || confuse_time == -1))
		add_status(CONFUSED)
		on_confused()

	if(status & CONFUSED && confuse_time <= 0 && confuse_time != -1)
		remove_status_effect(CONFUSED)
		on_unconfused()

	//Adrenaline
	if(!(status & ADRENALINE) && (adrenaline_time > 0 || adrenaline_time == -1))
		add_status(ADRENALINE)
		on_adrenaline()

	if(status & ADRENALINE && adrenaline_time <= 0 && adrenaline_time != -1)
		remove_status_effect(ADRENALINE)
		on_unadrenaline()

	//Final Checks
	if(status && !(src in all_living_with_status))
		all_living_with_status += src

	if(!status && (src in all_living_with_status))
		handle_horizontal()
		all_living_with_status -= src

	return TRUE
*/

/mob/living/proc/handle_horizontal()

	var/desired_horizontal = dead || has_status_effect(list(STUN,FATIGUE,SLEEP,CRIT,REST))

	if(desired_horizontal != horizontal)
		if(desired_horizontal) //KNOCK DOWN
			animate(src,transform = turn(matrix(), stun_angle), pixel_z = 0, time = 1)
			update_collisions(FLAG_COLLISION_CRAWLING)
			play(pick('sounds/effects/impacts/bodyfall2.ogg','sounds/effects/impacts/bodyfall3.ogg','sounds/effects/impacts/bodyfall4.ogg'),get_turf(src), volume = 25)
		else //GET UP
			animate(src,transform = matrix(), pixel_z = initial(src.pixel_z), time = 2)
			update_collisions(initial(collision_flags))
		horizontal = desired_horizontal

	return desired_horizontal

/mob/living/proc/on_life()

	if(!initialized)
		return FALSE

	handle_status_effects()

	update_alpha(handle_alpha())

	return TRUE

/mob/living/proc/handle_charges(var/charge_gain = 0)

	var/dodge_power = src.get_skill_power(SKILL_DODGE)
	var/block_power = src.get_skill_power(SKILL_BLOCK)
	var/parry_power = src.get_skill_power(SKILL_PARRY)

	var/old_dodge = charge_dodge
	var/old_block = charge_block
	var/old_parry = charge_parry

	charge_dodge = min(charge_dodge + charge_gain*dodge_power,CEILING(dodge_power*500,100))
	charge_block = min(charge_block + charge_gain*block_power,CEILING(block_power*500,100))
	charge_parry = min(charge_parry + charge_gain*parry_power,CEILING(parry_power*500,100))

	if(!charge_gain || old_dodge != charge_dodge || old_block != charge_block || !old_parry != charge_parry)
		for(var/obj/hud/button/evade/B in buttons)
			B.update_overlays()
		return TRUE

	return FALSE

mob/living/proc/on_life_slow()

	if(!initialized)
		return FALSE

	handle_fire()

	if(dead)
		return FALSE

	if(reagents)
		reagents.metabolize()

	handle_charges(LIFE_TICK_SLOW)

	handle_health_buffer()

	var/thirst_mod = health && (health.stamina_current <= health.stamina_max*0.5) ? 2 : 1
	add_nutrition(-(LIFE_TICK_SLOW/10)*0.10,FALSE)
	add_hydration(-(LIFE_TICK_SLOW/10)*0.05*thirst_mod)

	return TRUE

/mob/living/proc/handle_alpha()

	var/base_alpha = initial(alpha)

	if(is_sneaking)
		var/desired_alpha = FLOOR(10 + (1-stealth_mod)*base_alpha*0.5, 1)
		if(horizontal)
			desired_alpha *= 0.5
		return desired_alpha

	return base_alpha


/mob/living/proc/handle_health_buffer()

	if(health)

		var/update_health = FALSE
		var/update_stamina = FALSE
		var/update_mana = FALSE

		if(stamina_regen_buffer)
			var/stamina_to_regen = clamp(stamina_regen_buffer,STAMINA_REGEN_BUFFER_MIN,STAMINA_REGEN_BUFFER_MAX)
			health.adjust_stamina(stamina_to_regen)
			stamina_regen_buffer -= stamina_to_regen

		if(mana_regen_buffer)
			var/mana_to_regen = clamp(mana_regen_buffer,MANA_REGEN_BUFFER_MIN,MANA_REGEN_BUFFER_MAX)
			health.adjust_mana(mana_to_regen)
			mana_regen_buffer -= mana_to_regen

		if(health_regen_buffer)
			var/health_to_regen = clamp(health_regen_buffer,HEALTH_REGEN_BUFFER_MIN,HEALTH_REGEN_BUFFER_MAX)
			health.adjust_loss_smart(brute = health_to_regen*0.25, burn = health_to_regen*0.25, tox = health_to_regen*0.25, oxy = health_to_regen*0.25)
			health_to_regen -= health_to_regen
			health.update_health(health_regen_buffer,FALSE)

		if(update_health || update_stamina || update_mana)
			update_health_element_icons(update_health,update_stamina,update_mana,TRUE)

	return TRUE