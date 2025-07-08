execute as @e[type=minecraft:villager,nbt={Offers:{Recipes:[{}]}},tag=!amam_origin] run data merge entity @s {Offers:{Recipes:[]}}

schedule function amam:tick 1t