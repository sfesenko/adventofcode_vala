using advent2015;

class Day15 {

    [Compact]
    class Ingredient {
        public long capacity;
        public long durability;
        public long flavor;
        public long texture;
        public long calories;
    }

    Ingredient[] parse_ingredients (string input) {
        var lines = input.split ("\n");
        var ingredients_number = lines.length;
        var ingredients = new Ingredient [ingredients_number];        
        for (var i = 0; i < ingredients_number; ++i) {
            var w = lines[i].split (" ");
            var ingredient = new Ingredient ();
            ingredient.capacity = int.parse (w[2].slice (0, -1));
            ingredient.durability = int.parse (w[4].slice (0, -1));
            ingredient.flavor = int.parse (w[6].slice (0, -1));
            ingredient.texture = int.parse (w[8].slice (0, -1));
            ingredient.calories = int.parse (w[10]);
            ingredients[i] = (owned) ingredient;
        }
        return ingredients;
    }

    ulong calculate_score(int[] spoons, Ingredient[] ingredients, int calories) {
        var total = new Ingredient ();
        for (var i = 0; i < spoons.length; ++i) {
            unowned var ing = ingredients [i];
            var count = spoons[i];
            total.capacity += ing.capacity * count;
            total.durability += ing.durability * count;
            total.flavor += ing.flavor * count;
            total.texture += ing.texture * count;
            total.calories += ing.calories * count;
        }
        if (calories > 0 && total.calories != calories) {
            return 0;
        }
        ulong result = 
            long.max (0, total.capacity)
            * long.max (0, total.durability)
            * long.max (0, total.flavor)
            * long.max (0, total.texture)
            ;
        return result;
    }

    delegate ulong ScoreCalc (int[] spoons);

    ulong recursive (int summ, int[] spoons, uint n, ScoreCalc calc_score) {
        if (n + 1 == spoons.length) {
            spoons[n] = summ;
            return calc_score (spoons);
        }
        ulong result = 0;
        for (var i = 1; i <= summ; ++i) {
            spoons[n] = i;
            var score = recursive (summ - i, spoons, n + 1, calc_score);
            result = ulong.max (result, score);
        }
        return result;
    }

    public string first (string data) {
        var ingredients = parse_ingredients (data);
        ScoreCalc score_func = (spoons) => calculate_score (spoons, ingredients, 0);
        var result = recursive (100, new int[ingredients.length], 0, score_func);
        return result.to_string ();
    }

    public string second (string data) {
        var ingredients = parse_ingredients (data);
        ScoreCalc score_func = (spoons) => calculate_score (spoons, ingredients, 500);
        var result = recursive (100, new int[ingredients.length], 0, score_func);
        return result.to_string ();
    }
}
