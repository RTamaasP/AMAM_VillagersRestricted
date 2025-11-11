execute at @p as @e[type=villager,tag=!amam_origin,distance=..15] run data merge entity @s {Offers:{Recipes:[]}}

schedule function amam:tick 10t