{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Daftar where

import Import
--import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3)
import Text.Julius(RawJS (..))
-- Define our data that will be used for creating the form.
getDaftarR :: Handler Html
getDaftarR = do
    defaultLayout $ do
        let (pendaftaranFormId, namaTextareaId, institusiTextareaId,bidangkeahlianTextareaId,jeniskelaminTextareaId,tanggal_lahirTextareaId,alamatTextareaId,bakatTextareaId,pengalamanTextareaId,hobiTextareaId,nomorTextareaId) = pendaftaranIds
        setTitle "Registrasi"
        $(widgetFile "daftar")

postDaftarR :: Handler Value
postDaftarR = do 
    user <- (requireJsonBody :: Handler User)
    insertedUser <- runDB $ insertEntity user
    returnJson insertedUser
    
pendaftaranIds :: (Text, Text, Text, Text, Text, Text, Text, Text, Text, Text, Text)
pendaftaranIds = ("js-pendaftaranForm", "js-createNamaTextarea", "js-createInstitusiTextarea", "js-createBidangkeahlianTextarea", "js-createJeniskelaminTextarea", "js-createTanggal_lahirTextarea", "js-createAlamatTextarea", "js-createBakatTextarea", "js-createPengalamanTextarea", "js-createHobiTextarea", "js-createNomorTextarea")