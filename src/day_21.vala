using advent2015;

class Day21 : Day {

    static uint8[] WEAPONS = {
         8, 4,
        10, 5,
        25, 6,
        40, 7,
        74, 8
    };

    static uint8[] ARMOR = {
         13, 1,
         31, 2,
         53, 3,
         75, 4,
        102, 5
    };

    class Stuff {
        uint8 _armor;
        uint8 _damage;
        uint8 _cost;

        Stuff.armor (uint8 armor, uint8 cost) {
            this._armor = armor;
            this._cost = cost;
        }
        public Stuff.damage (uint8 damage, uint8 cost) {
            this._damage = damage;
            this._cost = cost;
        }
        public static  Stuff dam (uint8 damage, uint8 cost) {
            var st = new Stuff ();
            st._damage = damage;
            st._cost = cost;
            return st;
        } 
    }

    Stuff[] weapons = {
        Stuff.dam (1, 1)
    };


    uint first_u (string data) {
        var lines = data.split ("\n");
        return lines.length;
    }

    uint second_u (string data) {
        var lines = data.split ("\n");
        return lines.length;
    }
}
