module Models exposing (..)

import Players.Models exposing (Player, PlayerId)


type Route
    = PlayersRoute
    | PlayerRoute PlayerId
    | NotFoundRoute


type alias Model =
    { players : List Player
    , route : Route
    }


initialModel : Route -> Model
initialModel route =
    { players = []
    , route = route
    }
