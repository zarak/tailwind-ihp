module Web.View.Tweets.New where
import Web.View.Prelude

data NewView = NewView { tweet :: Tweet }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TweetsAction}>Tweets</a></li>
                <li class="breadcrumb-item active">New Tweet</li>
            </ol>
        </nav>
        <h1>New Tweet</h1>
        {renderForm tweet}
    |]

renderForm :: Tweet -> Html
renderForm tweet = formFor tweet [hsx|

    {submitButton}
|]
