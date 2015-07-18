StackBot
=================

Posts new Stack Overflow questions into HipChat using SO email notifications and the SendGrid [Inbound Parse Webhook](https://sendgrid.com/docs/API_Reference/Webhooks/parse.html).

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Usage

Deploy to Heroku using the button above. Make sure to provide the required keys.

Add a new entry to your SendGrid [Inbound Parse Settings](https://app.sendgrid.com/settings/parse). You can either provide your own domain or use `anything-thats-not-taken.bymail.in`. Point it at your Heroku app.



Visit [http://stackexchange.com/filters/new](http://stackexchange.com/filters/new) and create a new filter with your tag. For email address, use `anything@the-domain-you-used-above.bymail.in`.

Open your apps logs

## ENV Vars

```
HIPCHAT_TOKEN=A HipChat v2 API Token
HIPCHAT_ROOMS=A comma separated list of HipChat rooms or ID's. e.g. 'Support Room,Community'
```
