module Web.View.Tweets.Index where
import Web.View.Prelude

data IndexView = IndexView { tweets :: [Tweet] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={TweetsAction}>Tweets</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewTweetAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Tweet</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach tweets renderTweet}</tbody>
            </table>
        </div>
    |]


renderTweet tweet = [hsx|
    <tr>
        <td>{tweet}</td>
        <td><a href={ShowTweetAction (get #id tweet)}>Show</a></td>
        <td><a href={EditTweetAction (get #id tweet)} class="text-muted">Edit</a></td>
        <td><a href={DeleteTweetAction (get #id tweet)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
