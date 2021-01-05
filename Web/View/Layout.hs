module Web.View.Layout (defaultLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A
import Generated.Types
import IHP.Controller.RequestContext
import Web.Types
import Web.Routes

import Application.Helper.View

defaultLayout :: Html -> Html
defaultLayout inner = H.docTypeHtml ! A.lang "en" $ [hsx|
<head>
    {metaTags}

    {stylesheets}
    {scripts}

    <title>App</title>
</head>
<body>
    {navbar}
    <div class="px-4 mt-4">
        {renderFlashMessages}
        {inner}
    </div>
</body>
|]

stylesheets :: Html
stylesheets = do
    when isDevelopment [hsx|
        <link rel="stylesheet" href="/vendor/flatpickr.min.css"/>
        <link rel="stylesheet" href="/app.css"/>
    |]
    when isProduction [hsx|
        <link rel="stylesheet" href="/prod.css"/>
    |]

scripts :: Html
scripts = do
    when isDevelopment [hsx|
        <script id="livereload-script" src="/livereload.js"></script>
        <script src="/vendor/jquery-3.2.1.slim.min.js"></script>
        <script src="/vendor/timeago.js"></script>
        <script src="/vendor/popper.min.js"></script>
        <script src="/vendor/bootstrap.min.js"></script>
        <script src="/vendor/flatpickr.js"></script>
        <script src="/helpers.js"></script>
        <script src="/vendor/morphdom-umd.min.js"></script>
    |]
    when isProduction [hsx|
        <script src="/prod.js"></script>
    |]


metaTags :: Html
metaTags = [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="App"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="TODO"/>
    <meta property="og:description" content="TODO"/>
|]

navbar :: Html
navbar = [hsx|
<nav class="bg-gray-800">
  <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
    <div class="relative flex items-center justify-between h-16">
      <div class="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
      </div>
      <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">

        <div class="ml-3 relative">
          <div class="text-white">
            {userSessionButton}
          </div>
        </div>
      </div>
    </div>

  </div>
</nav>
    |] 
    --where userSessionButton = logoutButtonHtml
    where userSessionButton = case currentUserOrNothing of 
                                Just user -> logoutButtonHtml user
                                Nothing -> loginButtonHtml


logoutButtonHtml :: User -> Html
logoutButtonHtml _ = [hsx|
    <a class="inline-block mr-0 text-blue-100 bg-blue-500 px-4 py-2 rounded hover:bg-blue-400 hover:text-blue-50 transition ease-in duration-100 js-delete js-delete-no-confirm"
       href={DeleteSessionAction}>Logout</a>
|]

loginButtonHtml :: Html
loginButtonHtml = [hsx|
    <a class="px-3" href={NewUserAction}>Sign Up</a>
    <a class="btn font-bold" href={NewSessionAction}>Login</a>
|]
