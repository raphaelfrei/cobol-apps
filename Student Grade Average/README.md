# Student Grade Average with COBOL
Calculates the sum of 4 grades and divides by 4<br>
### Inputs:
<pre>
- <1> Student Name (15)
- <2> Grade Name   (10)
- <3, 4, 5, 6> Grades
</pre>

### Errors:
- Grades must be number only (0 <= x <= 10)

If any grade is invalid, program will raise this error:<br>
<pre>
'***************************************'<br>
'*   GRADE INVALID, PLEASE TRY AGAIN   *'<br>
'***************************************'
</pre>

### Final Results:

The app will show this final screen if no errors are raised:<br>
<pre>
'*********** PROCESSING RESULT ***********'<br>
'STUDENT NAME : ' <1><br>
'GRADE NAME   : ' <2><br>
'GRADE AVERAGE: ' <(3 + 4 + 5 + 6)/4><br>
'RESULT       : ' APPROVED if AVG >= 7 else REPROVED<br>
'*****************************************'.
</pre>
