### heroku-alfred

This is a simple [Alfred](https://www.alfredapp.com/) 3 workflow to quickly open the dashboard for your Heroku apps.

![demo](/demo.gif)

### Installation

The workflow assumes you have the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install) installed.  
You can download the `heroku.alfredworkflow` file from the [releases](https://github.com/brianstorti/heroku-alfred/releases) page and open it to import it to Alfred.

### Usage

Open Alfred and type `h {app name}` to search for an app, then just hit `<enter>` to open the dashboard page in your browser. You can also use a regex to filter the list of apps that are shown.

We cache the apps list so we don't need to query Heroku every time, but if you create a new app you will need to run `h-refresh` to update this cache.
