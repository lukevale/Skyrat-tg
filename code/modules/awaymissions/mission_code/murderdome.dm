
/obj/structure/window/reinforced/fulltile/indestructible
	name = "robust window"
	//obj_flags = parent_type::obj_flags | NO_DECONSTRUCTION
	flags_1 = PREVENT_CLICK_UNDER_1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/structure/window/reinforced/fulltile/indestructible/rcd_vals(mob/user, obj/item/construction/rcd/the_rcd)
	return FALSE


/obj/structure/grille/indestructible
	obj_flags = CONDUCTS_ELECTRICITY | NO_DECONSTRUCTION
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/structure/grille/indestructible/rcd_vals(mob/user, obj/item/construction/rcd/the_rcd)
	return FALSE

/obj/effect/spawner/structure/window/reinforced/indestructible
	spawn_list = list(/obj/structure/grille/indestructible, /obj/structure/window/reinforced/fulltile/indestructible)

/obj/structure/barricade/security/murderdome
	name = "respawnable barrier"
	desc = "A barrier. Provides cover in firefights."
	deploy_time = 0
	deploy_message = 0

/obj/structure/barricade/security/murderdome/make_debris()
	new /obj/effect/murderdome/dead_barricade(get_turf(src))

/obj/effect/murderdome/dead_barricade
	name = "dead barrier"
	desc = "It provided cover in fire fights. And now it's gone."
	icon = 'icons/obj/structures.dmi'
	icon_state = "barrier0"
	alpha = 100

/obj/effect/murderdome/dead_barricade/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(respawn)), 3 MINUTES)

/obj/effect/murderdome/dead_barricade/proc/respawn()
	if(!QDELETED(src))
		new /obj/structure/barricade/security/murderdome(get_turf(src))
		qdel(src)
