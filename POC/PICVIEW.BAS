DECLARE SUB l_image (filename$)
'blue = 1: green = 2
'cyan = 3: red = 4
'magenta = 5: orange = 6
'lightGray = 7: gray = 8
'lightBlue = 9: lightGreen = 10
'lightCyan = 11: lightOrange = 12
'lightMagenta = 13: yellow = 14
'white = 15

DEFINT A-Z
DIM KeyPress AS STRING
locX = 0
locY = 0

DIM rooms(20, 20) AS STRING
FOR i = 0 TO 20
  FOR j = 0 TO 20
    rooms(i, j) = "NULL"
  NEXT j
NEXT i


rooms(0, 0) = "room4.pic"
rooms(0, 1) = "room3.pic"
rooms(0, 2) = "room5.pic"
rooms(1, 1) = "room2.pic"
rooms(1, 2) = "room1.pic"

CLS
SCREEN 1
PALETTE 1, 1: PALETTE 2, 8: PALETTE 3, 6

                           
l_image (rooms(0, 0))
DO
  KeyPress = UCASE$(INKEY$)
  IF locY > 0 THEN
    IF KeyPress = UCASE$("W") AND rooms(locX, locY - 1) <> "NULL" THEN
      locY = locY - 1
      l_image (rooms(locX, locY))
    END IF
  END IF

  IF KeyPress = UCASE$("S") AND rooms(locX, locY + 1) <> "NULL" AND locY < 20 THEN
    locY = locY + 1
    l_image (rooms(locX, locY))
  END IF

  IF KeyPress = UCASE$("a") AND rooms(locX + 1, locY) <> "NULL" AND locX < 20 THEN
    locX = locX + 1
    l_image (rooms(locX, locY))
  END IF

  IF locX > 0 THEN
    IF KeyPress = UCASE$("d") AND rooms(locX - 1, locY) <> "NULL" THEN
      locX = locX - 1
      l_image (rooms(locX, locY))
    END IF
  END IF
  LOCATE 1, 1: PRINT KeyPress

LOOP UNTIL KeyPress = CHR$(27)





SYSTEM

SUB l_image (filename$)
  vidSeg = &HA000
  LOCATE 1, 1: PRINT filename$
  DEF SEG = vidSeg
    BLOAD filename$
  DEF SEG


END SUB

