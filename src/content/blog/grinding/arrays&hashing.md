---
title: Arrays & Hashing 筆記
pubDate: 2026-03-21
description: ""
---
> 2026/03/21 更新寫之前做的觀念筆記，及部分解題心得
> ...
## 用到的 data structures
### Hash Map
- 存 key-value, 查詢插入刪除 O(1)
- 用來加速查詢、紀錄出現次數(value是key的出現次數，加數值是O(1))
- python dict
### Hash Set
- 沒有value的hash map，只有key
- 去除重複、查詢 is in set O(1)
- python set
### Array
- 連續空間 index存取O(1), 查詢 (is in) O(n)
- 放ordered data (排序過的, prefix sum)
- python list
- sorted(list)

## 觀念
1. 能不能用hash map存之前看過的東西？把查詢降到O(1)
2. group by "key" 這個"key"可以是某種用來分類value的"規則"
3. prefix sum, 存之前"加過"的東西，但是用array存，因為有order
	- `prefix[i] = arr[0] + ... + arr[i-1]`

### 題目

| 編號  | 題目                           | 難度     | 重點  | 完成  |
| --- | ---------------------------- | ------ | --- | --- |
| 1   | Contains Duplicate           | Easy   |     |     |
| 2   | Valid Anagram                | Easy   |     | v   |
| 3   | Two Sum                      | Easy   |     | v   |
| 4   | Group Anagrams               | Medium |     | v   |
| 5   | Top K Frequent Elements      | Medium |     |     |
| 6   | Encode and Decode Strings    | Medium |     |     |
| 7   | Product of Array Except Self | Medium |     |     |
| 8   | Longest Consecutive Sequence | Medium |     | v   |
| 9   | Valid Sudoku                 | Medium |     |     |

## 解題心得

### Two Sum
這題用到了hashmap的特性：查詢 O(1)，用來把Array的O(n)查詢，優化成O(1)查詢。

學到的東西是，**要主動的去了解這個操作 "在查詢什麼" 以及 "用什麼查詢"**。
了解了這兩項之後，就有辦法把：`nums[i] + nums[j] = target` 這個式子，
轉成`target - nums[i] = nums[j]` ，因為你是用 `nums[j]`這個數值，在查詢`j`這個index。
而所以把`nums`中的數值放在key，index放在value，就能用hashmap優化這個查詢。

### Valid Anagram
這時候對hashmap的概念已經很熟了，所以看到題目敘述就直接想到解法，不多寫。

### Group Anagram
寫這題的時候剛寫完Valid Anagram，因為題目要求grouping，第一個想到的是把每個string轉hashmap，然後轉出來的map當另一個hashmap的key，但hashmap本身是unhashable的。

所以問題變成是要用什麼東西當key，當時先想到的是sorted string，但是時間複雜度會太高。

後面又想到兩個key的選項：
- str(hashmap) -> `n^2` 但dict轉str背後的函數不好確認時間複雜度，只能假設是constant time
- `[0]* 26` 填入英文字母出現次數 -> `n^2` 可明確寫出時間空間複雜度，這個應該是比較好的選項

這題的問題只能拆解到：要用什麼當hashmap的key。至於key要用什麼，好像沒感覺出有明確的推理路徑。
### Longest Consecutive Sequence
在這題學到的是，要先定義寫清楚暴力解的算法，才有辦法去優化或思考完全不同的解法。
最好是實做出來，或是用pseudo code來表示，但要清楚。一開始沒寫出來，導致思考的方向不清楚，浪費了一點時間。

寫清楚暴力解後（一樣用hashset加速查詢），思考的路徑就是：發現有重複計算的部份，發生在consecutive sequence的非起始element -> 只要從起始點開始建構sequence就好 -> 怎麼判斷起始點。

另外，我發現只要是判斷max/minimum相關的要求，都會用到存下current max/min value，然後每次當新數值產生後，判斷更新current max/min value的操作。