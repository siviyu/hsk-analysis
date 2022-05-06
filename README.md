# HSK Analysis of Chinese Text

Shiny app programmed in R that matches tokens from text input to Hanyu Shuiping Kaoshi (HSK) Chinese Proficiency Exam vocabulary.

Please contact me if you have any feedback and enjoy! :)

### Reproduce the app:
1. Retrieve HSK vocabulary lists that that associates Chinese words/characters to the appropriate HSK level. The code for data wrangling can be found in text-handling.Rmd.
2. Define app UI:
     - Allow user to input text. 
     - When 'Analyze' button is clicked and the text input contains Chinese characters, display histogram and frequency table.
3. Define app server logic:
     - Retrieve user input.
     - Clean user input with regular expression that removes all non-Chinese characters.
     - Tokenize text with jiebaR.
     - Left join text tokens to HSK table.
     - Render histogram to display count of distinct vocabulary and frequency table to show all text tokens and their matching HSK levels.

### Demo the app:
1. Visit https://siviyu.shinyapps.io/hsk-analysis/.
2. Enter your Chinese text. (Please note that currently only HSK vocabulary in simplified Chinese is matched.)
3. Click 'Analyze.'
4. View the frequency chart and explore the table of vocabulary words.

### Improvements that are in progress:
- Break up tokens that are separated by jiebaR and do not match directly to HSK vocabulary. Many tokens that are classified with HSK level 'NA' can be broken up into functional words/characters that do match a HSK level.
- Match traditional Chinese characters.
- Add on matching for Test of Chinese as a Foreign Language (TOCFL) vocabulary.
- Make bar chart interactive and indicate the number of words for each level.
- Implement web scraping to extract text from a webpage.

### References:
- [Chinese Text Processing with jiebaR](https://alvinntnu.github.io/NTNU_ENC2036_LECTURES/chinese-text-processing.html)
- [CSV files of HSK lists](https://github.com/plaktos/hsk_csv)

