module CameraConfig exposing (..)

import AFrame.Primitives.Cursor exposing (..)
import AFrame.Primitives.Camera exposing (..)
import AFrame.Primitives exposing (sky)
import AFrame exposing (entity)
import AFrame.Primitives.Attributes exposing (position, color, radius)
import Html exposing (Html)
import ColorScheme exposing (..)

cam = 
    camera [ position 0 9 0, far 1000 ] [
        cursor [ fuse True , color cursorColor] [

        ]
    ]

bg =
    sky [ 
        color background,
        radius 500
    ] []