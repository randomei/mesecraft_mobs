local S = minetest.get_translator(minetest.get_current_modname())

-- Bucket of Milk
minetest.register_craftitem("mobs:bucket_milk", {
        description = S"Bucket of Milk",
        inventory_image = "mesecraft_mobs_items_milk_bucket.png",
        stack_max = 1,
        on_use = minetest.item_eat(8, 'bucket:bucket_empty'),
        groups = {food_milk = 1, flammable = 3},
})

-- Glass of Milk
minetest.register_craftitem("mobs:glass_milk", {
        description = S"Glass of Milk",
        inventory_image = "mesecraft_mobs_items_milk_glass.png",
        on_use = minetest.item_eat(2, 'vessels:drinking_glass'),
        groups = {food_milk_glass = 1, flammable = 3, vessel = 1},
})

-- 4 glasses + milk bucket --> 4 milk glasses.
minetest.register_craft({
        type = "shapeless",
        output = "mobs:glass_milk 4",
        recipe = {
                'vessels:drinking_glass', 'vessels:drinking_glass',
                'vessels:drinking_glass', 'vessels:drinking_glass',
                'mobs:bucket_milk'
        },
        replacements = { {"mobs:bucket_milk", "bucket:bucket_empty"} }
})

-- Glasses of Milk --> Milk Bucket.
minetest.register_craft({
        type = "shapeless",
        output = "mobs:bucket_milk",
        recipe = {
                'mobs:glass_milk', 'mobs:glass_milk',
                'mobs:glass_milk', 'mobs:glass_milk',
                'bucket:bucket_empty'
        },
        replacements = { {"mobs:glass_milk", "vessels:drinking_glass 4"} }
})

