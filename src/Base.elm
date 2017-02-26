module Base exposing (..)

import AFrame exposing (scene, entity)
import AFrame.Primitives exposing (assets, assetItem, box)
import AFrame.Primitives.Attributes exposing (position, color, src, scale)
import Html exposing (Html)
import ColorScheme exposing (..)

getBase : Float -> Float -> Html msg
getBase side height =
    entity [ ] [ 
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