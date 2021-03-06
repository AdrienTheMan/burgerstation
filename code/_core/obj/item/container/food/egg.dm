/obj/item/container/food/egg
	name = "egg"
	desc = "What came first? The rooster that had to fertilize it."
	desc_extended = "An egg hatched from a chicken."
	icon = 'icons/obj/items/consumable/food/meat.dmi'
	icon_state = "egg"

/obj/item/container/food/egg/chicken
	name = "chicken egg"

/obj/item/container/food/egg/chicken/Generate()
	reagents.add_reagent(/reagent/nutrition/egg_white,2.5)
	reagents.add_reagent(/reagent/nutrition/egg_yellow,2.5)
	return ..()