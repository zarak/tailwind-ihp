module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types
import IHP.LoginSupport.Types

instance HasNewSessionUrl User where
    newSessionUrl _ = "/NewSession"

data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    deriving (Eq, Show, Data)

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data TweetsController
    = TweetsAction
    | NewTweetAction
    | ShowTweetAction { tweetId :: !(Id Tweet) }
    | CreateTweetAction
    | EditTweetAction { tweetId :: !(Id Tweet) }
    | UpdateTweetAction { tweetId :: !(Id Tweet) }
    | DeleteTweetAction { tweetId :: !(Id Tweet) }
    deriving (Eq, Show, Data)

data UsersController
    = UsersAction
    | NewUserAction
    | ShowUserAction { userId :: !(Id User) }
    | CreateUserAction
    | EditUserAction { userId :: !(Id User) }
    | UpdateUserAction { userId :: !(Id User) }
    | DeleteUserAction { userId :: !(Id User) }
    deriving (Eq, Show, Data)
