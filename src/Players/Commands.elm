module Players.Commands exposing (..)

import Json.Decode as Decode exposing (field)
import Http
import Players.Messages exposing (..)
import Players.Models exposing (Player)


fetchAll : Cmd Msg
fetchAll =
    Http.get fetchAllUrl collectionDecoder |> Http.send OnFetchAll


fetchAllUrl : String
fetchAllUrl =
    "http://localhost:4000/players"


collectionDecoder : Decode.Decoder (List Player)
collectionDecoder =
    Decode.list memberDecoder


memberDecoder : Decode.Decoder Player
memberDecoder =
    Decode.map3 Player
        (field "id" Decode.string)
        (field "name" Decode.string)
        (field "level" Decode.int)
