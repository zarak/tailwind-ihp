module Web.View.Tweets.Edit where
import Web.View.Prelude

data EditView = EditView { tweet :: Tweet }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TweetsAction}>Tweets</a></li>
                <li class="breadcrumb-item active">Edit Tweet</li>
            </ol>
        </nav>
        <h1>Edit Tweet</h1>
        {renderForm tweet}
    |]

renderForm :: Tweet -> Html
renderForm tweet = formFor tweet [hsx|

    {submitButton}
|]
