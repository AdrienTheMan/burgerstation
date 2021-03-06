#define LAYER_FLOOR           1
#define LAYER_FLOOR_LARGE     LAYER_FLOOR + 0.1
#define LAYER_FLOOR_WEATHER   LAYER_FLOOR + 0.2
#define LAYER_FLOOR_DECAL     LAYER_FLOOR + 0.3

#define LAYER_GROUND_SCENERY 2
#define LAYER_GROUND_PIPE 2.1
#define LAYER_GROUND_CONVERYOR 2.2

#define LAYER_WALL 3
#define LAYER_WALL_DECAL 3.1

#define LAYER_TABLE 4

#define LAYER_BLOOD            LAYER_MOB_DEAD - 0.1
#define LAYER_MOB_DEAD         5

#define LAYER_OBJ_DOOR_OPEN    LAYER_OBJ - 0.1
#define LAYER_OBJ              6
#define LAYER_OBJ_GRILLE 	   LAYER_OBJ + 0.1
#define LAYER_OBJ_WINDOW 	   LAYER_OBJ + 0.2
#define LAYER_OBJ_DOOR_CLOSED  LAYER_OBJ + 0.3

#define LAYER_MOB_BELOW        LAYER_MOB - 0.1
#define LAYER_MOB              8

#define LAYER_MOB_FIRE         9

#define LAYER_MOB_ABOVE        10

#define LAYER_PROJECTILE 13

#define LAYER_EFFECT 14

#define LAYER_GHOST 15

#define LAYER_LARGE_OBJ 16

#define LAYER_AREA 17 //Weather

#define LAYER_LIGHTING 18
#define LAYER_LIGHTING_DYNAMIC 19

#define LAYER_SCREEN_BLOOD 20

#define LAYER_HUD 21
#define LAYER_HUD_ITEMS 22




#define LAYER_MOB_NONE                 LAYER_MOB + 0.01
#define LAYER_MOB_WINGS_BEHIND         LAYER_MOB + 0.02
#define LAYER_MOB_TAIL_BEHIND          LAYER_MOB + 0.03
#define LAYER_MOB_WINGS_ADJACENT       LAYER_MOB + 0.04
#define LAYER_MOB_TORSO                LAYER_MOB + 0.05

#define LAYER_MOB_CLOTHING_UNDERSHIRT  LAYER_MOB + 0.11
#define LAYER_MOB_HEAD                 LAYER_MOB + 0.12
#define LAYER_MOB_EAR                  LAYER_MOB + 0.13
#define LAYER_MOB_EYE                  LAYER_MOB + 0.14
#define LAYER_MOB_CLOTHING_EAR         LAYER_MOB + 0.15

#define LAYER_MOB_CLOTHING_HEADWRAP    LAYER_MOB + 0.21
#define LAYER_MOB_CLOTHING_EYE         LAYER_MOB + 0.22
#define LAYER_MOB_GROIN                LAYER_MOB + 0.23
#define LAYER_MOB_ARMS                 LAYER_MOB + 0.24

#define LAYER_MOB_LEGS                 LAYER_MOB + 0.31
#define LAYER_MOB_FEET                 LAYER_MOB + 0.32
#define LAYER_MOB_CLOTHING_UNDERWEAR   LAYER_MOB + 0.32
#define LAYER_MOB_CLOTHING_SOCKS       LAYER_MOB + 0.34
#define LAYER_MOB_CLOTHING_SHOES       LAYER_MOB + 0.35

#define LAYER_MOB_CLOTHING_PANTS       LAYER_MOB + 0.41
#define LAYER_MOB_CLOTHING_UNIFORM     LAYER_MOB + 0.42
#define LAYER_MOB_CLOTHING_NECK_UNDER  LAYER_MOB + 0.43
#define LAYER_MOB_CLOTHING_BELT        LAYER_MOB + 0.44
#define LAYER_MOB_CLOTHING_ARMOR       LAYER_MOB + 0.45

#define LAYER_MOB_CLOTHING_MASK        LAYER_MOB + 0.51
#define LAYER_MOB_INJURY               LAYER_MOB + 0.52
#define LAYER_MOB_HANDS                LAYER_MOB + 0.53
#define LAYER_MOB_CLOTHING_GLOVES      LAYER_MOB + 0.54
#define LAYER_MOB_INJURY_HANDS         LAYER_MOB + 0.55

#define LAYER_MOB_CLOTHING_HARDSUIT    LAYER_MOB + 0.61
#define LAYER_MOB_CLOTHING_COAT        LAYER_MOB + 0.62
#define LAYER_MOB_CLOTHING_NECK_OVER   LAYER_MOB + 0.63
#define LAYER_MOB_TAIL_FRONT           LAYER_MOB + 0.64
#define LAYER_MOB_WINGS_FRONT          LAYER_MOB + 0.65
#define LAYER_MOB_CLOTHING_BACK        LAYER_MOB + 0.66

#define LAYER_MOB_HAIR_FACE            LAYER_MOB + 0.71
#define LAYER_MOB_HAIR_HEAD            LAYER_MOB + 0.72
#define LAYER_MOB_CLOTHING_MASK        LAYER_MOB + 0.73
#define LAYER_MOB_CLOTHING_HELMET      LAYER_MOB + 0.74
#define LAYER_MOB_HELD                 LAYER_MOB + 0.75



/*
#define LAYER_MOB_NONE                 LAYER_MOB + 0.01
#define LAYER_MOB_WINGS_BEHIND         LAYER_MOB + 0.02
#define LAYER_MOB_TAIL_BEHIND          LAYER_MOB + 0.03
#define LAYER_MOB_WINGS_ADJACENT       LAYER_MOB + 0.04
#define LAYER_MOB_TORSO                LAYER_MOB + 0.05
#define LAYER_MOB_HEAD                 LAYER_MOB + 0.06
#define LAYER_MOB_EAR                  LAYER_MOB + 0.07
#define LAYER_MOB_EYE                  LAYER_MOB + 0.08
#define LAYER_MOB_MASK                 LAYER_MOB + 0.09
#define LAYER_MOB_GROIN                LAYER_MOB + 0.10
#define LAYER_MOB_LEGS                 LAYER_MOB + 0.11
#define LAYER_MOB_FEET                 LAYER_MOB + 0.12
#define LAYER_MOB_ARMS                 LAYER_MOB + 0.13
#define LAYER_MOB_HANDS                LAYER_MOB + 0.14



#define LAYER_MOB_CLOTHING_UNDERWEAR   LAYER_MOB_CLOTHING + 0.02
#define LAYER_MOB_CLOTHING_UNDERSHIRT  LAYER_MOB_CLOTHING + 0.03
#define LAYER_MOB_CLOTHING_SOCKS       LAYER_MOB_CLOTHING + 0.04
#define LAYER_MOB_CLOTHING_SHOES       LAYER_MOB_CLOTHING + 0.05
#define LAYER_MOB_CLOTHING_PANTS       LAYER_MOB_CLOTHING + 0.06
#define LAYER_MOB_CLOTHING_UNIFORM     LAYER_MOB_CLOTHING + 0.07

#define LAYER_MOB_INJURY               LAYER_MOB_CLOTHING + 0.1

#define LAYER_MOB_CLOTHING_NECK_UNDER  LAYER_MOB_CLOTHING + 0.11
#define LAYER_MOB_CLOTHING_BELT        LAYER_MOB_CLOTHING + 0.12
#define LAYER_MOB_CLOTHING_ARMOR       LAYER_MOB_CLOTHING + 0.13
#define LAYER_MOB_CLOTHING_COAT        LAYER_MOB_CLOTHING + 0.14
#define LAYER_MOB_CLOTHING_BEFORE_EYE  LAYER_MOB_CLOTHING + 0.15
#define LAYER_MOB_CLOTHING_EYE         LAYER_MOB_CLOTHING + 0.16
#define LAYER_MOB_CLOTHING_EAR         LAYER_MOB_CLOTHING + 0.17

#define LAYER_MOB_HAIR_HEAD            LAYER_MOB_CLOTHING + 0.2

#define LAYER_MOB_CLOTHING_MASK        LAYER_MOB_CLOTHING + 0.21
#define LAYER_MOB_CLOTHING_HELMET      LAYER_MOB_CLOTHING + 0.22
#define LAYER_MOB_CLOTHING_HARDSUIT    LAYER_MOB_CLOTHING + 0.23
#define LAYER_MOB_CLOTHING_NECK_OVER   LAYER_MOB_CLOTHING + 0.24

#define LAYER_MOB_TAIL_FRONT           LAYER_MOB_CLOTHING + 0.3
#define LAYER_MOB_WINGS_FRONT          LAYER_MOB_CLOTHING + 0.4

#define LAYER_MOB_CLOTHING_BACK        LAYER_MOB_CLOTHING + 0.5 //Backpacks
#define LAYER_MOB_HELD                 LAYER_MOB_CLOTHING + 0.6
*/

