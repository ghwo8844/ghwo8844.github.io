module Asset exposing (..)

import ColorScheme exposing (..)
import AFrame exposing (entity)
import AFrame.Primitives exposing (box, sphere, cylinder)
import Html exposing (Html, node, Attribute)
import Html.Attributes exposing (id)
import AFrame.Primitives.Attributes exposing (position, color, scale)
import Dict exposing (Dict, insert)
import Html.Events exposing (onClick)

addAsset : Int -> Dict Int (Html msg) -> Html msg -> Dict Int (Html msg)
addAsset num arr message =
    insert num message arr

chairs : Float -> Float -> Float -> Float -> Float -> Int -> Html msg
chairs x z scaleX scaleY scaleZ num =
    box [ 
        position x (scaleY / 2 + 0.5) z,
        scale scaleX scaleY scaleZ,
        color red,
        id (toString num)
    ] [ ]

tables : Float -> Float -> Float -> Float -> Float -> Int -> Html msg
tables x z scaleX scaleY scaleZ num =
    box [
        position x (scaleY / 2 + 0.5) z,
        scale scaleX scaleY scaleZ,
        color orange,
        id (toString num)
    ] [ ]

cubes : Float -> Float -> Float -> Float -> Float -> Int -> Html msg
cubes x z scaleX scaleY scaleZ num =
    box [
        position x (scaleY / 2 + 0.5) z,
        scale scaleX scaleY scaleZ,
        color orange,
        id (toString num)
    ] [ ]

spheres : Float -> Float -> Float -> Float -> Float -> Int -> Html msg
spheres x z scaleX scaleY scaleZ num =
    sphere [ 
        position x (scaleY / 2 + 0.5) z,
        scale scaleX scaleY scaleZ,
        color red,
        id (toString num)
    ] [ ]

cylinders : Float -> Float -> Float -> Float -> Float -> Int -> Html msg
cylinders x z scaleX scaleY scaleZ num =
    cylinder [
        position x (scaleY / 2 + 0.5) z,
        scale scaleX scaleY scaleZ,
        color orange,
        id (toString num)
    ] [ ]


