module Players.Messages exposing (..)

import Http
import Players.Models exposing (..)


type Msg
    = OnFetchAll (Result Http.Error (List Player))
    | ShowPlayers
    | ShowPlayer PlayerId
