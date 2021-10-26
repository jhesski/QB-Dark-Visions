DECLARE SUB l_roomsData ()
DECLARE SUB l_pal (pal_id%)
DECLARE SUB l_image (filename$)
DEFINT A-Z

TYPE room
  id AS INTEGER
  name AS STRING * 7
  U AS INTEGER
  D AS INTEGER
  L AS INTEGER
  R AS INTEGER
  A AS INTEGER
  pal AS INTEGER
END TYPE


DIM KeyPress AS STRING
DIM SHARED rooms(80) AS room
DIM curRoom AS INTEGER
DIM curImg AS STRING
DIM curPal AS INTEGER

curRoom = 0
curPal = 1

l_roomsData

curImg = RTRIM$(rooms(curRoom).name) + ".pic"


CLS
SCREEN 1

l_pal (curPal)
l_image (curImg)
DO
  KeyPress = UCASE$(INKEY$)

  SELECT CASE KeyPress
    CASE IS = "W"
      IF rooms(curRoom).U <> -1 THEN
        curRoom = rooms(curRoom).U
        curImg = RTRIM$(rooms(curRoom).name) + ".pic"
        IF curPal <> rooms(curRoom).pal THEN curPal = rooms(curRoom).pal: l_pal (curPal)
        l_image (curImg)
      END IF

    CASE IS = "S"
      IF rooms(curRoom).D <> -1 THEN
        curRoom = rooms(curRoom).D
        curImg = RTRIM$(rooms(curRoom).name) + ".pic"
        IF curPal <> rooms(curRoom).pal THEN curPal = rooms(curRoom).pal: l_pal (curPal)
        l_image (curImg)
      END IF

    CASE IS = "A"
        IF rooms(curRoom).L <> -1 THEN
        curRoom = rooms(curRoom).L
        curImg = RTRIM$(rooms(curRoom).name) + ".pic"
        IF curPal <> rooms(curRoom).pal THEN curPal = rooms(curRoom).pal: l_pal (curPal)
        l_image (curImg)
      END IF

    CASE IS = "D"
      IF rooms(curRoom).R <> -1 THEN
        curRoom = rooms(curRoom).R
        curImg = RTRIM$(rooms(curRoom).name) + ".pic"
        IF curPal <> rooms(curRoom).pal THEN curPal = rooms(curRoom).pal: l_pal (curPal)
        l_image (curImg)
      END IF

    CASE IS = "L"
      IF rooms(curRoom).A <> -1 THEN
        curRoom = rooms(curRoom).A
        curImg = RTRIM$(rooms(curRoom).name) + ".pic"
        IF curPal <> rooms(curRoom).pal THEN curPal = rooms(curRoom).pal: l_pal (curPal)
        l_image (curImg)
      END IF


  END SELECT

  ' LOCATE 1, 1: PRINT KeyPress
LOOP UNTIL KeyPress = CHR$(27)

SYSTEM

SUB l_image (filename$)
  vidSeg = &HA000
  DEF SEG = vidSeg
    BLOAD filename$
  DEF SEG
END SUB

SUB l_pal (pal_id%)
  blue = 1: green = 2
  cyan = 3: red = 4
  magenta = 5: orange = 6
  lightGray = 7: gray = 8
  lightBlue = 9: lightGreen = 10
  lightCyan = 11: lightOrange = 12
  lightMagenta = 13: yellow = 14
  white = 15

  SELECT CASE pal_id%
    CASE IS = 1
      PALETTE 1, gray: PALETTE 2, blue: PALETTE 3, orange

    CASE IS = 2
      PALETTE 1, blue: PALETTE 2, green: PALETTE 3, gray

    CASE IS = 3
      PALETTE 1, green: PALETTE 2, red: PALETTE 3, gray

    CASE IS = 4
      PALETTE 1, white: PALETTE 2, red: PALETTE 3, lightOrange

    CASE IS = 5
      PALETTE 1, lightOrange: PALETTE 2, gray: PALETTE 3, orange

    CASE IS = 6
      PALETTE 1, gray: PALETTE 2, lightGray: PALETTE 3, white



  END SELECT
END SUB

SUB l_roomsData ()

  OPEN "rooms.pac" FOR INPUT AS #1

  
  FOR i = 0 TO 20
    INPUT #1, rooms(i).id, rooms(i).name, rooms(i).U, rooms(i).D, rooms(i).L, rooms(i).R, rooms(i).A, rooms(i).pal, disc$
    ON ERROR RESUME NEXT
  NEXT i
  CLOSE #1

END SUB

