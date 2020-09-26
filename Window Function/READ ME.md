## Read Me 

* The Leetcode SQL problems in this folder are all about window function. Enjoy!  

## Intuition 

* When the problems ask for maxium value or min value, we need to consider to use `Rank()` OR `DENSE_RANK()` to rank the value first
  and then we can select the maxium or minium value with `rank = n` 
  
* Sometimes,`RANK()` is not the only way to solve the problem, we can also use `COUNT()`. The format will change like following: 

 ```
 COUNT(col_name) OVER(PARTITION BY col_name ORDER BY col_name) 
 
 ```
 
 Please see problem 574 as an example. (https://github.com/ChengshengDeng/Leetcode-SQL-Learning/blob/master/Window%20Function/574%20Winning%20Candidate.md)</br>
 I provide 3 solutions. This problem is not as usual `RANK()` format we see. 
 So please be careful with the problem like this. 
