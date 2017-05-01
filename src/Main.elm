module Main exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model, Route, initialModel)
import Navigation
import Players.Commands exposing (fetchAll)
import Routing exposing (parseLocation)
import Update exposing (update)
import View exposing (view)


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        initialRoute =
            parseLocation location
    in
        ( initialModel initialRoute, Cmd.map PlayersMsg fetchAll )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
