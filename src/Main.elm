module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id)
import AFrame exposing (scene, entity)
import AFrame.Primitives exposing (assets, assetItem, box)
import AFrame.Primitives.Attributes exposing (position, color, src, scale, objModel, material)
import String exposing (length)
import CameraConfig exposing (..)
import ColorScheme exposing (..)
import Base exposing (..)


type alias Model =
    { active : String }


type Msg
    = Click String 


init : ( Model, Cmd Msg )
init =
    ( Model "", Cmd.none )


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


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Click string ->
            if length ( model.active ) > 0 && string == model.active
                then ( { model | active = "" }, Cmd.none ) 
                else ( { model | active = string }, Cmd.none )

side =
    30.0

height = 
    3.0

view : Model -> Html Msg
view model =
    scene [ ] [ 
        assets [ ] [
            assetItem [ 
                id "table-obj",
                src "./assets/RageTable.obj"
            ] [ ]
        ]
        , entity [ objModel "table-obj", position 0 0 0, scale 0.05 0.05 0.05, material red ] [ ]
        , cam
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
    ]   
