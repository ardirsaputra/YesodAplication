{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Pendaftar where

import Import
--import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3)
--import Text.Julius()

getPendaftarR :: Handler Html
getPendaftarR = do
    allUsers <- runDB $ getAllUsers
    defaultLayout $ do
        setTitle "Pendaftar"
        $(widgetFile "pendaftar")

getAllUsers :: DB [Entity User]
getAllUsers = selectList [] [Asc UserId]