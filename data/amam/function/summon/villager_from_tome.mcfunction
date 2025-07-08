# summoning villagers with custom tag in order to preserve them from their inventory being reset
summon minecraft:villager ~ ~1 ~ {Tags:[amam_origin]}

tellraw @p {"text":"A new villager has been summoned!","color":"green"}

# takes the summoner item away, it's only single use
clear @s minecraft:written_book[minecraft:custom_data={amam_summon:1b}] 1

# if the user gets another summoner item, the triggering advancement has to be removed so they will be able to use that again
advancement revoke @s only amam:amam_summon_trigger