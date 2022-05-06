# HSK Analysis of Chinese text

Shiny app programmed in R that matches tokens from text input to Hanyu Shuiping Kaoshi (HSK) Chinese Proficiency Exam vocabulary.

Demo the app:
1. Visit https://siviyu.shinyapps.io/hsk-analysis/
2. Enter your Chinese text (Please note that currently only HSK vocabulary in simplified Chinese is matched.)
3. Click 'Analyze.'
4. View the frequency chart and explore the table of vocabulary words.

Improvements that are in progress:
1. Break up tokens that are separated by jiebaR and do not match directly to HSK vocabulary. Many tokens that are classified with HSK level 'NA' can be broken up into functional words/characters that do match a HSK level.
2. Match traditional Chinese characters.
3. Add on matching for Test of Chinese as a Foreign Language (TOCFL) vocabulary.
4. Make bar chart interactive and indicate the number of words for each level.
5. Implement web scraping to extract text from a webpage.

Please contact me if you have any feedback and enjoy! :)
