module Asset exposing (..)

import ColorScheme exposing (..)
import AFrame exposing (entity)
import AFrame.Primitives exposing (box)
import Html exposing (Html, node, Attribute)
import AFrame.Primitives.Attributes exposing (position, color, scale)

assetList : List (Html msg)
assetList = 
    []

addAsset : Html msg -> List (Html msg)
addAsset message =
    message :: assetList

chairs : Float -> Float -> Float -> Float -> Html msg
chairs x z scaleX scaleZ =
    box [ 
        position x 0.5 z,
        scale scaleX 1 scaleZ,
        color red
    ] [ ]

tables : Float -> Float -> Float -> Float -> Html msg
tables x z scaleX scaleZ =
    box [
        position x 0.5 z,
        scale scaleX 1 scaleZ,
        color orange
    ] [ ]


