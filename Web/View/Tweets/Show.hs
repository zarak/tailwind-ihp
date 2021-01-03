module Web.View.Tweets.Show where
import Web.View.Prelude

data ShowView = ShowView { tweet :: Tweet }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TweetsAction}>Tweets</a></li>
                <li class="breadcrumb-item active">Show Tweet</li>
            </ol>
        </nav>
        <h1>Show Tweet</h1>
        <p>{tweet}</p>
    |]
