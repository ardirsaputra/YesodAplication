{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Import
--import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3)
--import Text.Julius (RawJS (..))

getHomeR :: Handler Html
getHomeR = do
    defaultLayout $ do
        setTitle "Zakaa Community!"
        $(widgetFile "homepage")

postHomeR :: Handler Html
postHomeR = do
    defaultLayout $ do
        setTitle "Zakaa Community!"
        $(widgetFile "homepage")