/mob/living/simple/npc/bubblegum
	name = "bubblegum"
	id = "bubblegum"
	icon = 'icons/mob/living/simple/lavaland/bubblegum.dmi'
	icon_state = "living"
	damage_type = /damagetype/unarmed/claw/
	class = /class/bubblegum/
	ai = /ai/boss/bubblegum/

	pixel_x = -32

	var/charge_steps = 0
	var/charge_dir = 0

	health_base = 4000

	move_delay = DECISECONDS_TO_TICKS(2)

	stun_angle = 0

	attack_range = 2

	force_spawn = TRUE
	boss = TRUE

	armor_base = list(
		BLADE = 90,
		BLUNT = 90,
		PIERCE = 90,
		LASER = 120,
		MAGIC = 50,
		HEAT = INFINITY,
		COLD = INFINITY,
		BOMB = 50,
		BIO = 75,
		RAD = 75,
		HOLY = 0,
		DARK = INFINITY,
		FATIGUE = INFINITY
	)

	status_immune = list(
		STUN = TRUE,
		SLEEP = STAGGER,
		PARALYZE = STAGGER,
		FATIGUE = STAGGER,
		STAGGER = FALSE,
		CONFUSED = FALSE,
		CRIT = FALSE,
		REST = FALSE,
		ADRENALINE = FALSE,
		DISARM = FALSE,
		DRUGGY = FALSE
	)

	iff_tag = "bubblegum"
	loyalty_tag = "bubblegum"

	damage_received_multiplier = 0.5

	mob_size = MOB_SIZE_BOSS

	sprint_delay_mul = 1
	jog_delay_mul = 3
	walk_delay_mul = 4

	enable_medical_hud = FALSE
	enable_security_hud = FALSE

/mob/living/simple/npc/bubblegum/post_death()
	. = ..()
	charge_steps = 0
	charge_dir = 0
	icon_state = "dead"
	return .

/mob/living/simple/npc/bubblegum/proc/blood_attack()

	. = FALSE

	for(var/mob/living/advanced/A in view(VIEW_RANGE,src))
		if(A.dead)
			continue
		var/turf/simulated/T = get_turf(A)
		if(!istype(T))
			continue
		if(T.blood_level == 0)
			continue
		new/obj/effect/temp/hazard/bubblefist(T,null,src)
		. = TRUE

/mob/living/simple/npc/bubblegum/proc/spray_blood()

	return TRUE

/mob/living/simple/npc/bubblegum/get_movement_delay()
	. = ..()

	if(charge_steps)
		. = DECISECONDS_TO_TICKS(AI_TICK)

	return .

/mob/living/simple/npc/bubblegum/post_move(var/atom/old_loc)

	if(charge_steps)
		play('sounds/effects/impacts/meteor_impact.ogg',get_turf(src))
		var/turf/simulated/T0 = get_turf(src)
		var/turf/simulated/T1 = get_step(src,turn(dir,90))
		var/turf/simulated/T2 = get_step(src,turn(dir,-90))
		create_blood(/obj/effect/blood/splatter,T0,"#7F0000",rand(-8,8),rand(-8,8))
		create_blood(/obj/effect/blood/splatter,T1,"#7F0000",rand(-8,8),rand(-8,8))
		create_blood(/obj/effect/blood/splatter,T2,"#7F0000",rand(-8,8),rand(-8,8))

	return ..()

/mob/living/simple/npc/bubblegum/Bump(var/atom/obstacle,var/Dir=0)

	if(charge_steps && is_living(obstacle))
		var/damagetype/DT = all_damage_types[/damagetype/npc/bubblegum]
		var/list/params = list()
		params[PARAM_ICON_X] = rand(0,32)
		params[PARAM_ICON_Y] = rand(0,32)
		var/atom/object_to_damage = obstacle.get_object_to_damage(src,src,params,TRUE,TRUE)
		DT.do_damage(src,obstacle,src,object_to_damage,src,1)
		return TRUE

	return ..()


/mob/living/simple/npc/bubblegum/proc/start_charge()
	charge_dir = dir
	charge_steps = rand(5,15)
	CALLBACK("stop_charge_\ref[src]",SECONDS_TO_DECISECONDS(2),src,.proc/finish_charge)
	return TRUE

/mob/living/simple/npc/bubblegum/proc/finish_charge()
	charge_dir = 0
	charge_steps = 0
	CALLBACK_REMOVE("stop_charge_\ref[src]")
	return TRUE