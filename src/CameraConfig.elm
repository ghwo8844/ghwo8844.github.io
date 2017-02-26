module CameraConfig exposing (..)

import AFrame.Primitives.Cursor exposing (..)
import AFrame.Primitives.Camera exposing (..)
import AFrame.Primitives exposing (sky)
import AFrame exposing (entity)
import AFrame.Primitives.Attributes exposing (position, color, radius)
import Html exposing (Html)
import ColorScheme exposing (background)

cam = 
    camera [ position 0 1.6 0, far 1000 ] [
        cursor [ fuse True , position 0 0 5, color cursor] [
            
        ]
    ]

bg =
    sky [ 
        color background,
        radius 500
    ] []