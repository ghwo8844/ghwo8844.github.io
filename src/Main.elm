module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id)
import Html.Events exposing (onClick)
import AFrame exposing (scene, entity)
import AFrame.Primitives exposing (assets, assetItem, box)
import AFrame.Primitives.Attributes exposing (position, color, src, scale, objModel, material)
import String exposing (length)
import CameraConfig exposing (..)
import ColorScheme exposing (..)
import Base exposing (..)
import Asset exposing (..)


type alias Model = List (Html Msg)


type Msg
    = Chair | Table


init : (Model, Cmd Msg)
init =
    ([], Cmd.none)  


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
        Chair ->
            ( addAsset (chairs 0 0 0 0) , Cmd.none)
        Table ->
            ( addAsset (tables 0 0 0 0) , Cmd.none)

side =
    30.0

height = 
    3.0

view : Model -> Html Msg
view model =
    div [ id "container" ] [
        div [ id "aframe" ] [
            scene [ ] [ 
                cam
                , entity [ ] [ 
                        box [ 
                            position 0 0 0,
                            scale side 0.1 side,
                            color ground
                        ] [ ],
                        box [ 
                            position (side / 2) (height / 2) 0,
                            scale 0.1 height side,
                            color ground
                        ] [ ],
                        box [ 
                            position (side / -2) (height / 2) 0,
                            scale 0.1 height side,
                            color ground
                        ] [ ],
                        box [ 
                            position 0 (height / 2) (side / 2),
                            scale side height 0.1,
                            color ground
                        ] [ ],
                        box [ 
                            position 0 (height / 2) (side / -2),
                            scale side height 0.1,
                            color ground
                        ] [ ]
                    ]
                , bg
                , entity [ ] assetList
            ]   
        ],
        div [ id "layout" ] [
            button [ onClick Chair ] [ text "Chair" ],
            button [ onClick Table ] [ text "Table" ]
        ]
    ]
