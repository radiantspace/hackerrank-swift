let input1:Array<Int!> = readLine()!.characters.split(" ").map{Int(String($0))}
let coins:Array<Int> = readLine()!.characters.split(" ").map{Int(String($0))!}.sort()
let sum = input1[0]
let coinsCount = input1[1]


func findPermutations(coins:Array<Int>, n:Int)->Int {
    var buffer:Array<Array<Int>> = []
    for _ in 0..<n+1 {
        buffer.append(Array<Int>(count: coinsCount+1, repeatedValue: 1))
    }
    for i in 1..<n+1 {
        buffer[i][0] = 0;
        for j in 1..<coinsCount+1 {
            var value = buffer[i][j - 1];
            if (coins[j - 1] <= i) {
                value += buffer[i - coins[j - 1]][j];
            }
            buffer[i][j] = value;
        }
    }
    return buffer[n][coinsCount];
}

print(findPermutations(coins, n:sum))