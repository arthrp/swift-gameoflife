let size = 20;

class Game {
    let size: Int;
    var field: [[Bool]];

    init(size: Int){
        self.size = size;
        self.field = Array(repeating: Array(repeating: false, count: size), count: size);

        self.field[2][2] = true
        self.field[2][3] = true
        self.field[2][4] = true
    }

    func Print(){
        var s = "";
        for row in self.field {
            for e in row {
                s += (e) ? "■ " : "□ ";
            }
            s += "\n"
        }

        print(s);
    }

    func MakeTurn(){
        var newField: [[Bool]] = Array(repeating: Array(repeating: false, count: self.size), count: self.size);

        for y in 0...self.size-1 {
            for x in 0...self.size-1 {
                let n = self.CountNeighbours(cellX: x, cellY: y)
                let cell = self.field[x][y]

                if ((cell && (n == 2 || n == 3)) || (!cell && n == 3)) {
                    newField[x][y] = true
                }
                else {
                    newField[x][y] = false
                }
            }
        }
        self.field = newField
    }

    func CountNeighbours(cellX: Int, cellY: Int) -> Int {
        var count = 0

        for dy in -1...1 {
            let y = (cellY + dy + self.size) % self.size
            for dx in -1...1 {
                if dx == 0 && dy == 0 { continue }

                let x = (cellX + dx + self.size) % self.size
                if(self.field[x][y]){
                    count += 1
                }
            }
        }

        return count
    }
}