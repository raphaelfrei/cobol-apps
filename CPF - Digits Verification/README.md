# Create TWO VERIFICATION DIGITS with COBOL

Insert a 9-number sequence and it generates the last two verification digits

This template is used to generate last digits from CPF (Social Security Number in Brazil)

## Calculation:

Pretend that the last two verification digits are: X and Y

Let's pretend that the inserted sequence is: ABC.DEF.GHI

### X's Calculation:
X = (A * 10) + (B * 09) + (C * 08) + (D * 07) + ...

r = X % 11 (remainder)

X = 11 - r

IF X >= 10 then X = 0; ELSE X = X.

### Y's Calculation:

Y = (A * 11) + (B * 10) + (C * 09) + (D * 08) + ... + (X * 02)

r = Y % 11 (remainder)

Y = 11 - r

IF Y >= 10 then Y = 0; ELSE Y = Y.

## Example:

The CPF is: 123.456.789

### X's:

X = (1 * 10) + (2 * 9) + (3 * 8) + (4 * 7) + (5 * 6) + (6 * 5) + (7 * 4) + (8 * 3) + (9 * 2)

X = 210


r = 210 % 11 = 1


X = 11 - 1 so X = 0 (10 >= 10)

### Y's:

Y = (1 * 11) + (2 * 10) + (3 * 9) + (4 * 8) + (5 * 7) + (6 * 6) + (7 * 5) + (8 * 4) + (9 * 3) + (0 * 2)

Y = 255


r = 255 % 11 = 2


Y = 11 - 2 so X = 9

### Final Result:
ABC.DEF.GHI-XY

123.456.789-09
