module AFrame.Primitives.Attributes exposing (..)

{-| A-Frame primitive attributes.

# Mesh attributes
@docs color, metalness, shader, src, opacity, roughness, translate, transparent

# Geometry attributes
@docs radius, radiusTop, radiusBottom, position, scale, rotation, height, width, depth, segmentsRadial

# Light attributes
@docs angle, decay, distance, exponent, groundColor, intensity, type_

# Scene attributes
@docs vrModeUi

-}

import String exposing (toLower)
import Html exposing (Attribute)
import Html.Attributes exposing (attribute)
import Color exposing (green, Color, toRgb)
import Char


-- Mesh attributes

material : Color -> Attribute msg
material color =
    attribute "material" ("color: " ++ colorToHex color)

objModel : String -> Attribute msg
objModel idobj =
    attribute "obj-model" ("obj: #" ++ idobj)



colorToHex : Color -> String
colorToHex cl =
    let
        { red, green, blue, alpha } = toRgb cl
    in
        "#" ++ (toHex red) ++ (toHex green) ++ (toHex blue)


toHex : Int -> String
toHex n =
    let
        hex = toRadix n
    in
        if String.length hex == 1 then
            "0" ++ hex
        else
            hex


toRadix : Int -> String
toRadix n =
    let
        getChr c =
            if c < 10 then
                toString c
            else
                String.fromChar <| Char.fromCode (87 + c)
    in
        if n < 16 then
            getChr n
        else
            (toRadix (n // 16)) ++ (getChr (n % 16))

{-| -}
color : Color -> Attribute msg
color value =
    attribute "color" (colorToHex value)


{-| -}
metalness : Float -> Attribute msg
metalness value =
    attribute "metalness" (toString value)


{-| -}
shader : String -> Attribute msg
shader value =
    attribute "shader" value


{-| -}
src : String -> Attribute msg
src value =
    attribute "src" value


{-| -}
opacity : Float -> Attribute msg
opacity value =
    attribute "opacity" (toString value)


{-| -}
roughness : Float -> Attribute msg
roughness value =
    attribute "roughness" (toString value)


{-| -}
translate : Float -> Float -> Float -> Attribute msg
translate x y z =
    [ x, y, z ]
        |> List.map toString
        |> List.intersperse " "
        |> String.concat
        |> attribute "translate"


{-| -}
transparent : Bool -> Attribute msg
transparent value =
    attribute "transparent" (toLower (toString value))



-- Geometry Attributes


{-| -}
radius : Float -> Attribute msg
radius value =
    attribute "radius" (toString value)


{-| -}
radiusTop : Float -> Attribute msg
radiusTop value =
    attribute "radius-top" (toString value)


{-| -}
radiusBottom : Float -> Attribute msg
radiusBottom value =
    attribute "radius-bottom" (toString value)


{-| -}
position : Float -> Float -> Float -> Attribute msg
position x y z =
    [ x, y, z ]
        |> List.map toString
        |> List.intersperse " "
        |> String.concat
        |> attribute "position"


{-| -}
scale : Float -> Float -> Float -> Attribute msg
scale x y z =
    [ x, y, z ]
        |> List.map toString
        |> List.intersperse " "
        |> String.concat
        |> attribute "scale"


{-| -}
rotation : Int -> Int -> Int -> Attribute msg
rotation x y z =
    [ x, y, z ]
        |> List.map toString
        |> List.intersperse " "
        |> String.concat
        |> attribute "rotation"


{-| -}
height : Float -> Attribute msg
height value =
    attribute "height" (toString value)


{-| -}
width : Float -> Attribute msg
width value =
    attribute "width" (toString value)


{-| -}
depth : Int -> Attribute msg
depth value =
    attribute "depth" (toString value)


{-| -}
segmentsRadial : Int -> Attribute msg
segmentsRadial value =
    attribute "segments-radial" (toString value)



-- Light attributes.


{-| -}
angle : Float -> Attribute msg
angle value =
    attribute "angle" (toString value)


{-| Amount the light dims along the distance of the light.
-}
decay : Float -> Attribute msg
decay value =
    attribute "decay" (toString value)


{-| -}
distance : Float -> Attribute msg
distance value =
    attribute "distance" (toString value)


{-| -}
exponent : Float -> Attribute msg
exponent value =
    attribute "exponent" (toString value)


{-| -}
groundColor : Color -> Attribute msg
groundColor value =
    attribute "ground-color" (colorToHex value)


{-| -}
intensity : Float -> Attribute msg
intensity value =
    attribute "intensity" (toString value)


{-| -}
type_ : Float -> Attribute msg
type_ value =
    attribute "type" (toString value)


{-| The vr-mode-ui component toggles UI such as an Enter VR button, compatibility modal, and orientation modal for mobile.
The vr-mode-ui component applies only to the `<a-scene>` element.
-}
vrModeUi : Bool -> Attribute msg
vrModeUi enabled =
    let
        value =
            case enabled of
                True ->
                    "true"

                False ->
                    "false"

        attribstring =
            "enabled: " ++ value
    in
        attribute "vm-mode-ui" attribstring
