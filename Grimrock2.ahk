    ; Legend of Grimrock 2
    ;  Ultimate keyboard macros v 0.1
    ; Autohotkey Script
    ;    by Ben Staniford
    ; Original Grimrock 1 script by d32, techzen, Adakos
    ; Download Autohotkey at: http://www.autohotkey.com/
    #SingleInstance force
    SetTitleMatchMode, 2
    CoordMode, Mouse,

    ; This must be set >0 or grimrock won't process the commands properly
    SetDefaultMouseSpeed, 2

    ; ====================================================================================
    ; | Global Constants - these should be valid for all screen resolutions              |
    ; ====================================================================================

    ; Workaround.. For some reason, grimrock 2 doesn't register mouseclicks unless you do them multiple times..  8 seems to work reliably
    clickMultiplier := 8

    ; Weapon lock after swap (imposed by grimrock 2)
    weaponLockTime := 1000

    ; relative positions of weapon slots and character bars
    dx1l := 0.14 ; X position of 1st and 3rd char left hand
    dx2l := 0.62 ; X position of 2nd and 4th char left hand
    dx1r := 0.34 ; X position of 1st and 3rd char right hand
    dx2r := 0.81 ; X position of 2nd and 4th char right hand
    dy1  := 0.32 ; Y position of 1st and 2nd char hands
    dy2  := 0.79 ; Y position of 3rd and 4th char hands

    ; spell book run buttons
    xSpellButton7 := 0
    ySpellButton7 := 0
    xSpellButton4 := 0
    ySpellButton4 := 0
    xSpellButton1 := 0
    ySpellButton1 := 0
    xSpellButton8 := 0
    ySpellButton8 := 0
    xSpellButton5 := 0
    ySpellButton5 := 0
    xSpellButton2 := 0
    ySpellButton2 := 0
    xSpellButton9 := 0
    ySpellButton9 := 0
    xSpellButton6 := 0
    ySpellButton6 := 0
    xSpellButton3 := 0
    ySpellButton3 := 0
    xSpellCastingButton := 0
    ySpellCastingButton := 0

    ; character portraits locations
    dy1b  := 0.15 ; Y position of 1st and 2nd char portrait
    dy2b  := 0.63 ; Y position of 3rd and 4th char portrait

    ; Hand and position enumerations used as short hand by functions
    Left := 1
    Right := 2
    TopLeft := 1
    TopRight := 2
    BottomLeft := 3
    BottomRight := 4

    ; ====================================================================================
    ; | Helper Functions                                                                 |
    ; ====================================================================================

    ; reads the resolution, determins the corner of characters' rectangle
    Init()
    {
       global
       sysget, resX, 0
       sysget, resY, 1
       characterHeight := resY * 0.39
       characterWidth := characterHeight / 0.90
       
       characterX := resX-characterWidth
       characterY := resY-characterHeight

       ; First rune row in spell book (assuming wizard in bottom left)
       xSpellButton7 := characterX+(characterWidth*dx1l)
       ySpellButton7 := characterY+(characterHeight*(dy2 - 0.1))
       xSpellButton4 := characterX+(characterWidth*dx1l)
       ySpellButton4 := characterY+(characterHeight*dy2)
       xSpellButton1 := characterX+(characterWidth*dx1l)
       ySpellButton1 := characterY+(characterHeight*(dy2 + 0.1))
       
       ; Second row in spell book
       xSpellButton8 := characterX+(characterWidth*(dx1l + 0.09))
       ySpellButton8 := characterY+(characterHeight*(dy2 - 0.1))
       xSpellButton5 := characterX+(characterWidth*(dx1l + 0.09))
       ySpellButton5 := characterY+(characterHeight*dy2)
       xSpellButton2 := characterX+(characterWidth*(dx1l + 0.09))
       ySpellButton2 := characterY+(characterHeight*(dy2 + 0.1))
       
       ; Third row in spell book
       xSpellButton9 := characterX+(characterWidth*(dx1l + 0.18))
       ySpellButton9 := characterY+(characterHeight*(dy2 - 0.1))
       xSpellButton6 := characterX+(characterWidth*(dx1l + 0.18))
       ySpellButton6 := characterY+(characterHeight*dy2)
       xSpellButton3 := characterX+(characterWidth*(dx1l + 0.18))
       ySpellButton3 := characterY+(characterHeight*(dy2 + 0.1))
       
       ; Casting button in spell book
       xSpellCastingButton := characterX+(characterWidth*(dx1l + 0.24))
       ySpellCastingButton := characterY+(characterHeight*dy2)
    }

    Init()

    StoreMousePos()
    {
       global
       MouseGetPos, mX, mY
    }

    RestoreMousePos()
    {
       global
       MouseMove, mX, mY
    }

    RightClickAndReturn(x, y)
    {
       global
       StoreMousePos()
       MouseClick, right, x, y, clickMultiplier, 2, D
       MouseClick, right, x, y, clickMultiplier, 2, U
       RestoreMousePos()
    }

    SwapAtX(xPos)
    {
       global
       BlockInput On

       srcX := xPos
       srcY := characterY+(characterHeight*dy2b)
       dstX := xPos
       dstY := characterY+(characterHeight*dy1b)

       ; Click, drag and unclick
       MouseMove, srcX, srcY
       MouseClick, left, srcX, srcY, clickMultiplier, 2, D
       MouseClickDrag, left, srcX, srcY, dstX, dstY
       MouseClick, left, dstX, dstY, clickMultiplier, 2, U

       BlockInput Off
    }

    AttackWithHand(Hand, Position)
    {
       global
       xPos := 0
       yPos := 0

        StoreMousePos()

       if (Hand = Right)
       {
          if (Position = TopLeft)
          {
             xPos := dx1l
             yPos := dy1
          }
          else if (Position = TopRight)
          {
             xPos := dx2l
             yPos := dy1
          }
          else if (Position = BottomLeft)
          {
             xPos := dx1l
             yPos := dy2
          }
          else if (Position = BottomRight)
          {
             xPos := dx2l
             yPos := dy2
          }
       }
       else
       {
          if (Position = TopLeft)
          {
             xPos := dx1r
             yPos := dy1
          }
          else if (Position = TopRight)
          {
             xPos := dx2r
             yPos := dy1
          }
          else if (Position = BottomLeft)
          {
             xPos := dx1r
             yPos := dy2
          }
          else if (Position = BottomRight)
          {
             xPos := dx2r
             yPos := dy2
          }
       }

       RightClickAndReturn(characterX+(characterWidth*xPos),  characterY+(characterHeight*yPos))
       RestoreMousePos()
    }

    CharacterSwapWeapons(Position)
    {
       global

       xPos := 0
       yPos := 0

       if (Position = TopLeft)
       {
          xPos := dx1r
          yPos := dy1
       }
       else if (Position = TopRight)
       {
          xPos := dx2r
          yPos := dy1
       }
       else if (Position = BottomLeft)
       {
          xPos := dx1r
          yPos := dy2
       }
       else if (Position = BottomRight)
       {
          xPos := dx2r
          yPos := dy2
       }

       xPix := characterX+(characterWidth*xPos)
       yPix := characterY+(characterHeight*yPos)

        StoreMousePos()
        MouseMove, xPix, yPix
       Send {x}
       Sleep 100
       RestoreMousePos()
    }

    Swap(Side)
    {
       global
       StoreMousePos()

       if (Side = Left)
       {
          SwapAtX(characterX+(characterWidth*dx1r))
       }
       else
       {
          SwapAtX(characterX+(characterWidth*dx2r))
       }

       RestoreMousePos()
    }

    SwapAndAttack(Side)
    {
       global

       Swap(Side)
       Sleep weaponLockTime

       if (Side = Left)
       {
          AttackWithHand(Right, TopLeft)
       }
       else
       {
          AttackWithHand(Right, TopRight)
       }
    }

    ClickSpellRune(KeyPadNumber)
    {
       global

       xPos := 0
       yPos := 0

       if (KeyPadNumber = 1)
       {
          xPos := xSpellButton1
          yPos := ySpellButton1
       }
       else if (KeyPadNumber = 2)
       {
          xPos := xSpellButton2
          yPos := ySpellButton2
       }
       else if (KeyPadNumber = 3)
       {
          xPos := xSpellButton3
          yPos := ySpellButton3
       }
       else if (KeyPadNumber = 4)
       {
          xPos := xSpellButton4
          yPos := ySpellButton4
       }
       else if (KeyPadNumber = 5)
       {
          xPos := xSpellButton5
          yPos := ySpellButton5
       }
       else if (KeyPadNumber = 6)
       {
          xPos := xSpellButton6
          yPos := ySpellButton6
       }
       else if (KeyPadNumber = 7)
       {
          xPos := xSpellButton7
          yPos := ySpellButton7
       }
       else if (KeyPadNumber = 8)
       {
          xPos := xSpellButton8
          yPos := ySpellButton8
       }
       else if (KeyPadNumber = 9)
       {
          xPos := xSpellButton9
          yPos := ySpellButton9
       }
       else if (KeyPadNumber = 0)
       {
          xPos := xSpellCastingButton
          yPos := ySpellCastingButton
       }

       RightClickAndReturn(xPos, yPos)
    }

    ; Should draw a box around all 4 characters
    RunCharacterBoxTest()
    {
       global
       StoreMousePos()
       MouseMove, characterX, resY-10, 6
       MouseMove, characterX, characterY, 6
       MouseMove, resX-10, characterY, 6
       MouseMove, resX-10, resY-10, 6
       MouseMove, characterX, resY-10, 6
       RestoreMousePos()
    }

    ; Should visit all the runes on the spell book
    RunSpellBookTest()
    {
       global

       StoreMousePos()
       
       ; Up the first row
       MouseMove, xSpellButton1, ySpellButton1, 6
       MouseMove, xSpellButton4, ySpellButton4, 6
       MouseMove, xSpellButton7, ySpellButton7, 6

       ; Down the second row
       MouseMove, xSpellButton8, ySpellButton8, 6
       MouseMove, xSpellButton5, ySpellButton5, 6
       MouseMove, xSpellButton2, ySpellButton2, 6

       ; Up the third row
       MouseMove, xSpellButton3, ySpellButton3, 6
       MouseMove, xSpellButton6, ySpellButton6, 6
       MouseMove, xSpellButton9, ySpellButton9, 6

       MouseMove, xSpellCastingButton, ySpellCastingButton, 6

       RestoreMousePos()
    }

    ; ====================================================================================
    ; | Key mappings                                                                     |
    ; ====================================================================================
    #IfWinActive Grimrock ahk_class EWindowClass

    ; Bring up the inventory
    i::1

    ; Attack commands for all character/hand combinations
    j::AttackWithHand(Right, TopLeft)
    k::AttackWithHand(Right, TopRight)
    m::AttackWithHand(Right, BottomLeft)
    ,::AttackWithHand(Right, BottomRight)
    l::AttackWithHand(Left, TopLeft)
    `;::AttackWithHand(Left, TopRight)
    .::AttackWithHand(Left, BottomLeft)
    /::AttackWithHand(Left, BottomRight)

    ; Swap characters
    9::Swap(Left)
    0::Swap(Right)

    ; Swap characters and attack on either side
    o::SwapAndAttack(Left)
    p::SwapAndAttack(Right)

    ; Swap both left and right chars
    Capslock::
    {
       Swap(Left)
       Swap(Right)
       return
    }

    ; Weapon set swap keys
    f1::CharacterSwapWeapons(TopLeft)
    f2::CharacterSwapWeapons(TopRight)
    f3::CharacterSwapWeapons(BottomLeft)
    f4::CharacterSwapWeapons(BottomRight)

    ; Num pad open the spell book by pressing +
    NumpadAdd::AttackWithHand(Right, BottomLeft)
    ; Num pad access to the spell book (assumes wizard is bottom left and is using left hand for spells)
    Numpad1::ClickSpellRune(1)
    Numpad2::ClickSpellRune(2)
    Numpad3::ClickSpellRune(3)
    Numpad4::ClickSpellRune(4)
    Numpad5::ClickSpellRune(5)
    Numpad6::ClickSpellRune(6)
    Numpad7::ClickSpellRune(7)
    Numpad8::ClickSpellRune(8)
    Numpad9::ClickSpellRune(9)
    ; Pressing 0 casts the spell
    Numpad0::ClickSpellRune(0)

    ; Hit control-t to check that the character box constants are correct for your monitor (This will move the mouse around your character box)
    ^t::RunCharacterBoxTest()

    ; Hit control-s to check that the spell book constants are correct for your monitor (This will move the mouse around the spell book assuming your wizard is bottom left)
    ^s::RunSpellBookTest()

    #IfWinActive
