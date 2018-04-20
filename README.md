# CarWowCodingChallenge

## Scope of project

This project is a coding assignment from CarWow. The objective was to make a bitmap editor that takes in the commands as follows:

* I N M - Create a new M x N image with all pixels coloured white (O).
* C - Clears the table, setting all pixels to white (O).
* L X Y C - Colours the pixel (X,Y) with colour C.
* V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
* H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
* S - Show the contents of the current image**

### Example:

```
I 5 6
L 1 3 A
V 2 3 6 W
H 3 5 2 Z
S
```

should become 

```
OOOOO
OOZZZ
AWOOO
OWOOO
OWOOO
OWOOO
```

## Major Changes I have made

1. Added support for all of the above cases 
2. Made a new class to handle each of the above cases 
3. Did some input sanitization work
4. Wrote more test cases 
5. Handled abnormal cases for input 