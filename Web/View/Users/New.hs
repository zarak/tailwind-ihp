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
    <form method="POST" action={NewUserAction}>
        <div class="form-group">
            <input name="email" type="email" class="form-control" placeholder="E-Mail"/>
        </div>
        <div class="form-group">
            <input name="password" type="password" class="form-control" placeholder="Password"/>
        </div>
        <button type="submit" class="btn">Login</button>
    </form>
|]
