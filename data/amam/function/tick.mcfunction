execute as @e[type=minecraft:villager,tag=!amam_origin,nbt={Offers:{Recipes:[{}]}}] run data merge entity @s {Offers:{Recipes:[]}}

schedule function amam:tick 1t