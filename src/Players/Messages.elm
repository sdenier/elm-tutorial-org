module Players.Messages exposing (..)

import Http
import Players.Models exposing (Player)


type Msg
    = OnFetchAll (Result Http.Error (List Player))
