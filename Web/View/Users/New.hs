module Web.View.Users.New where
import Web.View.Prelude

data NewView = NewView { user :: User }

instance View NewView where
    html NewView { .. } = [hsx|
        <div class="h-100" id="sessions-new">
            <div class="d-flex align-items-center">
                <div class="w-100">
                    <div style="max-width: 400px" class="mx-auto mb-5">
                        <div>New User</div>
                        {renderFlashMessages}
                        {renderForm user}
                    </div>
                </div>
            </div>
        </div>
    |]

renderForm :: User -> Html
renderForm user = formFor user [hsx|
    {(textField #email) { placeholder="Email", fieldLabel="" }}
    {(passwordField #passwordHash) { placeholder="Password", fieldLabel="" }}
    {(passwordField #passwordHash) { placeholder="Confirm Password", fieldLabel="", fieldName="password2" }}
    {submitButton}
|]
