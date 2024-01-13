## LeetCode Challenge50 - @Ricardo Ferreira
The only way to keep your game at a very high level
is being challenged every day. Nice source of coding challenges at https://leetcode.com
Let's dive into it!
## _Tools_
- MySQL 8.0+
- VS de

## _Table of contents_
- [LeetCode Challenge50 - @Ricardo Ferreira](#leetcode-challenge50---ricardo-ferreira)
- [_Tools_](#tools)
- [_Table of contents_](#table-of-contents)
- [_Screenshot_](#screenshot)
- [_Links_](#links)
- [_Built with_](#built-with)
- [_What I practiced_](#what-i-practiced)
- [_Continued development_](#continued-development)
  - [_Useful resources_](#useful-resources)
- [_Author_](#author)
- [Acknowledgments](#acknowledgments)


## _Screenshot_
[![](./binarySearch.png)]()
## _Links_
- Live Site URL: [] 
## _Built with_

 ![](https://ferreiras.dev.br/assets/images/icons/java-icon.svg)| ![](https://ferreiras.dev.br/assets/images/icons/git-scm-icon.svg) | ![](https://ferreiras.dev.br/assets/images/icons/icons8-intellij-idea.svg) | ![](https://ferreiras.dev.br/assets/images/icons/linux-original.svg) | ![](https://ferreiras.dev.br/assets/images/icons/icons8-visual-studio-code.svg)

 ## _What I practiced_
```sql
SELECT product_id, year AS first_year, quantity, price 
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year) 
    FROM Sales 
    GROUP BY product_id
);
Approach
Find the earliest year each product was sold by grouping sales data.

MIN() → This function returns the smallest value of the selected column

GROUP BY → This command groups rows that have the same values into summary rows, typically to perform aggregate functions on them

Select and display product details for those earliest years.

SELECT → This command retrieves data from a database

AS → This command renames a column with an alias (temporary name). In most database languages, we can skip the AS keyword and get the same result

IN → This operator allows to specify multiple values

Complexity
Time complexity: O(n)O(n)O(n)
n is the number of rows in the table. This is because the query processes each row in the table once to find the first year of every product sold.

``` 

## _Continued development_
- Next step: Hackerrank challenges.
- 
### _Useful resources_
- [https://docs.mysql.com] Always trust and read the official documentation!
- [https://cp-algorithms.com/]  A must stop by to tackle DSA...
## _Author_
- Website - [https://ferreiras.dev.br]  
## Acknowledgments
