module Players.Update exposing (..)

import Navigation
import Players.Commands
import Players.Messages exposing (Msg(..))
import Players.Models exposing (Player)


update : Msg -> List Player -> ( List Player, Cmd Msg )
update message players =
    case message of
        OnFetchAll (Ok newPlayers) ->
            ( newPlayers, Cmd.none )

        OnFetchAll (Err error) ->
            ( players, Cmd.none )

        ShowPlayers ->
            ( players, Navigation.newUrl "#players" )

        ShowPlayer playerId ->
            ( players, Navigation.newUrl ("#players/" ++ playerId) )

        ChangeLevel playerId howMuch ->
            ( players, requestPlayerUpdate playerId howMuch players |> Cmd.batch )

        OnSave (Ok updatedPlayer) ->
            ( updatePlayer updatedPlayer players, Cmd.none )

        OnSave (Err error) ->
            ( players, Cmd.none )


requestPlayerUpdate playerId howMuch players =
    let
        cmdForPlayer player =
            if player.id == playerId then
                Players.Commands.save { player | level = player.level + howMuch }
            else
                Cmd.none
    in
        List.map cmdForPlayer players


updatePlayer : Player -> List Player -> List Player
updatePlayer updatedPlayer players =
    let
        selectPlayer existingPlayer =
            if existingPlayer.id == updatedPlayer.id then
                updatedPlayer
            else
                existingPlayer
    in
        List.map selectPlayer players
