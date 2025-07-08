![Logo](https://raw.githubusercontent.com/RTamaasP/AMAM_VillagersRestricted/refs/heads/main/README%20img/1.png)

# AMAM VillagersRestricted

Tired of villager farming ruining your servers? But still don't want to completely disable them? Want an easy fix?

Well, you have just found the solution!

AMAM is a simple datapack aiming to bring balance and peace for every smp server. Makes all villagers useless... Unless...

![Logo](https://raw.githubusercontent.com/RTamaasP/AMAM_VillagersRestricted/refs/heads/main/README%20img/2.png)

## Core mechanics

- Deletes every villager's offers, who don't have a specific tag
- You have to consume a specific item to summon a villager WITH said specific tag
- There is no native way for obtaining the said item, because it would be hardcoded

## Benefits

- The specific item needed for summoning is just a vanilla item with a custom data tag - that means you can add this to a custom loot table totally independently
- This datapack doesn't remove villagers from your world so it won't ruin the athmosphere by making the villages empty
- If you make the custom item a rare loot, it will be the most balanced: something which requires a lot of exploring or a big challange and provide a big reward. And with this, villagers still won't be extinct from your world, still allowing mega projects in the late game.

## For server hosts

- The item needed for summoning is `minecraft:bread` with the component `minecraft:custom_data={amam_summon:true}`. There is a command which gives you a fancy item with other components too but not anything else is checked besides the these two criteria listed. As long as your item meets these two conditions, it's good to go.
- There are only 2 functions included and they are pretty self explanatory.

![Logo](https://raw.githubusercontent.com/RTamaasP/AMAM_VillagersRestricted/refs/heads/main/README%20img/3.png)

The `give/villager_stick` will give an item which is usable for villager summoning. Again, this will have a bunch of extra staff set which are not required to be present to fulfil the summoning's conditions.

The `summon/from_villager_stick` is the command that runs when the correct item is consumed. It summons a villager with the necessary tag and removes 1 summoning item from the inventory. Yes, technically you can run this command without having the item but the command is not triggerable in survival without having and using the item.