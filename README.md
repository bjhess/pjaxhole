### Overview

**[Pjaxhole](http://pjaxhole.heroku.com/)** is an attempt to play with [Pjax](https://github.com/defunkt/jquery-pjax) using [Sinatra](http://www.sinatrarb.com/) as a data provider.

### What It Is

*   Ajax, with benefits
*   Permalinks, page titles, and back buttons that work
*   Timeout and error failover to traditional web request
*   Call it on a link `$(link).pjax()` or call it like Ajax `$.pjax()`
*   Only works on [browsers supporting](http://caniuse.com/#search=pushstate) `pushState`
*   This shit is slick

#### Is Rails going to turn it into RJS?

I don't think it's really comparable. [The syntax](https://github.com/rails/pjax_rails) is hairy right now, but all it really amounts to is:

*   Define a container for Pjax updates to load into
*   `redirect_pjax_to` in the controller

It is somewhat similar to RJS in that the abstraction is looking ugly. The technique in this Sinatra example seems more clear to me:

*   Write the JS to do Pjax, triggered on links and updating a container
*   Detect Pjax header and avoid rendering layout if it is there

Maybe Rails will come up with a better syntax yet...

#### Steps to explore this example

1. ENJOY! the Pjax jquery plugin source
2. BATHE IN! the Pjaxhole implementation
3. LOOK AT WITH YOUR EYES! Pjaxhole in its full glory
4. SMATTER! questions and discussion

### Credits

Created by Barry Hess.

[Pjax](https://github.com/defunkt/jquery-pjax) is not mine, nor is [Sinatra](http://www.sinatrarb.com/).

Copyright (c) 2011 Barry Hess. Released under the MIT license.

http://pjaxhole.heroku.com/

http://github.com/bjhess/pjaxhole

http://bjhess.com