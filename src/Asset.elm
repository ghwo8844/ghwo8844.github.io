module Asset exposing (..)

import ColorScheme exposing (..)
import AFrame exposing (entity)
import AFrame.Primitives exposing (box)
import Html exposing (Html, node, Attribute)
import Html.Attributes exposing (id)
import AFrame.Primitives.Attributes exposing (position, color, scale)
import Dict exposing (Dict, insert)
import Html.Events exposing (onClick)

addAsset : Int -> Dict Int (Html msg) -> Html msg -> Dict Int (Html msg)
addAsset num arr message =
    insert num message arr

chairs : Float -> Float -> Float -> Float -> Int -> Html msg
chairs x z scaleX scaleZ num =
    box [ 
        position x 0.35 z,
        scale scaleX 0.6 scaleZ,
        color red,
        id (toString num)
    ] [ ]

tables : Float -> Float -> Float -> Float -> Int -> Html msg
tables x z scaleX scaleZ num =
    box [
        position x 0.35 z,
        scale scaleX 0.6 scaleZ,
        color orange,
        id (toString num)
    ] [ ]


