port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id, class)
import Html.Events exposing (onClick)
import AFrame exposing (scene, entity)
import AFrame.Primitives exposing (assets, assetItem, box, light, cylinder, sphere)
import AFrame.Primitives.Attributes exposing (position, color, src, scale, objModel, material, angle)
import String exposing (length)
import CameraConfig exposing (..)
import ColorScheme exposing (..)
import Base exposing (..)
import Asset exposing (..)
import Dict exposing (Dict, insert, empty, values)
import List exposing (head, tail)

port check : String -> Cmd msg

port suggestion : (List Float -> msg) -> Sub msg

vals : List Float
vals = []

type alias Model = { dic : Dict Int (Html Msg) , index : Int }


type Msg
    = Chair Float Float Float Float Float
    | Table Float Float Float Float Float
    | Cube Float Float Float Float Float
    | Sphere Float Float Float Float Float
    | Cylinder Float Float Float Float Float
    | Put


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
    suggestion handleVal

first list =
  case list of
    f::_ -> f
    [] -> 0

back list =
    Maybe.withDefault [] (tail list)

handleVal : List Float -> Msg
handleVal val =
    if (first val == 0) then
        Chair (first ( back val )) (first ( back ( back val ) )) (first ( back ( back ( back val ) ) )) (first ( back ( back ( back ( back val ) ) ) )) (first ( back ( back ( back ( back ( back val ) ) ) ) ))
    else if (first val == 1) then
        Table (first ( back val )) (first ( back ( back val ) )) (first ( back ( back ( back val ) ) )) (first ( back ( back ( back ( back val ) ) ) )) (first ( back ( back ( back ( back ( back val ) ) ) ) ))
    else if (first val == 2) then
        Cube (first ( back val )) (first ( back ( back val ) )) (first ( back ( back ( back val ) ) )) (first ( back ( back ( back ( back val ) ) ) )) (first ( back ( back ( back ( back ( back val ) ) ) ) ))
    else if (first val == 3) then
        Sphere (first ( back val )) (first ( back ( back val ) )) (first ( back ( back ( back val ) ) )) (first ( back ( back ( back ( back val ) ) ) )) (first ( back ( back ( back ( back ( back val ) ) ) ) ))
    else
        Cylinder (first ( back val )) (first ( back ( back val ) )) (first ( back ( back ( back val ) ) )) (first ( back ( back ( back ( back val ) ) ) )) (first ( back ( back ( back ( back ( back val ) ) ) ) ))


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
        Put ->
            ( model, check "Put")


side =
    30.0

height = 
    3.0

view : Model -> Html Msg
view model =
    div [ ] [
        scene [ ] [ 
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
        ],
        button [ id "layout1", class "mdl-button mdl-js-button mdl-js-ripple-effect", onClick Put] [ text "Deploy" ]
    ]
