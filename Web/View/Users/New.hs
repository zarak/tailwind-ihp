module Web.View.Users.New where
import Web.View.Prelude

data NewView = NewView { user :: User }

instance View NewView where
    html NewView { .. } = [hsx|
        <h1>New User</h1>
        {renderForm user}
    |]

renderForm :: User -> Html
renderForm user = formFor user [hsx|
    {(textField #email) { placeholder="Email", fieldLabel="" }}
    {(passwordField #passwordHash) { placeholder="Password", fieldLabel="" }}
    {(passwordField #passwordHash) { placeholder="Confirm Password", fieldLabel="", fieldName="password2" }}
    {submitButton}
|]
