### Count Occurrence of a Character/Word in a String

**Input:**
| name         |
|--------------|
| Transformers |
| Redemption   |
| Inception    |
|Redemption Inception|


**Count Occurrence of a Character:**

Count how many times 'r' appears in a string column:
- lower(name) makes it case-insensitive (counts both R and r)
- replace(..., 'r', '') removes all 'r's
- len(name) - len(...) gives the number of 'r's that were removed

  ```sql
  select name, replace(lower(name), 'r', '') as replace_name, 
  len(name)-len(replace(lower(name), 'r', '')) as count
  from movies
  ```

**`Output:`**
| name                  | replace_name          | count |
|-----------------------|------------------------|--------|
| Transformers          | tansfomes              | 3      |
| Redemption            | edemption              | 1      |
| Inception             | inception              | 0      |
| Redemption Inception  | edemption inception    | 1      |



**Count Occurrence of a word:**

Count how many times word 'tio' appears in a string column:
- lower(name) ensures the match is case-insensitive.
- replace(lower(name), 'tio', '') removes all 'tio' substrings.
- The difference in length gives total characters removed.
- Divide by len('tio') to get how many full occurrences were found.

  ```sql
  select name, replace(lower(name), 'tio', '') as replace_name, 
  (len(name)-len(replace(lower(name), 'tio', '')))/len('tio') as count
  from movies;
  ```


**`Output:`**
| name                  | replace_name          | count |
|-----------------------|------------------------|--------|
| Transformers          | transformers           | 0      |
| Redemption            | redempn                | 1      |
| Inception             | incepn                 | 1      |
| Redemption Inception  | redempn incepn         | 2      |
