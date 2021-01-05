module Web.View.Static.Welcome where
import Web.View.Prelude
import Application.Helper.View

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
        Welcome!
|]
