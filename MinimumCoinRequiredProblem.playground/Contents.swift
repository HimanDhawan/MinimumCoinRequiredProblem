import UIKit

var greeting = "Hello, playground"

/*
Problem:
--------
- Given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.
- Find the fewest number of coins that you need to make up that amount.
- If that amount of money cannot be made up by any combination of the coins, return -1.
- You may assume that you have an infinite number of each kind of coin.
- ** Also, print all coins that made up the amount in console log.
-----------------------------------------------------------------------------
| Test      | Input             | Amount    | Output    | Total coins       |
-----------------------------------------------------------------------------
| Test 1    | [1, 2, 5]         | 11        | 3         | 5 + 5 + 1         |
| Test 2    | [2]               | 3         | -1        | -                 |
| Test 3    | [1]               | 0         | 0         | -                 |
| Test 4    | [1]               | 1         | 1         | 1                 |
| Test 5    | [1]               | 2         | 2         | 1 + 1             |
| Test 6    | [1, 3, 4, 5]      | 7         | 2         | 4 + 3             |
| Test 7    | [8, 2]            | 10        | 2         | 8 + 2             |
-----------------------------------------------------------------------------
*/

func solution(coins: [Int], amount: Int) -> Int {
    
    if amount == 0 {
        return 0
    }
    
    if coins.isEmpty {
        return -1
    }
    
    if coins.count == 1 {
        let value = coins[0]
        
        if value > amount {
            return -1
        } else if value < amount {
            if amount%value == 0 {
                return amount/value
            } else {
                return 1
            }
        } else if value == amount {
            return 1
        }

    }
    let ar = coins
    let sort: Array<Int> = ar.sorted(by: {$0 < $1})
    
    
    
    var coinsRequired = Int.max
    var rightV = ar.count - 1
    
    while true {
        var isAllPoosiblitiesChecked = false
        
        var rightEnd = rightV
        var coinsR = 0
        var amountRemainder = amount
        while rightEnd >= 0 {
            let element = sort[rightEnd]
            if element > amountRemainder {
                rightEnd = rightEnd - 1
            } else if element < amountRemainder {
                coinsR = coinsR + amountRemainder/element
                
                if coinsR > coinsRequired {
                    isAllPoosiblitiesChecked = true
                    break;
                }
                
                amountRemainder = amountRemainder%element
                rightEnd = rightEnd - 1
            } else if element == amountRemainder {
                coinsR = coinsR + amountRemainder/element
                if coinsR > coinsRequired {
                    isAllPoosiblitiesChecked = true
                    break;
                }
                amountRemainder = amountRemainder%element
                rightEnd = rightEnd - 1
            }
        }
        if coinsR < coinsRequired {
            coinsRequired = coinsR
        }
        rightV = rightV - 1
        if isAllPoosiblitiesChecked == true {
            break
        }
        
    }
    
    
    print("Coins \(coinsRequired)")
    return coinsRequired
}
