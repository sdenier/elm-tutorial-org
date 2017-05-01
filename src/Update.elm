module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Players.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PlayersMsg subMsg ->
            let
                ( updatedPLayers, cmd ) =
                    Players.Update.update subMsg model.players
            in
                ( { model | players = updatedPLayers }, Cmd.map PlayersMsg cmd )
