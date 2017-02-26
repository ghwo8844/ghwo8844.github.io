port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id)
import Html.Events exposing (onClick)
import AFrame exposing (scene, entity)
import AFrame.Primitives exposing (assets, assetItem, box, light)
import AFrame.Primitives.Attributes exposing (position, color, src, scale, objModel, material, angle)
import String exposing (length)
import CameraConfig exposing (..)
import ColorScheme exposing (..)
import Base exposing (..)
import Asset exposing (..)
import Dict exposing (Dict, insert, empty, values)

port check : String -> Cmd msg

port suggestion : (List Float -> msg) -> Sub msg


type alias Model = { dic : Dict Int (Html Msg) , index : Int }


type Msg
    = Chair Float Float Float Float Float
    | Table Float Float Float Float Float
    | Cube Float Float Float Float Float
    | Sphere Float Float Float Float Float
    | Cylinder Float Float Float Float Float
    | Click String


init : (Model, Cmd Msg)
init =
    ({dic = empty, index = 0}, Cmd.none)  


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Chair a b c d e ->
            ( { model | dic = (addAsset model.index model.dic (chairs a b c d e model.index)), index = model.index + 1} , Cmd.none)
        Table a b c d e ->
            ( { model | dic = (addAsset model.index model.dic (tables a b c d e model.index)), index = model.index + 1} , Cmd.none)
        Cube a b c d e ->
            ( { model | dic = (addAsset model.index model.dic (cubes a b c d e model.index)), index = model.index + 1} , Cmd.none)
        Sphere a b c d e ->
            ( { model | dic = (addAsset model.index model.dic (spheres a b c d e model.index)), index = model.index + 1} , Cmd.none)
        Cylinder a b c d e ->
            ( { model | dic = (addAsset model.index model.dic (cylinders a b c d e model.index)), index = model.index + 1} , Cmd.none)
        Click string ->
            ( model , Cmd.none)


side =
    30.0

height = 
    3.0

view : Model -> Html Msg
view model =
    scene [ id "noob" ] [ 
        cam ,
        light [ angle 180, position 0 10 0 ] [ ],
        light [ angle 180, position 20 10 20 ] [ ],
        light [ angle 180, position 20 10 -20 ] [ ],
        light [ angle 180, position -20 10 -20 ] [ ],
        light [ angle 180, position -20 10 20 ] [ ],
        entity [ ] [
                box [ 
                    position 0 0 0,
                    scale side 0.1 side,
                    color ground
                ] [ ] ,
                box [ 
                    position (side / 2) (height / 2) 0,
                    scale 0.1 height side,
                    color ground
                ] [ ] ,
                box [ 
                    position (side / -2) (height / 2) 0,
                    scale 0.1 height side,
                    color ground
                ] [ ] ,
                box [ 
                    position 0 (height / 2) (side / 2),
                    scale side height 0.1,
                    color ground
                ] [ ] ,
                box [ 
                    position 0 (height / 2) (side / -2),
                    scale side height 0.1,
                    color ground
                ] [ ]
            ] ,
        bg ,
        entity [ ] (values (model.dic))
    ]
