# summoning villagers with custom tag in order to preserve them from their inventory being reset
summon minecraft:villager ~ ~1 ~ {Tags:[amam_origin]}

tellraw @a {"text":"A new villager has been summoned!","color":"green"}

# takes the summoner item away, it's only single use
# clear @s minecraft:bread[minecraft:custom_data={amam_summon:1b}] 1

# if the user gets another summoner item, the triggering advancement has to be removed so they will be able to use that again
advancement revoke @s only amam:villager_summon_with_bread_trigger
advancement revoke @s only amam:villager_summon_with_enchanted_book_trigger