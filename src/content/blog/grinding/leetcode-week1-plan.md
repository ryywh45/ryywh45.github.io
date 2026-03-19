---
title: 刷題第一周計畫
pubDate: 2026-03-19
description:
---
( by claude 但我覺得很值得放 )

# Week 1: Arrays & Hashing / Two Pointers / Sliding Window

## 學習節奏

- 每個 topic 開始前：30-40 分鐘讀完下方的「核心觀念」，做筆記
- 每題上限 25 分鐘，卡住就看解答，理解後自己重寫一遍
- 每天結束花 10 分鐘回顧今天學到的 pattern

---

## Topic 1: Arrays & Hashing (Day 1-3)

### 核心 Data Structure

**Hash Map (dict in Python)**
- 儲存 key-value pair，查找 / 插入 / 刪除平均 O(1)
- 用途：快速查找某個值是否存在、記錄出現次數、建立 index mapping

**Hash Set (set in Python)**
- 只存 key，不存 value，查找 O(1)
- 用途：去重、快速判斷存在性

**Array**
- 連續記憶體，index 存取 O(1)，搜尋 O(n)
- 用途：ordered data、prefix sum、in-place 操作

### 核心觀念

1. **用 hash map 把 O(n²) 降到 O(n)**
   - 典型：Two Sum 暴力解是雙迴圈 O(n²)，用 hash map 存「我需要的 complement」就變 O(n)
   - 思考方式：「我正在用巢狀迴圈找什麼？能不能用 hash map 記住之前看過的東西？」

2. **Frequency Counting**
   - 用 hash map 計算每個元素出現次數
   - 應用：anagram 判斷（兩個字串的 frequency map 相同）、top-k frequent elements
   - Python 技巧：`collections.Counter()`

3. **Grouping by Key**
   - 把元素按某種規則分組，key 是規則的結果，value 是符合的元素 list
   - 典型：Group Anagrams → sorted string 當 key

4. **Prefix Sum**
   - 預處理陣列的累加和，讓「區間和」查詢從 O(n) 變 O(1)
   - `prefix[i] = nums[0] + nums[1] + ... + nums[i-1]`
   - 區間和 `sum(nums[l:r]) = prefix[r] - prefix[l]`

5. **In-place 操作**
   - 不用額外空間，直接在原陣列上操作
   - 典型：Product of Array Except Self 用 left pass + right pass

### 必會操作

| 操作                 | 說明                                 | 例題                            |
| ------------------ | ---------------------------------- | ----------------------------- |
| Complement lookup  | 在 hash map 中查「我需要的另一半」             | Two Sum                       |
| Frequency map      | 統計出現次數並比較                          | Valid Anagram, Top K Frequent |
| Group by key       | sorted/hashed key → group elements | Group Anagrams                |
| Prefix product/sum | 左右兩次 pass 累積結果                     | Product of Array Except Self  |
| Set for existence  | 用 set 快速判斷元素是否存在                   | Longest Consecutive Sequence  |

### 題目

| Day | 題目 | 難度 | 重點 |
|-----|------|------|------|
| 1 | Contains Duplicate | Easy | hash set 基本操作 |
| 1 | Valid Anagram | Easy | frequency counting |
| 1 | Two Sum | Easy | complement lookup pattern |
| 2 | Group Anagrams | Medium | grouping by key |
| 2 | Top K Frequent Elements | Medium | frequency map + heap 或 bucket sort |
| 2 | Encode and Decode Strings | Medium | delimiter 設計（設計題） |
| 3 | Product of Array Except Self | Medium | prefix/suffix 累積，不能用除法 |
| 3 | Longest Consecutive Sequence | Medium | set + 找序列起點，O(n) 解法 |
| 3 | Valid Sudoku | Medium | 用 hash set 檢查 row/col/box |

---

## Topic 2: Two Pointers (Day 4-5)

### 核心 Data Structure

**Sorted Array**
- Two pointers 最常用在 sorted array 上
- 排序後可以利用大小關係移動指針，避免暴力搜尋

### 核心觀念

1. **相向指針 (Opposite Direction)**
   - 一個從頭、一個從尾，根據條件決定移動哪一個
   - 前提：通常需要 sorted array
   - 典型思考：「sum 太大 → 右指針左移；sum 太小 → 左指針右移」
   - 應用：pair sum、container area、palindrome

2. **同向指針 (Same Direction)**
   - 兩個指針都從頭開始，一快一慢
   - 應用：remove duplicates in-place、partition

3. **三指針 / 固定一個 + 雙指針**
   - 3Sum 的經典做法：固定一個數，剩下的用 two pointer 找
   - 記得跳過重複值避免 duplicate results

4. **Palindrome Check**
   - 左右指針往中間走，逐一比較
   - 變體：忽略非字母數字字元、大小寫

### 必會操作

| 操作 | 說明 | 例題 |
|------|------|------|
| Pair sum on sorted array | 相向指針找 target sum | Two Sum II |
| Skip duplicates | 跳過相同值避免重複結果 | 3Sum |
| Shrink from both ends | 根據條件移動左或右 | Container With Most Water |
| Palindrome traversal | 左右同時往中間比較 | Valid Palindrome |

### 題目

| Day | 題目 | 難度 | 重點 |
|-----|------|------|------|
| 4 | Valid Palindrome | Easy | 左右指針 + 跳過非字母數字 |
| 4 | Two Sum II - Input Array Is Sorted | Medium | 相向指針基本型 |
| 4 | 3Sum | Medium | 排序 + 固定一個 + 雙指針 + 去重 |
| 5 | Container With Most Water | Medium | 相向指針 + greedy 移動較小的那邊 |
| 5 | Trapping Rain Water | Hard | 左右指針維護 leftMax/rightMax（看解答理解即可） |

---

## Topic 3: Sliding Window (Day 6-7)

### 核心 Data Structure

**Hash Map / Hash Set (window 內狀態維護)**
- 記錄 window 內的字元頻率、出現過的元素
- window 縮小時要記得更新（刪除或減少計數）

**Deque (用於 Sliding Window Maximum)**
- 雙端佇列，兩端都能 O(1) push/pop
- 用於維護 window 內的 monotonic 結構

### 核心觀念

1. **Window 的本質**
   - 維護一個 [left, right] 的區間，right 持續右移擴張，left 在條件不滿足時右移收縮
   - 比暴力枚舉所有子區間 O(n²) 降到 O(n)

2. **固定長度 Window**
   - window size 固定為 k，每次 right 右移一格、left 也右移一格
   - 應用：fixed-size 的 max/min/average subarray

3. **可變長度 Window（最常考）**
   - right 右移擴張直到滿足/違反某條件，然後 left 右移收縮直到恢復合法
   - 關鍵 template：
     ```python
     left = 0
     for right in range(len(s)):
         # 擴張：把 s[right] 加入 window 狀態
         while window_is_invalid():
             # 收縮：把 s[left] 移出 window 狀態
             left += 1
         # 更新答案（在 window 合法的狀態下）
     ```
   - 「何時收縮」是每題的核心差異

4. **Window 狀態維護**
   - 用 hash map 記錄 window 內每個字元的出現次數
   - 收縮時 `count[s[left]] -= 1`，如果變成 0 就刪掉
   - 有些題用一個 integer（如 `max_freq`）就能維護狀態，不需要完整 map

5. **「滿足條件的最短」vs「合法的最長」**
   - 最長：window 一直擴，違法時收縮，在合法狀態下更新答案
   - 最短：window 一直擴，滿足條件時先更新答案再收縮

### 必會操作

| 操作 | 說明 | 例題 |
|------|------|------|
| Variable window + set | 用 set 維護「無重複」 | Longest Substring Without Repeating Characters |
| Variable window + freq map | 用 frequency map 維護 window 內字元分佈 | Minimum Window Substring |
| Fixed window + freq map | 比較 window 和 target 的 frequency map | Permutation in String |
| Window + max_freq trick | 不需要 shrink max_freq（key insight） | Longest Repeating Character Replacement |
| Buy/sell 變體 | 不是典型 sliding window 但思路類似：維護 min price | Best Time to Buy and Sell Stock |

### 題目

| Day | 題目 | 難度 | 重點 |
|-----|------|------|------|
| 6 | Best Time to Buy and Sell Stock | Easy | 維護 min price，每步算 profit |
| 6 | Longest Substring Without Repeating Characters | Medium | 可變 window + hash set |
| 6 | Longest Repeating Character Replacement | Medium | window 內 max_freq 的巧妙用法 |
| 7 | Permutation in String | Medium | 固定 window + frequency map 比較 |
| 7 | Minimum Window Substring | Hard | 可變 window 找最短 + freq map（經典題，值得花時間） |

---

## 一週總覽

| Day | Topic | 題數 | 預計時間 |
|-----|-------|------|----------|
| 1 | Arrays & Hashing (Easy) | 3 | 1.5 hr |
| 2 | Arrays & Hashing (Medium) | 3 | 2.5 hr |
| 3 | Arrays & Hashing (Medium) | 3 | 2.5 hr |
| 4 | Two Pointers (Easy + Medium) | 3 | 2 hr |
| 5 | Two Pointers (Medium + Hard) | 2 | 2 hr |
| 6 | Sliding Window (Easy + Medium) | 3 | 2.5 hr |
| 7 | Sliding Window (Medium + Hard) | 2 | 2.5 hr |
| **Total** | | **19 題** | **~15.5 hr** |

> Hard 題（Trapping Rain Water、Minimum Window Substring）不要硬想超過 15 分鐘，看解答理解思路，隔天重寫一遍驗證理解。
